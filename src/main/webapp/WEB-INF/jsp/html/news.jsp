﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="styles/behind.css" rel="stylesheet" />
		<link href="styles/manage.css" rel="stylesheet" />
		<title>企业信息管理平台-新闻公告</title>
	</head>

	<body onload="getDate()">
		<div class="header">
			<img class="logo" src="images/logo.png" />
			<label class="logo-title">企业信息管理平台</label>
			<ul class="inline">
				<li>
					<img src="images/06.png" />&nbsp;&nbsp;欢迎您，Admin
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle mymsg" onclick="openadmin();"><img src="images/04.png" />&nbsp;&nbsp;修改信息</a>
				</li>
				<li>
					<a class="loginout" href="manage.html"><img src="images/05.png" />&nbsp;&nbsp;退出</a>
				</li>
			</ul>
		</div>

		<div class="nav">
			<ul class="breadcrumb">
				<li>
					<a href="#"><img src="images/home.png" />首页</a> <span class="divider">>></span></li>
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
							</div>
						</div>
					</div>
				</div>

				<div class="span10 content-right">
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="add">
								<a class="btn btn-success" onclick="openadd('新增公告');">新增</a>
							</div>
							<div class="search">
								<input type="text" placeholder="Search" class="seartext" id="searchName" value="${searchName }" /> <a class="btn btn-success" onclick="searchNewsName()">搜索</a>
							</div>
							<div class="w">
								<div class="span12">
									<table class="table table-condensed table-bordered table-hover tab">
										<thead>
											<tr>
												<th width="5%">序号</th>
												<th width="20%">标题</th>
												<th width="10%">时间</th>
												<th width="55%">内容</th>
												<th width="15%">操作</th>
											</tr>
										</thead>
									<c:forEach items="${newsList }" var="news" varStatus="status" >
											<tbody id="tbody">
												<tr>
													<th width="5%">${status.index+1 }</th>
													<td width="20%">${news.title }</td>
													<td width="10%">${news.time }</td>
													<td width="55%">${news.content }</td>
													<td width="15%">
														<a class="btn" onclick="openedt('修改公告');">修改</a>&nbsp;&nbsp;
														<a class="btn" onclick="opendel(${news.id});">删除</a>
													</td>
												</tr>
											</tbody>
									</c:forEach>
									</table>
									<div id="page" class="tr"></div>
								</div>
							</div>

							<div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 id="myModalLabel">新增公告</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal">
										<div class="control-group">
											<label class="control-label" for="ntitle">标题</label>
											<div class="controls">
												<input type="text" id = "ntitle" name="title" placeholder="新闻公告主题">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="ntime">时间</label>
											<div class="controls">
												<input type="text" id="ntime" name="time" placeholder="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="ncontent">内容</label>
											<div class="controls">
												<textarea name="content" id="ncontent" style="height:200px;width:205px;resize: none;"></textarea>
											</div>
										</div>
									</form>
								</div>
								
								<div class="modal-footer">
									<button class="btn btn-primary" id="add" onclick="addnews();">保存</button>
									<button class="btn btn-primary" id="edt" onclick="edtnews();">保存</button>
									<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
								</div>
							</div>
							
							<div id="adminModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 25%;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 id="myModalLabel">修改密码</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" >
										<div class="control-group">
											<label class="control-label" for="name"  >帐号</label>
											<div class="controls">
												<input type="text"  placeholder="" value="${sessionScope.userLogin.account }" readonly="readonly">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="time">密码</label>
											<div class="controls">
												<input type="password"  id="pwd" placeholder="">
											</div>
										</div>
									</form>
								</div>

								<div class="modal-del-footer">
									<button class="btn btn-primary" onclick="editPwd('${sessionScope.userLogin.account }')" >确认</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
								</div>
							</div>
							
							<div id="delModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 25%;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 align="center">确认删除吗？</h4>
								</div>
								<div class="modal-del-footer"><br>
									<button class="btn btn-primary" id="del" onclick="delnews();">确认</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
								</div>
							</div>
							<div class="page">
								<a href="jumpNews?currPage=1"><img src="images/08.png" title="首页" /></a>
								<c:if test="${PageUtil.hasPrePage }">
									<a href="jumpNews?currPage=${PageUtil.currPage-1 }"><img src="images/09.png" title="上一页" /></a>
								</c:if>
								<c:forEach items="${PageUtil.eachPage }" var="index" >
									<c:choose>
										<c:when test="${index == PageUtil.currPage }">
											<font color="red">${index}</font>
										</c:when>
										<c:otherwise>
											<a href="jumpNews?currPage=${index}">${index} </a>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
								<c:if test="${PageUtil.hasNextPage }">
								<a href="jumpNews?currPage=${PageUtil.currPage+1 }"><img src="images/10.png" title="下一页" /></a>
								</c:if>
								<a href="jumpNews?currPage=${PageUtil.pageCount }"><img src="images/11.png" title="尾页" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="foot"></div>
		<script src="scripts/jquery-3.0.0.min.js"></script>
		<script src="scripts/behind.js"></script>
		<script src="scripts/laydate.dev.js"></script>
		<script type="text/javascript">
			function editPwd(account){
				var pwd = document.getElementById("pwd");
				
				location.href="updatePwd?account="+account+"&pwd="+pwd.value;
			}
			function searchNewsName(){
				
			var	title = $("#searchName").val();
				location.href="jumpNews?title="+title;
			}
			function addnews(){
				var title = $("#ntitle").val();
				var content = $("#ncontent").val();
				var time = $("#ntime").val();
				
				location.href="insertNews?title="+title+"&content="+content+"&time="+time;
			}
			function edtnews(){
				
			}
			function opendel(id){
				
				var v = confirm("你确定要删除么？");
				if(v){
					location.href="delNewsByid?id="+id;
				}
			}
			laydate({
				elem: '#date'
			});
		</script>
	</body>

</html>