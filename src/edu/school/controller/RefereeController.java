package edu.school.controller;

import java.io.File;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.school.model.Referee;
import edu.school.service.RefereeService;
import edu.school.utils.FileNameUtil;


//裁判员控制层
@Controller
public class RefereeController {
	
	@Autowired 
	RefereeService refereeService;
    String saveFileName = "";
    
  //异步ajax文件上传处理
    @ResponseBody
    @RequestMapping("/addRefereeImg.action")
    public Object ajaxImg(MultipartFile pimage, HttpServletRequest request) {
        //提取生成文件名UUID+上传图片的后缀.jpg  .png
        saveFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(pimage.getOriginalFilename());
        System.out.print(saveFileName);
        //saveFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(pimage.getOriginalFilename());
        //得到项目中图片存储的路径
        String path = request.getServletContext().getRealPath("/upload");
        //转存  E:\idea_workspace\mimissm\image_big\23sdfasferafdafdadfasfdassf.jpg
        try {
            pimage.transferTo(new File(path + File.separator + saveFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //返回客户端JSON对象,封装图片的路径,为了在页面实现立即回显
        JSONObject object = new JSONObject();
        object.put("imgurl", saveFileName);
        return object.toString();
    }
    
 

	//分页显示信息
	@RequestMapping("/RefereePageAct")
    public ModelAndView newsPage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,8);
		List<Referee> list=refereeService.findAll();
		PageInfo<Referee> pageInfo=new PageInfo<Referee>(list,8);
		map.put("pageInfo", pageInfo);
		return new ModelAndView("referee/list_referee");
	} 
	  //多条件查询
		@RequestMapping("/findByRefereeMap")
	    public ModelAndView findByRefereeMap(HttpServletRequest request){
			Map<String,Object> paramterMap=new HashMap<String, Object>();
			paramterMap.put("name", request.getParameter("name"));	
			List<Referee> list=refereeService.findByRefereeMap(paramterMap);			
			request.setAttribute("list", list);
			return new ModelAndView("referee/referee_list");
		} 
		
		//删除
		@RequestMapping("/deleteRefereeAct")
		@ResponseBody
		public String deleteBannerAct(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			refereeService.delete(id);
			return "ok";
		}
		
		//表单回显
		@RequestMapping("/toUpdateRefereeAct")
		public String toUpdateProductAct (@Param("id") Integer id,HttpServletRequest request){
			System.out.println("请求已经到达");
			System.out.println(id);
			Referee record=refereeService.findById(id);
			request.setAttribute("record", record);
			return "referee/edit_referee";
		}
		
		
		
		
		//修改信息
		/*@RequestMapping("/updateRefereeAct")
		@ResponseBody
		public String updateRefereeAct(HttpServletRequest request,@ModelAttribute Referee record)throws Exception{
			System.out.print(record);	
			refereeService.update(record);
			return "ok";
		}*/
		
		   @RequestMapping("/updateRefereeAct")
			public String updateProduct(HttpServletRequest request,@ModelAttribute Referee record)throws Exception{
				System.out.print(record);	
				 //因为ajax的异步图片上传,如果有上传过,
		        // 则saveFileName里有上传上来的图片的名称,
		        // 如果没有使用异步ajax上传过图片,则saveFileNme="",
		        // 实体类info使用隐藏表单域提供上来的pImage原始图片的名称;
		        if (!saveFileName.equals("")) {
		        	record.setPhoto(saveFileName);
		        }
		        refereeService.update(record);
				saveFileName = "";
				return "forward:/RefereePageAct";
				
			}
	
		
		
		//添加
		@RequestMapping("/addRefereeAct")
		public String addRefereeAct( HttpSession session,Referee referee)throws Exception {	
			
			refereeService.add(referee);
			return "redirect:/RefereePageAct";
		}
		
		/*@RequestMapping("/addProductAct")
		public String addProduct(HttpServletRequest request,Referee referee)throws Exception {
			referee.setPhoto(saveFileName);
			System.out.println(referee.getPhoto()+">>>>>>>>>>>>>>>>>>>"+saveFileName);		
				refereeService.add(referee);
			//清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
	        saveFileName = "";
	        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
			return "forward:/RefereePageAct";
		}
		*/
		
		
		//跳转到添加
		@RequestMapping("/toAddRefereeAct")
		public String toAddAct () throws IOException{		
			return "referee/add_referee";
		}
		
		
}
