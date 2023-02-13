<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2023/1/20
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<h1>${user.username},欢迎您！</h1>
<input type="button" value="新增" id="add"><br>
<hr>
<div>${msg}</div>
<table border="1" cellspacing="0" width="80%">
    <tr>
        <th>序号</th>
        <th>品牌名称</th>
        <th>企业名称</th>
        <th>排序</th>
        <th>品牌介绍</th>
        <th>状态</th>
        <th>操作</th>
    </tr>

    <c:forEach items="${brands}"  var="brand" varStatus="status">
        <tr align="center">
            <td>${status.count}</td>
            <td>${brand.brandName}</td>
            <td>${brand.companyName}</td>
            <td>${brand.ordered}</td>
            <td>${brand.description}</td>
            <c:if test="${brand.status==1}">
                <td>启用</td>
            </c:if>
            <c:if test="${brand.status!=1}">
                <td>禁用</td>
            </c:if>
            <td><a href="${contextPath}/brand/selectByIdServlet?id=${brand.id}">修改</a>
                <a href="${contextPath}/brand/deleteByIdServlet?id=${brand.id}">删除</a></td>
        </tr>

    </c:forEach>
</table>
<a href="${contextPath}/logoutServlet">退出登录,返回登录页面</a>
<hr>
 <script>
     document.getElementById("add").onclick = function (){
         alert("添加一条记录")
         location.href="${contextPath}/brand/addBrand.jsp"
     }
 </script>
</body>
</html>