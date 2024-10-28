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
import javax.servlet.http.HttpSession;

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

import edu.school.model.Admin;
import edu.school.model.Banner;
import edu.school.model.Category;
import edu.school.model.Product;
import edu.school.model.Sport;
import edu.school.model.User;
import edu.school.model.Xinwen;
import edu.school.service.BannerService;
import edu.school.service.CategoryService;
import edu.school.service.ProductService;
import edu.school.service.SportService;
import edu.school.service.XinwenService;
import edu.school.utils.FileNameUtil;



@Controller
public class NewsController {
	
	@Autowired 
	XinwenService newsService;
	

	//分页显示信息
	@RequestMapping("/newsPage")
    public ModelAndView newsPage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,8);
		List<Xinwen> list=newsService.findAll();
		PageInfo<Xinwen> pageInfo=new PageInfo<Xinwen>(list,8);
		
		map.put("pageInfo", pageInfo);
		return new ModelAndView("news/list_news");
	} 
	//多条件查询
		@RequestMapping("/findByNewsMap")
	    public ModelAndView findByBannerMap(HttpServletRequest request){
			Map<String,Object> paramterMap=new HashMap<String, Object>();
			paramterMap.put("title", request.getParameter("title"));	
			List<Xinwen> list=newsService.findByProductMap(paramterMap);				
			request.setAttribute("list", list);
			return new ModelAndView("news/news_list");
		} 
		
		//删除
		@RequestMapping("/deleteNewsAct")
		@ResponseBody
		public String deleteBannerAct(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			newsService.delete(id);
			return "ok";
		}
		
		//表单回显
		@RequestMapping("/toUpdateNewsAct")
		public String toUpdateProductAct (@Param("id") Integer id,HttpServletRequest request){
			System.out.println("请求已经到达");
			System.out.println(id);
			Xinwen record=newsService.findById(id);
			request.setAttribute("record", record);
			return "news/edit_news";
		}
		
		
		
		
		//修改信息
		@RequestMapping("/updateNewsAct")
		@ResponseBody
		public String updateBannerAct(HttpServletRequest request,@ModelAttribute Xinwen record)throws Exception{
			System.out.print(record);	
			 //因为ajax的异步图片上传,如果有上传过,
	        // 则saveFileName里有上传上来的图片的名称,
	        // 如果没有使用异步ajax上传过图片,则saveFileNme="",
	        // 实体类info使用隐藏表单域提供上来的pImage原始图片的名称;
			Xinwen x = newsService.findById(record.getId());
			x.setPhoto(record.getPhoto());
			x.setContent(record.getContent());
			x.setTitle(record.getTitle());
			newsService.update(x);
			return "ok";
		}
		
	
		
		
		/*添加*/
		@RequestMapping("/addNewsAct")
		public String addNewsAct( HttpSession session,Xinwen news)throws Exception {	
			Date nowtime=new Date();
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String createTime=simpleDateFormat.format(nowtime);
			news.setCreateTime(createTime);
			Admin admin= (Admin)session.getAttribute("admin");	
			news.setEditor(admin.getId());
			newsService.add(news);
			return "redirect:/newsPage";
		}
		
		
		//跳转到添加
		@RequestMapping("/toAddNewsAct")
		public String toAddAct () throws IOException{		
			return "news/add_news";
		}
		
		
}
