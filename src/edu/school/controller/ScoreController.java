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
public class ScoreController {
	
	@Autowired 
	ScoreService scoreService;
	

	//分页显示信息
	@RequestMapping("/scorePage")
    public ModelAndView scorePage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,8);
		List<Score> list=scoreService.findAll();
		PageInfo<Score> pageInfo=new PageInfo<Score>(list,8);
		
		map.put("pageInfo", pageInfo);
		return new ModelAndView("referee/list_score");
	} 
	//多条件查询
		@RequestMapping("/findByScoreMap")
	    public ModelAndView findByBfindByBaomingMapannerMap(HttpServletRequest request){
			Map<String,Object> paramterMap=new HashMap<String, Object>();
			paramterMap.put("tname", request.getParameter("tname"));	
			List<Score> list=scoreService.findByProductMap(paramterMap);				
			request.setAttribute("list", list);
			return new ModelAndView("referee/score_list");
		} 
		
		//删除
		/*@RequestMapping("/deleteBaomingAct")
		@ResponseBody
		public String deleteBaomingAct(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			scoreService.delete(id);
			return "ok";
		}*/
		
		
		//表单回显
		@RequestMapping("/toUpdateScoreAct")
		public String toUpdateScoreAct (@Param("id") Integer id,HttpServletRequest request){
			System.out.println("请求已经到达");
			System.out.println(id);
			Score record=scoreService.findById(id);
			request.setAttribute("score", record);
			return "referee/edit_score";
		}
		
		@RequestMapping("/toAddScor")
		public String toAddScor (@Param("id") Integer id,HttpServletRequest request){
			
			return "referee/edit_score";
		}
		
		
		
		//修改信息
		@RequestMapping("/updateScoreAct")
		public String updateBaomingAct(HttpServletRequest request,@ModelAttribute Score record)throws Exception{
			System.out.print(record);	
			 //因为ajax的异步图片上传,如果有上传过,
	        // 则saveFileName里有上传上来的图片的名称,
	        // 如果没有使用异步ajax上传过图片,则saveFileNme="",
	        // 实体类info使用隐藏表单域提供上来的pImage原始图片的名称;	       
			scoreService.update(record);
			return "forward:/scorePage";
		}
		
	
		
		
}
