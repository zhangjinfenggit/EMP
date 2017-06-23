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
		<title>企业信息管理平台-职员薪资</title>
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
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="add">
								<a class="btn btn-success" onclick="openadd('新增职员薪资信息');">新增</a>
								<a class="btn btn-success">打印</a>
							</div>
							
							<div class="search">
								<input type="text" placeholder="Search"  id = "eno" class="seartext" />
								<a class="btn btn-success" onclick="searchEno()">搜索</a>
							</div>
							<div class="w">
								<div class="span12">
									<table class="table table-condensed table-bordered table-hover tab">
										<thead>
											<tr>
												<th width="5%">序号</th>
												<th width="10%">工号</th>
												<th width="15%">姓名</th>
												<th width="10%">基本工资</th>
												<th width="10%">岗位工资</th>
												<th width="10%">加班工资</th>
												<th width="10%">绩效奖</th>
												<th width="10%">工龄奖</th>
												<th width="10%">合计</th>
												<th width="10%">操作</th>
											</tr>
										</thead>
										<tbody id="tbody">
											<c:forEach items="${salarys }" var="salary" varStatus="status" >
												<tr>
													<td width="5%">${status.index + 1}</td>
													<td width="10%">${salary.eno }</td>
													<td width="15%">${salary.name }</td>
													<td width="10%">${salary.bsalary }</td>
													<td width="10%">${salary.gsalary }</td>
													<td width="10%">${salary.jbsalary }</td>
													<td width="10%">${salary.jxsalary }</td>
													<td width="10%">${salary.glsalary }</td>
													<td width="10%">${salary.glsalary +salary.bsalary+salary.gsalary+salary.jbsalary+salary.jxsalary}</td>
													<td width="10%">
														<a class="btn" onclick="openedtw('${salary.id}')">修改</a>&nbsp;&nbsp;
														<a class="btn" onclick="delw(${salary.id});">删除</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div id="page" class="tr"></div>
								</div>
							</div>

							<div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 id="myModalLabel">新增职员薪资</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal">
										<div class="control-group">
											<label class="control-label" for="name">姓名</label>
											<div class="controls">
												<input type="text" id="wname" name="name" placeholder="职员姓名">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="baseWage">基本工资</label>
											<div class="controls">
												<input type="text" id="wbsalary" name="bsalary" placeholder="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="postWage">岗位工资</label>
											<div class="controls">
												<input type="text" id="wgsalary" name="gsalary"  placeholder="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="overtimeWage">加班工资</label>
											<div class="controls">
												<input type="text" id="wjbsalary" name="jbsalary" placeholder="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="performance">绩效奖</label>
											<div class="controls">
												<input type="text"  id="wjxsalary" name="jxsalary" placeholder="">
											</div>
										</div>
										<input type="hidden" id="wid">
										<div class="control-group">
											<label class="control-label" for="seniority">工龄奖</label>
											<div class="controls">
												<input type="text" id="wglsalary"  name ="slsalary" placeholder="">
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
									<button class="btn btn-primary" id="addSalary" onclick="addSalary()">保存</button>
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
								<div class="page">
								<a href="jumpSalary?currPage=1"><img src="images/08.png" title="首页" /></a>
								<c:if test="${PageUtil.hasPrePage }">
									<a href="jumpSalary?currPage=${PageUtil.currPage-1 }"><img src="images/09.png" title="上一页" /></a>
								</c:if>
								<c:forEach items="${PageUtil.eachPage }" var="index" >
									<c:choose>
										<c:when test="${index == PageUtil.currPage }">
											<font color="red">${index}</font>
										</c:when>
										<c:otherwise>
											<a href="jumpSalary?currPage=${index}">${index} </a>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
								<c:if test="${PageUtil.hasNextPage }">
								<a href="jumpSalary?currPage=${PageUtil.currPage+1 }"><img src="images/10.png" title="下一页" /></a>
								</c:if>
								<a href="jumpSalary?currPage=${PageUtil.pageCount }"><img src="images/11.png" title="尾页" /></a>
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
	</body>
	<script type="text/javascript">
	
		function editPwd(account){
			var pwd = document.getElementById("pwd");
			
			location.href="updatePwd?account="+account+"&pwd="+pwd.value;
		}
		function addSalary() {
			
			var id = $("#wid").val();
			
			if(id ==null || id ==''){
				var name = $("#wname").val();
				var bsalary = $("#wbsalary").val();
				var gsalary =$("#wgsalary").val();
				var jbsalary =$("#wjbsalary").val();
				var jxsalary =$("#wjxsalary").val();
				var glsalary =$("#wglsalary").val();
				//+"&bsalary="+bsalary+"&gsalary="+gsalary+"&jbsalary="+jbsalary+"&jxsalary="+jxsalary+"&glsalary="glsalary;
				location.href="insertSalary?name="+name+"&bsalary="+bsalary+"&gsalary="+gsalary+"&jbsalary="+jbsalary+"&jxsalary="+jxsalary+"&glsalary="+glsalary;
			
			}else{
				
				var name = $("#wname").val();
				var bsalary = $("#wbsalary").val();
				var gsalary =$("#wgsalary").val();
				var jbsalary =$("#wjbsalary").val();
				var jxsalary =$("#wjxsalary").val();
				var glsalary =$("#wglsalary").val();
				//+"&bsalary="+bsalary+"&gsalary="+gsalary+"&jbsalary="+jbsalary+"&jxsalary="+jxsalary+"&glsalary="glsalary;
				location.href="updatetSalary?name="+name+"&bsalary="+bsalary+"&gsalary="+gsalary+"&jbsalary="+jbsalary+"&jxsalary="+jxsalary+"&glsalary="+glsalary+"&id="+id;
			
			}
		   	
			//location.href="www.baidu.com";
		}
		
		function searchEno(){
			
			
			 var eno = $("#eno").val();
			
			location.href="jumpSalary?eno="+eno;
		
		}
		
		function delw(id){
			
			var flag = confirm("确定要删除么？");
			if(flag){
				location.href="delSalary?id="+id;
			}
			
		}
	</script>
</html>