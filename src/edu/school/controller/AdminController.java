package edu.school.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.school.model.Admin;
import edu.school.model.Referee;
import edu.school.model.User;
import edu.school.service.AdminService;
import edu.school.service.RefereeService;
import edu.school.service.UserService;



@Controller
public class AdminController {
	@Autowired 
	AdminService as;		
	@Autowired
	RefereeService rs;
	@Autowired
	 UserService userService;
	//管理员编辑个人信息
	@RequestMapping("/findMyInfoAct")
	public String toEditAdminAct (@RequestParam("id") Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Admin record=as.findById(id);
		request.setAttribute("admin", record);
		return "views/edit_admin";
	}
	//教练员编辑个人信息
		@RequestMapping("/findRfMyInfoAct")
		public String toEditRfAct (@RequestParam("id") Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException{
			Referee record=rs.findById(id);
			request.setAttribute("rf", record);
			return "views/edit_rfadmin";
		}

		
	//跳转到控制台
	@RequestMapping("/toConsoleAct")
	public String toConsoleAct () throws IOException{		
		return "views/console";
	}

	
	
	//修改管理员信息
	@RequestMapping("/updateAdminAct")
	public String updateAdmin(HttpServletRequest request,HttpServletResponse response,@RequestParam("id") Integer id)throws Exception{
		
		Admin user=(Admin)request.getSession().getAttribute("admin");
		if(user==null) {
			PrintWriter out = response.getWriter();					
			out.write("<script>");
			out.write("alert('please login ')");
			out.write("location.href='toLoginOutAct'");
			out.write("</script>");			
			
		}
		String pwd=request.getParameter("pwd");
		String nickname=request.getParameter("nickname");
		Admin record=new Admin();
		record.setNickname(nickname);
		record.setPwd(pwd);
		boolean b=as.update(record);	
		return "views/update_success";
	}
	//修改管理员信息
		@RequestMapping("/updateRefereeInfoAct")
		public String updateRefereeInfoAct(HttpServletRequest request,HttpServletResponse response,Referee referee)throws Exception{
			
			
			
			rs.update(referee);	
			request.setAttribute("rf", referee);
			return "views/edit_rfadmin";
		}
	@RequestMapping("toLoginOutAct")
	public String toLoginOutAct(HttpSession session) {
		session.removeAttribute("uname");
		session.removeAttribute("type");
		session.removeAttribute("id");
		return "views/login";
	}
	
	//后台登录
	@RequestMapping("/loginAct")
	//处理login.jsp传递的数据进行登陆校验
     public  ModelAndView login(@RequestParam("username")String username,
    		 HttpServletRequest request,@RequestParam("pwd")String pwd,@RequestParam("type")String type,
    		 HttpSession session,HttpServletResponse response,ModelAndView mv) throws ServletException, IOException {			
			System.out.println (username+"*********************"+pwd+"*********************"+type);	
			if(StringUtils.equals(type, "2")) {
				Referee rf=rs.findByUserNameAndPwd(username, pwd);			
				if(rf==null){
					mv.addObject("msg", "用户或者密码错误");
					mv.setViewName("views/login");		
				}else{
					session.setAttribute("rf", rf);		
					mv.setViewName("views/rfmain");						
				}
			
			}else {
				Admin admin=as.findByUserNameAndPwd(username, pwd);			
				if(admin==null){
					mv.addObject("msg", "用户或者密码错误");
					mv.setViewName("views/login");		
				}else{
					session.setAttribute("admin", admin);		
					mv.setViewName("views/main");						
				}
			}
			
			return mv;
}
}
