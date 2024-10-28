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
import edu.school.model.Baoming;
import edu.school.model.Category;
import edu.school.model.Product;
import edu.school.model.Score;
import edu.school.model.Sport;
import edu.school.model.User;
import edu.school.service.BannerService;
import edu.school.service.BaomingService;
import edu.school.service.CategoryService;
import edu.school.service.ProductService;
import edu.school.service.ScoreService;
import edu.school.service.SportService;
import edu.school.utils.FileNameUtil;



@Controller
public class BaomingController {
	
	@Autowired 
	BaomingService baomingService;
	@Autowired 
	ScoreService scoreService;

	//分页显示信息
	@RequestMapping("/baomingPage")
    public ModelAndView baomingPage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,8);
		List<Baoming> list=baomingService.findAll();
		PageInfo<Baoming> pageInfo=new PageInfo<Baoming>(list,8);
		
		map.put("pageInfo", pageInfo);
		return new ModelAndView("baoming/list_baoming");
	} 
	//多条件查询
		@RequestMapping("/findByBaomingMap")
	    public ModelAndView findByBfindByBaomingMapannerMap(HttpServletRequest request){
			Map<String,Object> paramterMap=new HashMap<String, Object>();
			paramterMap.put("sname", request.getParameter("sname"));	
			List<Baoming> list=baomingService.findByProductMap(paramterMap);				
			request.setAttribute("list", list);
			return new ModelAndView("baoming/baoming_list");
		} 
		
		//删除
		@RequestMapping("/deleteBaomingAct")
		@ResponseBody
		public String deleteBaomingAct(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			baomingService.delete(id);
			return "ok";
		}
		
		//表单回显
		@RequestMapping("/toUpdateBaomingAct")
		public String toUpdateBaomingAct (@Param("id") Integer id,HttpServletRequest request){
			System.out.println("请求已经到达");
			System.out.println(id);
			Baoming record=baomingService.findById(id);
			request.setAttribute("baoming", record);
			return "baoming/edit_baoming";
		}
		
		
		
		
		//修改信息
		@RequestMapping("/updateBaomingAct")
		public String updateBaomingAct(HttpServletRequest request,@ModelAttribute Baoming record)throws Exception{
			System.out.print(record);	
			 //因为ajax的异步图片上传,如果有上传过,
	        // 则saveFileName里有上传上来的图片的名称,
	        // 如果没有使用异步ajax上传过图片,则saveFileNme="",
	        // 实体类info使用隐藏表单域提供上来的pImage原始图片的名称;
	       
			baomingService.update(record);
			return "forward:/baomingPage";
		}
		
	
		
		
		/*添加*/
		@RequestMapping("/addBaomingAct")
		public String addBaomingAct(Baoming baoming)throws Exception {	
			
			baomingService.add(baoming);
			return "redirect:/baomingPage";
		}
		
		
		//跳转到添加
		@RequestMapping("/toAddBaomingAct")
		public String toAddBaomingAct () throws IOException{		
			return "baoming/add_baoming";
		}
		
		
		@RequestMapping("/shenheBaoming")
		@ResponseBody
		public String shenheBaoming(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			Baoming bm = baomingService.findById(id);
			bm.setStatus(1);
			baomingService.update(bm);
			Score s = new Score();
			s.setBaomingId(id);
			scoreService.add(s);
			return "ok";
		}
		@RequestMapping("/shenheBaoming1")
		@ResponseBody
		public String shenheBaoming2(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			Baoming bm = baomingService.findById(id);
			bm.setStatus(2);
			baomingService.update(bm);
			return "ok";
		}
}
