<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>美妆商品管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css">  
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxfileupload.js"></script>
</head>
<body>

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card" >
          <div class="layui-card-header">添加商品</div>
          <div class="layui-card-body" pad15>
             <form action="<%=path%>/addProductAct"   method="post" >           
              <div class="layui-form-item">
                <label class="layui-form-label">商品名称：</label>
                <div class="layui-input-inline">
                  <input type="text" name="name" id="name" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
                
              
                <div class="layui-form-item">
                <label class="layui-form-label">商品分类：</label>
                <div class="layui-input-inline">
                  
                 <select name="c_id" class="form-control">
                 		 <option value="-1">--请选择商品分类--</option>
                         <c:if test="${requestScope.list!=null}">
                           <c:forEach items="${requestScope.list}" var="c">
                                <option value="${c.id }" >${c.cname}</option>    
                                </c:forEach>  
                          </c:if>   
                  </select>         
                </div>
              </div>
              
                
                	  <div class="layui-form-item">
						   <label class="layui-form-label">商品图片：</label>
                            <br><div id="imgDiv" style="display:block; width: 40px; height: 50px;"></div><br><br><br><br>
                           <div class="layui-input-inline">
                        <input type="file" id="pimage" name="pimage" onchange="fileChange()"  style="margin-left:100px;">                          
                             <!--    <span id="imgName" ></span><br> -->
                               
					</div>
					</div>
          
                <div class="layui-form-item">
                <label class="layui-form-label">商品详情</label>
                <div class="layui-input-inline">
                  <textarea type="text" name="detail" id="detail"  value=" "  lay-verify="required" lay-verType="tips" class="layui-textarea"></textarea>
                </div>
              </div>
              
              <div class="layui-form-item">
                <label class="layui-form-label">商品单位：</label>
                <div class="layui-input-inline">
                  <input type="text" name="dw" id="dw" value="" placeholder="请输入商品单位"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
              
              <div class="layui-form-item">
                <label class="layui-form-label">商品库存：</label>
                <div class="layui-input-inline">
                  <input type="text" name="kc" id="kc" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
              <div class="layui-form-item">
                <label class="layui-form-label">商品价格：</label>
                <div class="layui-input-inline">
                  <input type="text" name="price" id="price" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
              
              
                  
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                
            <button class="layui-btn" type="submit" id="add">确认添加</button>
                 
                </div>
              </div>
              </div>
              </form>
            </div>
            
            
          </div>
        </div>
      </div>
    </div>
  </div>
		
	


<script src="<%=path %>/layui/layui.js"></script>
<script>

	 function fileChange(){
			$.ajaxFileUpload({
				url:"${pageContext.request.contextPath}/ajaxImg.action",
				secureuri: false,
				fileElementId: 'pimage',
				dataType:"json",
				success:function (obj) {
					//清空div
					$("#imgDiv").empty();
					//创建一个图片的标签
					var imgObj = $("<img>");
					alert(obj.imgurl);
					imgObj.attr("src","upload/"+obj.imgurl);
					imgObj.attr("width","100px");
					imgObj.attr("height","100px");
					//将图片追加到imgDiv
					$("#imgDiv").append(imgObj);
				}
			});

       }

layui.use([ 'form','jquery','layer' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
	
	 $('#add').click(function(){  
		  var $1 = $.trim($('#name').val());
		  var $2 = $.trim($("#detail").val());
		  var $3 = $.trim($("#dw").val());		
		  var $4 = $.trim($("#kc").val());
		  var $5 = $.trim($("#price").val());
		  if($1==""){
			  layer.msg('商品名称不许为空',function() {time:2000}); 
				$("#name").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#name").css("border","");
				return true;
	  		}
		  
		  if($2==""){
			  layer.msg('商品详情不许为空',function() {time:2000}); 
				$("#detail").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#detail").css("border","");
				return true;
	  		}
		  
		  
		  if($3==""){
			  layer.msg('单位不许为空',function() {time:2000}); 
				$("#dw").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#dw").css("border","");
				return true;
	  		}
		  
		  
		  if($4==""){
			  layer.msg('库存不许为空',function() {time:2000}); 
				$("#kc").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#kc").css("border","");
				return true;
	  		}
		  
		  
		  if($5==""){
			  layer.msg('商品价格不许为空',function() {time:2000}); 
				$("#price").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#price").css("border","");
				return true;
	  		}
		  
		
		
		  
		
		  
		
		
			
	  	  
	})  
	    
		
		   

	  });
	  

   


</script>
</body>
</html>