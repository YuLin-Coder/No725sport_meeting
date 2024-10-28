package edu.school.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.school.model.Banner;
import edu.school.model.Category;
import edu.school.model.Product;
import edu.school.model.Sport;
import edu.school.model.User;
import edu.school.service.BannerService;
import edu.school.service.CategoryService;
import edu.school.service.ProductService;
import edu.school.service.SportService;
import edu.school.utils.FileNameUtil;



@Controller
public class BannerController {
	
	@Autowired 
	BannerService bannerService;
	
	
	/*添加*/
	@RequestMapping(value="/addPhotoAct",method = {RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object>  addBannerAct( HttpServletRequest request, HttpServletResponse response,@RequestParam(value="file",required=false) MultipartFile file)throws Exception {	
		    String prefix="";
		    String dateStr="";
		    //保存上传
		     OutputStream out = null;
		    InputStream fileInput=null;
		    String filepath = "";
		    String originalName ="";
		    try{
		        if(file!=null){
		             originalName = file.getOriginalFilename();
		            prefix=originalName.substring(originalName.lastIndexOf(".")+1);
		            dateStr =  System.currentTimeMillis()/ 1000 + ""; 
		             filepath = request.getSession().getServletContext().getRealPath("/upload/") +dateStr+"." + prefix;
		            filepath = filepath.replace("\\", "/");
		            File files=new File(filepath);
		            //打印查看上传路径
		            System.out.println(filepath);
		            if(!files.getParentFile().exists()){
		                files.getParentFile().mkdirs();
		            }
		            file.transferTo(files);
		        }
		    }catch (Exception e){
		    }finally{
		        try {
		            if(out!=null){
		                out.close();
		            }
		            if(fileInput!=null){
		                fileInput.close();
		            }
		        } catch (IOException e) {
		        }
		    }
		    Map<String,Object> map2=new HashMap<>();
		    Map<String,Object> map=new HashMap<>();
		    map.put("code",0);
		    map.put("msg","1");
		    map.put("data",map2);
		    map2.put("src",dateStr+"."+prefix);
		return map;
	}
    
	
	

	//分页显示商品信息
	@RequestMapping("/bannerPage")
    public ModelAndView bannerPage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,8);
		List<Banner> list=bannerService.findAll();
		PageInfo<Banner> pageInfo=new PageInfo<Banner>(list,8);
		
		map.put("pageInfo", pageInfo);
		return new ModelAndView("banner/list_banner");
	} 
	//多条件查询
		@RequestMapping("/findByBannerMap")
	    public ModelAndView findByBannerMap(HttpServletRequest request){
			Map<String,Object> paramterMap=new HashMap<String, Object>();
			paramterMap.put("title", request.getParameter("title"));	
			List<Banner> list=bannerService.findByProductMap(paramterMap);				
			request.setAttribute("list", list);
			return new ModelAndView("banner/banner_list");
		} 
		
		//删除
		@RequestMapping("/deleteBannerAct")
		@ResponseBody
		public String deleteBannerAct(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			bannerService.delete(id);
			return "ok";
		}
		
		//表单回显
		@RequestMapping("/toUpdateBannerAct")
		public String toUpdateProductAct (@Param("id") Integer id,HttpServletRequest request){
			System.out.println("请求已经到达");
			System.out.println(id);
			Banner record=bannerService.findById(id);
			request.setAttribute("banner", record);
			return "banner/edit_banner";
		}
		
		
		
		
		//修改信息
		@RequestMapping("/updateBannerAct")
		public String updateBannerAct(HttpServletRequest request,@ModelAttribute Banner record)throws Exception{
			System.out.print(record);	
			 //因为ajax的异步图片上传,如果有上传过,
	        // 则saveFileName里有上传上来的图片的名称,
	        // 如果没有使用异步ajax上传过图片,则saveFileNme="",
	        // 实体类info使用隐藏表单域提供上来的pImage原始图片的名称;
	       
	        bannerService.update(record);
			return "forward:/bannerPage";
		}
		
	
		
		
		/*添加*/
		@RequestMapping("/addBannerAct")
		public String addBannerAct(Banner banner)throws Exception {	
			
			bannerService.add(banner);
			return "redirect:/bannerPage";
		}
		
		
		//跳转到添加
		@RequestMapping("/toAddBannerAct")
		public String toAddAct () throws IOException{		
			return "banner/add_banner";
		}
		
		
}
