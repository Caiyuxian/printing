<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>大学城高校联谊平台</title>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/Font-Awesome-3.2.1/css/font-awesome.min.css">
<style type="text/css">
body{
	background: url(../images/body_bg.jpg) repeat-x;
	background-color: #b4daf0;
}
/*导航栏*/
header{
	width: 100%;
	height: 55px;
	border-top: 5px solid #39c;
	background: white;
	position: fixed;
	top: 0;
	box-shadow: 0 1px 5px #888888;
}
#headerNav{
	width: 960px;
	margin: 0 auto;
}
#headerNav a{
	text-decoration: none;
	color: #ccc;
	display: inline-block;
	width: 18%;
	height: 55px;
	line-height: 55px;
	text-align: center;
}
#headerNav a:hover{
	color: #39c;
}
#headerNav input{
	border-radius: 15px;
	height: 30px;
	border: 1px solid #ccc;
	padding-left: 5px;
	width: 200px;
}
#main{
	width: 960px;
	min-height: 600px;
	margin: 0 auto;
	overflow:hidden;
	zoom:1;
}
/*消息*/
#news{
	width: 300px;
	min-height: 200px;
	border: 1px solid #F0F0F0;
	box-shadow: 1px 2px 5px #000;
	background: white;
	position: absolute;
	top: 59px;
	left: 484px;
	border-radius: 10px;
	display: none;
}
#newsTop{
	width:0px;
	height:0px;
	border-left:15px solid transparent;  /* left arrow slant */
	border-right:15px solid transparent; /* right arrow slant */
	border-bottom:15px solid #F0F0F0; /* bottom, add background color here */
	margin-top: -15px;
	margin-left: 135px;
}
.jioner{
	height: 40px;
	line-height: 40px;
	padding-left: 10px;
	font-size: 16px;
	color: #39c;
}
#newsBot{
	position: absolute;
	bottom: 0;
	width: 180px;
	border-top: 1px solid #ccc;
	padding-left: 120px;
	padding-top: 5px;
}
#newsBot a{
	display: block;
	width: 50px;
	height: 26px;
	line-height: 26px;
	border-radius: 5px;
	background: #39c;
	text-decoration: none;
	color: white;
	text-align: center;
}
/*已发布活动*/
.hadPubish{
	width: 600px;
	background: white;
	padding: 10px;
	margin-top: 10px;
}
.hadPubish p{
	color: #39c;
	font-size: 14px;
}
.hadPubish a{
	text-decoration: none;
	color: white;
	display: inline-block;
	width: 80px;
	height: 28px;
	line-height: 28px;
	background: #FFC09F;
	text-align: center;
	border-radius: 3px;
}
/*修改资料*/
#information{
	float: right;
	margin-top: 10px;
	width: 300px;
	background: white;
}
#revise,#changePass{
	text-decoration: none;
	color: #39c;
	display: block;
	width: 300px;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
}
/*修改资料框*/
#divEdit,#changeInfor,#divPass{
	width: 400px;
	height: 160px;
	border-radius: 8px;
	text-align: center;
	background: white;
	position: absolute;
	z-index: 2;
	top: 50%;
	left: 50%;
	margin: -200px 0 0 -160px;
	display: none;
}
#changeInfor input,#divPass input{
	width: 300px;
	height: 30px;
	margin-top: 15px;
	border-radius: 4px;
	border:1px solid #ccc;
	padding-left: 5px;
}
#divEdit a,#changeInfor a,#divPass a{
	display: block;
	text-decoration: none;
	text-align: center;
	color: white;
	margin-top: 10px;
	margin-left: 143px;
	width: 100px;
	height: 35px;
	line-height: 35px;
	border-radius: 3px;
	background: #39c;
}
/*编辑活动*/
#divEdit{
	padding: 10px;
	height: 305px;
}
#divEdit #divEditContent{
	padding: 5px;
	width: 385px;
	height: 100px;
	resize:none;
}
/*修改密码*/
#divPass{
	height: 200px;
	padding-top: 10px;
}
/*尾部*/
footer{
	margin-top: 10px;
	text-align: center;
	background-color: white;
	height: 40px;
	line-height: 40px;
}
footer a{
	text-decoration: none;
	color: #808080;
}
#bg{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: 0.5;
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	// 消息
	$("#aNews").click(function(){
		if($("#news").css("display") == "block"){
			$("#news").fadeOut();
		}else{
			$("#news").fadeIn();
		}
		return false;
	});
	$("#newsBot").find("a").click(function(){
		$("#news").fadeOut();
		return false;
	});
	// 修改资料
	$("#revise").click(function(){
		$("#bg").fadeIn();
		$("#changeInfor").fadeIn();
		return false;
	});
	//修改密码
	$("#changePass").click(function(){
		$("#bg").fadeIn();
		$("#divPass").fadeIn();
		return false;
	});
	//编辑活动内容
	$(".edit").click(function(){
		$("#bg").fadeIn();
		$("#divEdit").fadeIn();
		var activity = $(this).parent().parent().find(".activity").text();
		$("#divEditContent").val(activity);
		return false;
	});
	//删除活动
	$(".delete").click(function(){
		var bool = confirm("确定删除该活动？");
		if(bool){
			$(this).parent().parent().fadeOut("slow",function(){
				$(this).remove();
			});
		}
		return false;
	})
	//修改资料提交
	$("#changeInforSure").click(function(){
		if($("#phone").val()==""||$("#email").val()==""){
			alert("联系方式和邮箱不允许为空，请填写");
			return false;
		}
		//验证联系方式
		var pho = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;//手机号码
		if(!(pho.test($("#phone").val()))){
            alert("请填写正确的联系方式！")
            return false;
        }
		//验证邮箱
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		if(!(reg.test($("#email").val()))){
			alert("请输入正确的邮箱！");
			return false;
		}
		alert("修改成功");
		$("#changeInfor").submit();
	})
	//
	$("#bg").click(function(){
		$(this).fadeOut();
		$("#changeInfor").fadeOut();
		$("#divPass").fadeOut();
		$("#divEdit").fadeOut();
	});
})
</script>
</head>
<body>
	<header>
			<div id="headerNav">
			<a href="list.nut?currentPage=1" style="color: #39c;"><i class="icon-home icon-2x"></i>首页</a>
			<a id="aNews" href="javascript:0;"><i class="icon-comments icon-2x"></i>消息</a>
			<c:if test="${user==null }">
				<a href="tologin.nut"><i class="icon-user icon-2x"></i>登录</a>
			</c:if>
			<c:if test="${user!=null }">
				<a href="myAct.nut"><i class="icon-user icon-2x"></i><c:out value="${user.username}"></c:out>个人主页</a>
				<a id="exit" href="logout.nut"><i class="icon-coffee icon-2x"></i>退出</a>
		</c:if>
			<form  id="souform" action="list.nut?currentPage=1" method="post" style="display: inline;">
			<input type="text" name="type" id="shousuocontent" placeholder="活动类型"><i id="shousuo" style="margin-left:-20px;color:#ccc;cursor: pointer;" class="icon-search icon-large"></i>
			</form>
		</div>
		<!-- 消息 -->
		<div id="news">
			<div id="newsTop"></div>
			<div class="jioner">
				<i class="icon-comment-alt"></i>
				<span>参加者一</span>
				<i class="icon-exchange"></i>
				<select>
					<option>同意参加</option>
					<option>删除该参与者</option>
				</select>
			</div>
			<div id="newsBot">
				<a href="javascript:0;">确定</a>
			</div>
		</div>
	</header>
	<div style="height:60px;"></div>
	<div id="main">
		<!-- 已发布活动 -->
		<div style="float:left;">
			<c:forEach items="${obj}" var="myact" varStatus="my">
				<div class="hadPubish">
				<p><i class="icon-info-sign icon-2x"></i>已发布活动</p>
				<p style="padding-left:30px;">活动简介：在${myact.edittime }发布了${myact.content }</p>
				<div class="activity">活动主要介绍内容:  时间：${myact.activitytime } 地点：${myact.address }  类型：${myact.acttype }</div>
				<div style="float:right;">
					<a href="javascript:0;" class="edit"><i class="icon-edit icon-2x"></i>编辑</a>
					<input type="hidden" value=${myact.id }>
					<a href="javascript:0;" class="delete"><i class=" icon-trash icon-2x"></i>删除</a>
				</div>
				<div style="clear:both;"></div>
			</div>
			</c:forEach>
			<div class="dibu" align="center">
				<a href="myAct.nut?currentPage=1">首页</a>&nbsp;&nbsp;
				<c:if test="${currentPage!=1&&currentPage!=null}"><a href="myAct.nut?currentPage=${currentPage-1}">上一页&nbsp;&nbsp;</a></c:if>
				<c:if test="${currentPage!=maxPage&&currentPage!=null}"><a href="myAct.nut?currentPage=${currentPage+1}">下一页&nbsp;&nbsp;</a></c:if>
				<a href="myAct.nut?currentPage=${maxPage}">末页</a>
			<h6 style="font-size:14px;">第${currentPage}页|共${maxPage }页</h6>
		</div>
		</div>
		<!-- 编辑内容框 -->
		<div id="divEdit">
			<p style="font-family: '隶书';font-size:20px;color:#39c;">编辑活动内容</p>
			<textarea id="divEditContent"></textarea>
			<label>活动类型</label>
			<select>
				<option>电影</option>
				<option>运动</option>
				<option>展览</option>
				<option>公益</option>
				<option>旅行</option>
				<option>音乐</option>
			</select>
			<br>
			<br>
			<label>举办活动时间：</label>
			<input type="text" placeholder="xx-xx-xx">
			<br>
			<br>
			<label>举办活动地点：</label>
			<input type="text" placeholder="中心湖">
			<a href="">确认</a>
		</div>
		<!-- 修改资料 -->
		<div id="information">
			<div style="text-align:center;color:#ccc;"><i class="icon-user icon-4x"></i></div>
			<a id="revise" href="javascript:0;"><i class=" icon-wrench icon-2x"></i>修改资料</a>
			<a id="changePass" href="javascript:0;"><i class="icon-lock icon-2x"></i>修改密码</a>
		</div>
		<!-- 修改资料框 -->
		<form id="changeInfor" action="modifyInfo.nut">
			<input type="hidden" name="userid" value="${user.id}">
			<input type="text" id="phone"name="phone" placeholder="联系方式">
			<input type="text" id="email"name="email" placeholder="邮箱">
			<a id="changeInforSure"href="javascript:0;">确认</a>
		</form>
		<!-- 修改密码 -->
		<form id="divPass">
			<input type="text" placeholder="原始密码" >
			<input type="text" placeholder="新密码">
			<input type="text" placeholder="确认密码">
			<a href="javascript:0;">确认</a>
		</form>
	</div>
<footer>
	<a href="javascript:0;">made by me |</a>
	<a href="admin/home/user_login.jsp">后台管理</a>
</footer>
<div id="bg"></div>		
</body>
</html>