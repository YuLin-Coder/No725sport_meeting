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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.school.model.Category;
import edu.school.model.Product;
import edu.school.service.CategoryService;
import edu.school.service.ProductService;
import edu.school.utils.FileNameUtil;



@Controller
public class ProductController {
	@Autowired 
	ProductService service;
	
	@Autowired 
	CategoryService cs;
	 //异步上传的图片的名称
    String saveFileName = "";
    
  //异步ajax文件上传处理
    @ResponseBody
    @RequestMapping("/ajaxImg.action")
    public Object ajaxImg(MultipartFile pimage, HttpServletRequest request) {
        //提取生成文件名UUID+上传图片的后缀.jpg  .png
        saveFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(pimage.getOriginalFilename());
        System.out.print(saveFileName);
        //saveFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(pimage.getOriginalFilename());
        //得到项目中图片存储的路径
        String path = request.getServletContext().getRealPath("/upload");
        //转存  E:\idea_workspace\mimissm\image_big\23sdfasferafdafdadfasfdassf.jpg
        try {
            pimage.transferTo(new File(path + File.separator + saveFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //返回客户端JSON对象,封装图片的路径,为了在页面实现立即回显
        JSONObject object = new JSONObject();
        object.put("imgurl", saveFileName);
        return object.toString();
    }
	
	/*添加商品*/
	@RequestMapping("/addProductAct")
	public String addProduct(HttpServletRequest request,Product product)throws Exception {
		product.setImg_url(saveFileName);
		System.out.println(product.getImg_url()+">>>>>>>>>>>>>>>>>>>"+saveFileName);
		/*Product record=new Product();
		record.setName(request.getParameter("name"));
		record.setDetail(request.getParameter("detail"));
		record.setDw(request.getParameter("dw"));
		record.setImg_url(request.getParameter("pimage"));
		record.setKc(Integer.parseInt(request.getParameter("kc")));
		record.setPrice(Integer.parseInt(request.getParameter("price")));
		record.setC_id(Integer.parseInt(request.getParameter("c_id")));*/
		service.add(product);
		//清空saveFileName变量中的内容,为了下次增加或修改的异步ajax的上传处理
        saveFileName = "";
        //增加成功后应该重新访问数据库,所以跳转到分页显示的action上
		return "forward:/ProductPageAct";
	}
	
	
	//跳转到添加商品
	@RequestMapping("/toAddProductAct")
	public String toAddAct (HttpServletRequest request) throws IOException{	
		List<Category> list=cs.findAll();
		request.setAttribute("list", list);
		return "product/add_product";
	}
	
	
	

	//表单回显商品信息
	@RequestMapping("/toUpdateProductAct")
	public String toUpdateProductAct (@Param("id") Integer id,HttpServletRequest request){
		System.out.println("请求已经到达");
		System.out.println(id);
		Product record=service.findById(id);
		List<Category> list=cs.findAll();
		request.setAttribute("list", list);
		request.setAttribute("product", record);
		return "product/edit_product";
	}
	
	
	
	
	//修改商品信息
	@RequestMapping("/updateProductAct")
	public String updateProduct(HttpServletRequest request,@ModelAttribute Product record)throws Exception{
		System.out.print(record);	
		 //因为ajax的异步图片上传,如果有上传过,
        // 则saveFileName里有上传上来的图片的名称,
        // 如果没有使用异步ajax上传过图片,则saveFileNme="",
        // 实体类info使用隐藏表单域提供上来的pImage原始图片的名称;
        if (!saveFileName.equals("")) {
        	record.setImg_url(saveFileName);
        }
		service.update(record);
		saveFileName = "";
		return "forward:/ProductPageAct";
	}
	

	//删除商品信息
	@RequestMapping("/deleteProductAct")
	@ResponseBody
	public String delete(HttpServletRequest request,@RequestParam("id") Integer id)throws Exception{
		service.delete(id);
		return "ok";
	}
	
	
	//分页显示商品信息
	@RequestMapping("/ProductPageAct")
    public ModelAndView ProductPage(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		PageHelper.startPage(currentPage,8);
		List<Product> list=service.findAll();
		PageInfo<Product> pageInfo=new PageInfo<Product>(list,8);
		map.put("pageInfo", pageInfo);
		return new ModelAndView("product/product_list");
	} 
	
	//多条件查询
	@RequestMapping("/findByProductMap")
    public ModelAndView findByProductMap(HttpServletRequest request){
		Map<String,Object> paramterMap=new HashMap<String, Object>();
		paramterMap.put("name", request.getParameter("name"));	
		List<Product> list=service.findByProductMap(paramterMap);				
		request.setAttribute("list", list);
		return new ModelAndView("product/list_product");
	} 
	
	
	

}
