<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../../js/jquery-1.11.1.min.js"></script>
<title>会员审核管理</title>
<style type="text/css">
<!--
input{
   cursor:pointer
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
  background-color: #EFF6FF;
}
div{
  padding: 0;
  margin: 0;
}
html { overflow-x: auto; overflow-y: auto; border:0;} 
-->
</style>
<script type="text/javascript">
/* $(document).ready(function(){
  $(".right-button08").click(function(){
    var user_id = $(this).prev().val();
    $.post("/University_Followship/servlet/delete_user",
    {
    	id:user_id
    },
    function(data){
    	if(data ==1){
    		alert("删除成功！")
    	}else{
    		alert("删除失败！")
    	}
    }
    )
    $(this).parent().parent().remove();
  })
})
window.onload=function(){
  if (location.href.indexOf("?xyz=")<0)
 {
 location.href=location.href+"?xyz="+Math.random();
 }
} */
</script>
</head>
<body>
<form name="fom" id="fom" method="post" action="">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30">
          
       <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr style="background-color:#16ADD8;color:white;height:30px;font-size:14px">
          <td class="control_title">
            大学城高校联谊平台管理&gt用户管理
          </td>
        </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
                  <tr align="center">
                    <td height="20" width="5%" bgcolor="#E0FCFA">序号</td>
                    <td height="20" width="10%" bgcolor="#E0FCFA">用户账号</td>
                    <td height="20" width="10%" bgcolor="#E0FCFA">邮箱</td>
                    <td height="20" width="10%" bgcolor="#E0FCFA">联系方式</td>
                    <td height="20" width="10%" bgcolor="#E0FCFA">操作</td>
                  </tr>
                  <!-- 动态 -->
				  <c:forEach items="${obj}" var="user" varStatus="ur">                
                  <tr align="center">
                    <td bgcolor="#FFFFFF">${ur.index+1 }</td>
                    <td bgcolor="#FFFFFF">${user.username }</td>
                    <td bgcolor="#FFFFFF">${user.email }</td>
                    <td bgcolor="#FFFFFF">${user.phone }</td>
                    <td bgcolor="#FFFFFF" align="center">
                   	<c:if test="${user.type==1 }"><a href="${base }/admin/ManagerAccount.nut?id=${user.id }&type=1">封号</a></c:if>
                 	<c:if test="${user.type==0 }"><a href="${base }/admin/ManagerAccount.nut?id=${user.id }&type=0">解封</a></c:if>
                    </td>
                  </tr>
              	 </c:forEach>	  
                  <!--  -->
                 
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="../../images/admin/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
            <tr>
                <td width="50%"><span class="right-text09"></span> 第${currentPage }页 | 共${maxPage }页 <span class="right-text09"></span></td>
                <td width="49%" align="right">[<a href="userlist.nut?currentPage=1" class="right-font08">第一页</a> | <c:if test="${currentPage!=null&&currentPage!=1 }"><a href="userlist.nut?currentPage=${currentPage-1 }" class="right-font08">上一页</a> | </c:if><c:if test="${currentPage!=null&&currentPage!=maxPage }"><a href="userlist.nut?currentPage=${currentPage+1 }" class="right-font08">下一页</a> | </c:if><a href="userlist.nut?currentPage=${maxPage}" class="right-font08">最后一页</a>]</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>



</body>
</html>
