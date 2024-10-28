// JavaScript Document
var html ="<a name='item-121212121212'></a>";
	html+="<div class='detail-about detail-about-reply'>";
	html+="<a class='jie-user' href=''>";
	html+="<img src='../static/images/default.png' alt=''>";
	html+="<cite><i>香菇</i><em style='color:#FF9E3F'>活雷锋</em></cite></a>";
	html+="<div class='detail-hits'><span>刚刚</span></div></div>";
	html+="<div class='detail-body jieda-body' id='testReply'></div>";
	html+="<div class='jieda-reply'><span class='jieda-zan' type='zan'><i class='iconfont icon-zan'></i><em>0</em></span><span type='reply'><i class='iconfont icon-svgmoban53'></i>回复</span><div class='jieda-admin'>";
	html+="<span type='edit'>编辑</span><span type='del'>删除</span><span class='jieda-accept' type='accept'>采纳</span></div></div>";
var editIndex = null;
$(function(){	
	/*var oLi = document.getElementById("tab").getElementsByTagName("li");
	var oUl = document.getElementById("ms-main").getElementsByTagName("div");
	for(var i = 0; i < oLi.length; i++)
	{
		oLi[i].index = i;
		oLi[i].onmouseover = function ()
		{
			for(var n = 0; n < oLi.length; n++) oLi[n].className="";
			this.className = "cur";
			for(var n = 0; n < oUl.length; n++) oUl[n].style.display = "none";
			oUl[this.index].style.display = "block"
		}	
	}*/
});

layui.use(['layedit', 'form', 'layer', 'laypage'], function(){
    var layedit = layui.layedit
	,form = layui.form
	,layer = layui.layer
	,laypage = layui.laypage;
	
    layedit.set({
      uploadImage: {
        url: '#' //接口url
        ,type: 'post' //默认post
      }
    });

   editIndex = layedit.build('reply',{
      height: 150, //设置编辑器高度
      tool: ['strong', 'italic', 'underline', 'left', 'center', 'right', '|', 'link', 'image', 'code']
    }); //建立编辑器

	//只显示上一页、下一页
	laypage.render({
		elem: 'page_reply'
		,count: 20
		//['count', 'prev', 'page', 'next', 'limit', 'skip']
		,layout: ['prev', 'page', 'next']
		,jump: function(obj, first){
		  if(!first){
			layer.msg('第 '+ obj.curr +' 页');
		  }
		}
	});
});





