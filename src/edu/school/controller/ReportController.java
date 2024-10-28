package edu.school.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
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
import edu.school.model.Score;
import edu.school.model.ScoreDemo;
import edu.school.model.Sport;
import edu.school.model.User;
import edu.school.model.Xinwen;
import edu.school.service.BannerService;
import edu.school.service.BaomingService;
import edu.school.service.CommentService;
import edu.school.service.ScoreService;
import edu.school.service.SportService;
import edu.school.service.UserService;
import edu.school.service.XinwenService;
@Controller
public class ReportController {
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
	@Autowired
	ScoreService scoreService;
	@RequestMapping("/report1")
    public ModelAndView webIndex(HttpSession session,ModelMap map ){
		
		return new ModelAndView("report/report1");
	} 
	@RequestMapping("/report1Data")
	@ResponseBody
	public Map<Integer, Integer> report1Data(){
		Map<Integer, Integer> map = new HashedMap();
		List<Sport> sports = sportService.findAll();
		for(Sport s : sports) {
			if(!map.containsKey(s.getYear())) {
				map.put(s.getYear(),1);
			}else {
				Integer ss = map.get(s.getYear());
				map.put(s.getYear(),ss+1);
			}
		}
		
		return map;
	}
	@RequestMapping("/report2")
    public ModelAndView report2(HttpSession session,ModelMap map ){
		List<Sport>sports = sportService.findAll();
		List<ScoreDemo> list= new ArrayList<>();
			if (sports.size()>0&&sports!=null) {
				for(Sport s : sports) {
					ScoreDemo demo = new ScoreDemo();
					Integer id = s.getId();
					List<Score> ss = scoreService.findByScore(id);
					if (ss.size()>0&&ss!=null) {
						Score  first = ss.get(0);
						if (first!=null) {
							demo.setSname(first.getTname());
							demo.setSdate(first.getTdate());
							demo.setFname(first.getUname());
							demo.setFmingci(first.getMingci());
						}
						
						Score  last = ss.get(ss.size()-1);
						if (last!=null) {
							demo.setLname(last.getUname());
							demo.setLmingci(last.getMingci());
						}
						
					}
					
					
					
//					if(list.size()>0) {
//						Score  last = ss.get(ss.size()-1);
//						demo.setLname(last.getUname());
//						demo.setLmingci(last.getMingci());
//					}else {
//						Score  last = ss.get(ss.size());
//						demo.setLname(last.getUname());
//						demo.setLmingci(last.getMingci());
//					}
				
					list.add(demo);
			}
		
			
		}
	
		map.put("list", list);
		return new ModelAndView("report/report2");
	} 
	@RequestMapping("/report3")
    public ModelAndView report3(HttpSession session,ModelMap map ){
		
		return new ModelAndView("report/report3");
	} 
	@RequestMapping("/report3Data")
	@ResponseBody
	public Map<String, Integer> report3Data(){
		Map<String, Integer> map = new HashedMap();
		List<Sport> sports = sportService.findAll();
		for(Sport s : sports) {
			List<Baoming>baomings = baomingService.findBySportId(s.getId()); 
			map.put(s.getName(), baomings.size());
		}
		
		return map;
	}
}