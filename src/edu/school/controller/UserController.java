package edu.school.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import edu.school.model.User;
import edu.school.service.UserService;




@Controller
public class UserController {
	@Autowired 
	UserService service;
	
	
	/*添加用户*/
	@RequestMapping("/addUserAct")
	public String addUser(User user)throws Exception {	
		Date nowtime=new Date();		
		try {
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
			String createTime=simpleDateFormat.format(nowtime);
			System.out.println(createTime);
			user.setRegiste_time(createTime);			
		}catch(Exception e) {};
		service.insert(user);
		return "redirect:/UserPageAct";
	}
	

	
	
	//跳转到添加用户节目
	@RequestMapping("/toAddUserAct")
	public String toAddAct () throws IOException{		
		return "user/add_user";
	}
	
	
	

	//表单回显用户信息
	@RequestMapping("/toUpdateUserAct")
	public String toUpdateUserAct (@Param("id") Integer id,HttpServletRequest request){
		System.out.println("请求已经到达");
		System.out.println(id);
		User record=service.findById(id);
		request.setAttribute("user", record);
		return "user/edit_user";
	}
	
	
	
	
	//修改用户信息
	@RequestMapping("/updateUserAct")
	public String updateUser(User user,HttpServletRequest request)throws Exception{
		service.update(user);
		/*request.getSession().setAttribute("user", user);*/
		return "redirect:/UserPageAct";
	}
	

	//删除用户信息
	@RequestMapping("/deleteUserAct")
	public String delete(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
		service.delete(id);
		return "redirect:/UserPageAct";
	}
	
	
	//分页显示用户信息
	@RequestMapping("/UserPageAct")
    public ModelAndView UserPage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,6);
		List<User> list=service.selectAll();
		PageInfo<User> pageInfo=new PageInfo<User>(list,8);
		map.put("pageInfo", pageInfo);
		return new ModelAndView("user/user_list");
	} 
	
	//多条件查询
	@RequestMapping("/findByUserMap")
    public ModelAndView findByUserMap(HttpServletRequest request){
		Map<String,Object> paramterMap=new HashMap<String, Object>();
		paramterMap.put("phone", request.getParameter("phone"));	
		paramterMap.put("nickname", request.getParameter("nickname"));	
		List<User> list=service.findByUserMap(paramterMap);
		request.setAttribute("list", list);
		return new ModelAndView("user/list_user");
	} 
	//删除用户信息
		@RequestMapping("/shenheUser")
		@ResponseBody
		public String shenheUser(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			User user = service.findById(id);
			user.setStatus(1);
			service.update(user);
			return "ok";
		}
		@RequestMapping("/shenheUser1")
		@ResponseBody
		public String shenheUser1(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
			User user = service.findById(id);
			user.setStatus(2);
			service.update(user);
			return "ok";
		}
}
