package edu.school.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.school.model.Category;
import edu.school.service.CategoryService;



@Controller
public class CategoryController {
	@Autowired 
	CategoryService service;
	
	
	/*添加分类*/
	@RequestMapping("/addCategoryAct")
	@ResponseBody
	public String addCategory(HttpServletRequest request)throws Exception {
		Category record=new Category();
		record.setCname(request.getParameter("cname"));
		record.setNote(request.getParameter("note"));
		service.add(record);
		return "redirect:/CategoryPage";
	}
	
	
	//跳转到添加分类节目
	@RequestMapping("/toAddCategoryAct")
	public String toConsoleAct () throws IOException{		
		return "category/add_category";
	}
	
	
	

	//表单回显分类信息
	@RequestMapping("/toUpdateCategoryAct")
	public String toUpdateCategoryAct (@Param("id") Integer id,HttpServletRequest request){
		System.out.println("请求已经到达");
		System.out.println(id);
		Category record=service.findById(id);
		request.setAttribute("category", record);
		return "category/edit_category";
	}
	
	
	
	
	//修改分类信息
	@RequestMapping("/updateCategoryAct")
	public String updateCategory(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
		Category record=new Category();
		record.setCname(request.getParameter("cname"));
		record.setNote(request.getParameter("note"));
		record.setId(id);
		service.update(record);
		return "redirect:/CategoryPageAct";
	}
	

	//删除分类信息
	@RequestMapping("/deleteCategoryAct")
	@ResponseBody
	public String delete(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
		service.delete(id);
		return "ok";
	}
	
	
	//分页显示分类信息
	@RequestMapping("/CategoryPageAct")
    public ModelAndView CategoryPage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,8);
		List<Category> list=service.findAll();
		PageInfo<Category> pageInfo=new PageInfo<Category>(list,8);
		map.put("pageInfo", pageInfo);
		return new ModelAndView("category/category_list");
	} 
	
	//多条件查询
	@RequestMapping("/findByCategoryMap")
    public ModelAndView findByCategoryMap(HttpServletRequest request){
		Map<String,Object> paramterMap=new HashMap<String, Object>();
		paramterMap.put("cname", request.getParameter("cname"));	
		List<Category> list=service.findByCategoryMap(paramterMap);				
		request.setAttribute("list", list);
		return new ModelAndView("category/list_category");
	} 

}
