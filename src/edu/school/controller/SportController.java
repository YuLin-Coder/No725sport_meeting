package edu.school.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.school.model.Banner;
import edu.school.model.Category;
import edu.school.model.Product;
import edu.school.model.Referee;
import edu.school.model.Sport;
import edu.school.service.CategoryService;
import edu.school.service.ProductService;
import edu.school.service.RefereeService;
import edu.school.service.SportService;
import edu.school.utils.FileNameUtil;



@Controller
public class SportController {
	@Autowired 
	ProductService service;
	
	@Autowired 
	CategoryService cs;
	@Autowired 
	SportService sportService;
	@Autowired 
	RefereeService refereeService;
	
	
	 //异步上传的图片的名称
    String saveFileName = "";
    
	
	
	//教练员跳转页面
	/*@RequestMapping("/refereeToSport")
	public String refereeToSport(HttpServletRequest request)throws Exception{
		
		
		return "referee/list_sport";
	}*/

	//我的裁判项目
	@RequestMapping("/refereeToSportPage")
    public ModelAndView refereeToSportPage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,8);
		Referee r=(Referee) request.getSession().getAttribute("rf");
		List<Sport> list=sportService.findMySport(r.getId());
		PageInfo<Sport> pageInfo=new PageInfo<Sport>(list,8);
		
		map.put("pageInfo", pageInfo);
		return new ModelAndView("referee/my_sport_list");
	} 
	//教练员多条件查询
		@RequestMapping("/findBySportMap")
	    public ModelAndView findBySportMap(HttpServletRequest request){
			Map<String,Object> paramterMap=new HashMap<String, Object>();
			paramterMap.put("name", request.getParameter("name"));	
			List<Sport> list=sportService.findByProductMap(paramterMap);				
			request.setAttribute("list", list);
			return new ModelAndView("referee/sport_list");
		} 
		
		//分页管理员显示信息
		@RequestMapping("/adminToSportPage")
	    public ModelAndView adminToSportPage(
				@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
				Map<String,Object> map){
			PageHelper.startPage(currentPage,8);
			List<Sport> list=sportService.findAll();
			PageInfo<Sport> pageInfo=new PageInfo<Sport>(list,8);
			
			map.put("pageInfo", pageInfo);
			return new ModelAndView("admin/list_sport");
		} 
		//教练员多条件查询
			@RequestMapping("/findAdminBySportMap")
		    public ModelAndView findAdminBySportMap(HttpServletRequest request){
				Map<String,Object> paramterMap=new HashMap<String, Object>();
				paramterMap.put("name", request.getParameter("name"));	
				List<Sport> list=sportService.findByProductMap(paramterMap);				
				request.setAttribute("list", list);
				return new ModelAndView("admin/sport_list");
			} 
			
			
			
			//删除
			@RequestMapping("/deleteSportAct")
			@ResponseBody
			public String deleteSportAct(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
				sportService.delete(id);
				return "ok";
			}
			
			//表单回显
			@RequestMapping("/toUpdateSportAct")
			public String toUpdateSportAct (@Param("id") Integer id,HttpServletRequest request,ModelMap map){
				System.out.println("请求已经到达");
				System.out.println(id);
				Sport record=sportService.findById(id);
				request.setAttribute("sport", record);
				List<Referee> referees = refereeService.findAll();
				map.put("referees", referees);
				return "admin/edit_sport";
			}
			
			
			
			
			//修改信息
			@RequestMapping("/updateSportAct")
			public String updateSportAct(HttpServletRequest request,@ModelAttribute Sport record)throws Exception{
				System.out.print(record);	
				 //因为ajax的异步图片上传,如果有上传过,
		        // 则saveFileName里有上传上来的图片的名称,
		        // 如果没有使用异步ajax上传过图片,则saveFileNme="",
		        // 实体类info使用隐藏表单域提供上来的pImage原始图片的名称;
		       
				sportService.update(record);
				return "forward:/adminToSportPage";
			}
			
			/*添加*/
			@RequestMapping("/addSportsAct")
			public String addSportsAct(Sport sport)throws Exception {	
				
				sportService.add(sport);
				return "redirect:/adminToSportPage";
			}
			
			
			//跳转到添加
			@RequestMapping("/toAddSportAct")
			public String toAddSportAct (ModelMap map) throws IOException{	
				
				List<Referee> referees = refereeService.findAll();
				map.put("referees", referees);
				return "admin/add_sport";
			}
}
