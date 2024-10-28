package edu.school.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.school.model.Admin;
import edu.school.model.Banner;
import edu.school.model.Baoming;
import edu.school.model.Comment;
import edu.school.model.Referee;
import edu.school.model.Sport;
import edu.school.model.User;
import edu.school.model.Xinwen;
import edu.school.service.BannerService;
import edu.school.service.BaomingService;
import edu.school.service.CommentService;
import edu.school.service.SportService;
import edu.school.service.UserService;
import edu.school.service.XinwenService;
@Controller
public class WebController {
	@Autowired
	 UserService userService;
	@Autowired
	BannerService bannerService;
	@Autowired
	XinwenService xinwenService;
	@Autowired
	SportService sportService;
	@Autowired 
	CommentService commentService;
	@Autowired
	BaomingService baomingService;
	@RequestMapping("/webIndex")
    public ModelAndView webIndex(HttpSession session,ModelMap map ){
		User user = (User)session.getAttribute("user");
		map.put("user", user);
		List<Banner>banners = bannerService.findAll();
		map.put("banners", banners);
		List<Xinwen>xinwens = xinwenService.findAll();
		if(xinwens.size()>5) {
			xinwens= xinwens.subList(0, 4);
		}
		
		map.put("xinwens", xinwens);
		
		List<Sport>sports = sportService.findAll();
		if(sports.size()>5) {
			sports= sports.subList(0, 4);
		}
		
		map.put("sports", sports);
		return new ModelAndView("web/index");
	} 
	//登录
	@RequestMapping("/toWebLogin")
	public String toWebLogin() {
		return "web/login";
	}
	//后台登录
	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "views/login";
	}
	@RequestMapping("/webLogin")
	//处理login.jsp传递的数据进行登陆校验
     public  ModelAndView webLogin(@RequestParam("stuno")String stuno,
		 HttpServletRequest request,@RequestParam("pwd")String pwd,
		 HttpSession session,HttpServletResponse response,ModelAndView mv,ModelMap map) throws ServletException, IOException {			
			User u = userService.findByPwdAndNo(stuno,pwd);
			if(u==null || u.getStatus() == 0){
				mv.addObject("msg", "用户或者密码错误");
				mv.setViewName("web/login");		
			}else{
				session.setAttribute("user", u);	
				List<Banner>banners = bannerService.findAll();
				map.put("banners", banners);
				List<Xinwen>xinwens = xinwenService.findAll();
				if(xinwens.size()>5) {
					xinwens= xinwens.subList(0, 4);
				}
				
				map.put("xinwens", xinwens);
				
				List<Sport>sports = sportService.findAll();
				if(sports.size()>5) {
					sports= sports.subList(0, 4);
				}
				
				map.put("sports", sports);
				mv.setViewName("web/index");						
			}
		
		return mv;
	}
	@RequestMapping("/webLoginOut")
	public String webLoginOut(HttpSession session,ModelMap map) {
		session.removeAttribute("user");
		List<Banner>banners = bannerService.findAll();
		map.put("banners", banners);
		List<Xinwen>xinwens = xinwenService.findAll();
		if(xinwens.size()>5) {
			xinwens= xinwens.subList(0, 4);
		}
		
		map.put("xinwens", xinwens);
		
		List<Sport>sports = sportService.findAll();
		if(sports.size()>5) {
			sports= sports.subList(0, 4);
		}
		
		map.put("sports", sports);
		return "web/index";
	}
	@RequestMapping("/webNews")
	public String webNews(HttpSession session,ModelMap map) {
		List<Xinwen>xinwens = xinwenService.findAll();
		map.put("xinwens", xinwens);
		
		return "web/article";
	}
	@RequestMapping("/webSport")
	public String webSport(HttpSession session,ModelMap map) {
		List<Sport>sports = sportService.findAll();
		map.put("sports", sports);
		
		return "web/sport";
	}
	@RequestMapping("/webNewsDetail")
	public String webNewsDetail(HttpSession session,ModelMap map,Integer id) {
		Xinwen xinwen  = xinwenService.findById(id);
		map.put("xinwen", xinwen);
		List<Comment>comments = commentService.findByNewsId(id);
		map.put("comments", comments);
		return "web/article_details";
	}
	//比赛项目详情
	@RequestMapping("/webSportsDetail")
	public String webSportsDetail(HttpSession session,ModelMap map,Integer id) {
		Sport s  = sportService.findById(id);
		String flag = "f";
		map.put("sport", s);
		User user = (User)session.getAttribute("user");
		if(user != null) {
			List<Baoming>baomings = baomingService.findBySportIdAndUid(id,user.getId());
			if(baomings.size()>0) {
				flag="t";
			}
		}
		map.put("flag",flag);
		return "web/sport_details";
	}
	//报名
	@RequestMapping("/addWebBaoming")
	@ResponseBody
	public String addWebBaoming(HttpSession session,Baoming baoming,ModelMap map)throws Exception {	
		
		String msg="";
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			msg="no";
		}else {
			Sport s = sportService.findById(baoming.getSportId());
			List<Baoming>sports = baomingService.findBySportId(baoming.getSportId());
			if(sports.size()>=s.getAmount()) {
				msg="many";
			}else {
				
				baoming.setUid(user.getId());
				Date nowtime=new Date();
				SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String createTime=simpleDateFormat.format(nowtime);
				baoming.setCreateTime(createTime);
				baoming.setStatus(0);
				baomingService.add(baoming);
				msg="ok";
			}
			
			
		}
		return msg;
	}
	/*添加*/
	@RequestMapping("/addWebComment")
	@ResponseBody
	public String addWebComment(HttpSession session,Comment comment,ModelMap map)throws Exception {	
		String msg="";
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			msg="no";
		}else {
			comment.setuId(user.getId());
			Date nowtime=new Date();
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String createTime=simpleDateFormat.format(nowtime);
			comment.setCreateTime(createTime);
			commentService.add(comment);
			msg="ok";
		}
	
		return msg;
	}
	//登录
		@RequestMapping("/toWebSetInfo")
		public  ModelAndView toWebSetInfo(HttpServletRequest request,
				 HttpSession session,HttpServletResponse response,ModelAndView mv,ModelMap map ) throws ServletException, IOException {			
				User u = (User)session.getAttribute("user");
				if(u==null){
					mv.setViewName("web/login");		
				}else{
					map.put("user", u);		
					mv.setViewName("web/set");						
				}
			
			return mv;
		}
		
		//修改信息
		@RequestMapping("/updateWebUserTX")
		public String updateWebUserTX(HttpServletRequest request,@ModelAttribute User record,ModelMap map)throws Exception{
			System.out.print(record);	
	       User user = userService.findById(record.getId());
	       user.setTx(record.getTx());
	       request.getSession().setAttribute("user", user);
	        userService.update(user);
	        map.put("user", user);
			return "web/set";
		}
		@RequestMapping("/updateWebUserInfo")
		public String updateWebUserInfo(HttpServletRequest request,@ModelAttribute User record,ModelMap map)throws Exception{
			System.out.print(record);	
	       User user = userService.findById(record.getId());
	       user.setPhone(record.getPhone());
	       user.setNickname(record.getNickname());
	       user.setRealname(record.getRealname());
	       user.setSex(record.getSex());
	       user.setBj(record.getBj());
	       user.setGrade(record.getGrade());
	       user.setMajor(record.getMajor());
	        userService.update(user);
	        map.put("user", user);
			return "web/set";
		}
		@RequestMapping("/updateWebUserPwd")
		public String updateWebUserPwd(HttpServletRequest request,@ModelAttribute User record,ModelMap map)throws Exception{
			System.out.print(record);	
	       User user = userService.findById(record.getId());
	       user.setPwd(record.getPwd());
	       request.getSession().setAttribute("user", user);
	        userService.update(user);
	        map.put("user", user);
			return "web/set";
		}
		@RequestMapping("/toMyWebComment")
		public  ModelAndView toMyWebComment(HttpServletRequest request,
				 HttpSession session,HttpServletResponse response,ModelAndView mv,ModelMap map ) throws ServletException, IOException {			
				User u = (User)session.getAttribute("user");
				if(u==null){
					mv.setViewName("web/login");		
				}else{
					map.put("user", u);	
					List<Comment>comments = commentService.findMyAll(u.getId());
					map.put("comments", comments);	
					mv.setViewName("web/comment");						
				}
			
			return mv;
		}
		//删除
				@RequestMapping("/deleteWebComment")
				@ResponseBody
				public String deleteWebComment(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
					commentService.delete(id);
					return "ok";
				}
				
				@RequestMapping("/toMyWebSport")
				public  ModelAndView toMyWebSport(HttpServletRequest request,
						 HttpSession session,HttpServletResponse response,ModelAndView mv,ModelMap map ) throws ServletException, IOException {			
						User u = (User)session.getAttribute("user");
						if(u==null){
							mv.setViewName("web/login");		
						}else{
							map.put("user", u);	
							List<Baoming>baomings = baomingService.findMyAll(u.getId());
							map.put("baomings", baomings);	
							mv.setViewName("web/my_sport");						
						}
					
					return mv;
				}
				
				
				//注册
				
				//登录
				@RequestMapping("/toWebRegister")
				public String toWebRegister() {
					return "web/register";
				}
				@RequestMapping("/webRegister")
			     public  ModelAndView webRegister(HttpServletRequest request,User user,ModelAndView mv) throws ServletException{			
					List<User>users = userService.findByNo(user.getStuno());
					
					Date nowtime=new Date();		
					try {
						SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
						String createTime=simpleDateFormat.format(nowtime);
						System.out.println(createTime);
						user.setRegiste_time(createTime);			
					}catch(Exception e) {};	
						if(users.size()>0){
							mv.addObject("msg", "学号重复 ，请重试");
							mv.setViewName("web/register");		
						}else{
							user.setStatus(0);
							userService.insert(user);
							mv.setViewName("web/login");						
						}
						
					
					return mv;
				}	
}