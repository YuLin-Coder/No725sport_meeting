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
import edu.school.model.Comment;
import edu.school.model.Product;
import edu.school.model.Sport;
import edu.school.model.User;
import edu.school.service.BannerService;
import edu.school.service.CategoryService;
import edu.school.service.CommentService;
import edu.school.service.ProductService;
import edu.school.service.SportService;
import edu.school.utils.FileNameUtil;



@Controller
public class CommentController {
	
	@Autowired 
	CommentService commentService;
	

	//分页显示商品信息
	@RequestMapping("/commentPage")
    public ModelAndView bannerPage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,8);
		List<Comment> list=commentService.findAll();
		PageInfo<Comment> pageInfo=new PageInfo<Comment>(list,8);
		
		map.put("pageInfo", pageInfo);
		return new ModelAndView("comment/list_comment");
	} 
	//多条件查询
		@RequestMapping("/findByCommentMap")
	    public ModelAndView findByBannerMap(HttpServletRequest request){
			Map<String,Object> paramterMap=new HashMap<String, Object>();
			paramterMap.put("title", request.getParameter("title"));	
			List<Comment> list=commentService.findByProductMap(paramterMap);				
			request.setAttribute("list", list);
			return new ModelAndView("comment/comment_list");
		} 
		
		//删除
		@RequestMapping("/deleteCommentAct")
		@ResponseBody
		public String deleteBannerAct(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			commentService.delete(id);
			return "ok";
		}
		
		//表单回显
		@RequestMapping("/toUpdateCommentAct")
		public String toUpdateProductAct (@Param("id") Integer id,HttpServletRequest request){
			System.out.println("请求已经到达");
			System.out.println(id);
			Comment record=commentService.findById(id);
			request.setAttribute("comment", record);
			return "comment/edit_comment";
		}
		
		
		
		
		//修改信息
		@RequestMapping("/updateCommentAct")
		public String updateBannerAct(HttpServletRequest request,@ModelAttribute Comment record)throws Exception{
			System.out.print(record);	
			 //因为ajax的异步图片上传,如果有上传过,
	        // 则saveFileName里有上传上来的图片的名称,
	        // 如果没有使用异步ajax上传过图片,则saveFileNme="",
	        // 实体类info使用隐藏表单域提供上来的pImage原始图片的名称;
	       
			commentService.update(record);
			return "forward:/commentPage";
		}
		
	
		
		
		/*添加*/
		@RequestMapping("/addCommentAct")
		public String addCommentAct(Comment comment)throws Exception {	
			
			commentService.add(comment);
			return "redirect:/commentPage";
		}
		
		
		//跳转到添加
		@RequestMapping("/toAddCommentAct")
		public String toAddAct () throws IOException{		
			return "comment/add_comment";
		}
		
		
}
