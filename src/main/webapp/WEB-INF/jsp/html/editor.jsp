<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="styles/behind.css" rel="stylesheet" />
		<link href="styles/manage.css" rel="stylesheet" />
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<title>企业信息管理平台-新闻公告</title>
	</head>

	<body onload="getDate()">
		<div class="header">
			<img class="logo" src="images/logo.png" />
			<label class="logo-title">企业信息管理平台</label>
			<ul class="inline">
				<li>
					<img src="images/06.png" />&nbsp;&nbsp;欢迎您，${sessionScope.userLogin.name }
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle mymsg" onclick="openadmin();"><img src="images/04.png" />&nbsp;&nbsp;修改信息</a>
				</li>
				<li>
					<a class="loginout" href="logout"><img src="images/05.png" />&nbsp;&nbsp;退出</a>
				</li>
			</ul>
		</div>

		<div class="nav">
			<ul class="breadcrumb">
				<li>
					<a href="index"><img src="images/home.png" />首页</a> <span class="divider">>></span></li>
				<li class="active"></li>

			</ul>

		</div>
		<div id="sysdate"></div>
		<div class="container-fluid content">
			<div class="row-fluid">
				<div class="span2 content-left">
					<div class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
									<img class="left-icon" src="images/settings.png" /><span class="left-title">管理列表</span>
								</a>
							</div>
							<div id="collapseOne" class="accordion-body collapse in">
								<div class="accordion-inner">
									<a href="jumpNews"><img class="left-icon-child" src="images/07.png" /><span class="left-body"> 新闻公告</span></a>
								</div>
								<div class="accordion-inner">
									<a href=listUser><img class="left-icon-child" src="images/01.png" /><span class="left-body"> 职员信息</span></a>
								</div>
								<div class="accordion-inner">
									<a href="jumpSalary"><img class="left-icon-child" src="images/02.png" /><span class="left-body"> 职员薪资</span></a>
								</div>
								<div class="accordion-inner">
									<a href="jumpTrain"><img class="left-icon-child" src="images/03.png" /><span class="left-body"> 职员培训</span></a>
								</div>
								<div class="accordion-inner">
									<a href="jumpEditor"><img class="left-icon-child" src="images/03.png" /><span class="left-body"> 新闻编辑</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="span10 content-right">
					<textarea rows="" cols="" id="editor">
						
					</textarea>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="foot"></div>
		<script src="scripts/jquery-3.0.0.min.js"></script>
		<script src="scripts/behind.js"></script>
		<script src="scripts/laydate.dev.js"></script>
		<script type="text/javascript">
		$(function() {
		    CKEDITOR.replace('editor');
		    $(".textarea").wysihtml5();
		});
		</script>
	</body>

</html>