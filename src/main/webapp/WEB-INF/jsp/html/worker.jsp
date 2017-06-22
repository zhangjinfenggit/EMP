<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<script src="bootstrap/js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<link href="styles/behind.css" rel="stylesheet" />
		<link href="styles/manage.css" rel="stylesheet" />
		<title>企业信息管理平台-职员信息</title>
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
								<a class="btn btn-success" onclick="openaddEmp('新增职员');">新增</a>
								<a class="btn btn-success" onclick="printed()">打印</a>
							</div>
							<div class="search">
								<input type="text" id="search" placeholder="Search" value="${searchName }" class="seartext" />
								<a class="btn btn-success" onclick="searchInf()"  >搜索</a>
							</div>
							<div class="w">
								<div class="span12">
									<table class="table table-condensed table-bordered table-hover tab">
										<thead>
											<tr>
												<th width="5%">序号 </th>
												<th width="10%">姓名</th>
												<th width="5%">性别</th>
												<th width="10%">生日</th>
												<th width="10%">学历</th>
												<th width="20%">住址</th>
												<th width="10%">电话号码</th>
												<th width="10%">部门</th>
												<th width="10%">职位</th>
												<th width="15%">操作</th>
											</tr>
										</thead>
										<tbody id="tbody">
											<c:forEach items="${users }" var="user" varStatus="stutus" >
												<tr>
												
													<td width="5%">${stutus.index + 1 }</td>
													<td width="10%">${user.name }</td>
													<td width="5%">${user.sex }</td>
													<td width="10%">${user.birthday }</td>
													<td width="10%">${user.education }</td>
													<td width="20%">${user.address }</td>
													<td width="10%">${user.tel }</td>
													<td width="10%">${user.dept }</td>
													<td width="10%">${user.position }</td>
													<td width="15%">
														<a class="btn" onclick="openedtemp('${user.id}');">修改</a>&nbsp;&nbsp;
														<a class="btn" onclick="opendelemp('${user.id}');">删除</a>
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
									<h4 id="myModalLabel">新增职员</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" id="addUserForm" >
										<div class="control-group">
											<label class="control-label" for="name">姓名</label>
											<div class="controls">
												<input type="text" id="wname" name="name"  placeholder="职员姓名">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="sex">性别</label>
											<div class="controls">
												<img src="images/14.png" title="男" width="25px" height="25px" />
												<input type="radio"   name="sex" value="男">&nbsp;&nbsp;&nbsp;&nbsp;
												<img src="images/15.png" title="女" width="25px" height="25px" />
												<input type="radio"  name="sex" value="女">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="birthday">生日</label>
											<div class="controls">
												<input type="text" id="wbirthday" name="birthday">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="diploma">学历</label>
											<div class="controls">
												<select name="education" id="weducation">
													<option>--请选择--</option>
													<option value="大学专科">大学专科</option>
													<option value="大学本科">大学本科</option>
													<option value="硕士研究生">硕士研究生</option>
													<option value="博士研究生">博士研究生</option>
												</select>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="address">住址</label>
											<div class="controls">
												<input type="text" id="waddress" name="address" placeholder="详细住址">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="tel">电话</label>
											<div class="controls">
												<input type="text" id="wtel" name="tel" placeholder="联系电话">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="dept">部门</label>
											<div class="controls">
												<select name="dept" id="wdept">
													<option>--请选择--</option>
													<option value="人力资源部">人力资源部</option>
													<option value="市场营销部">市场营销部</option>
													<option value="财务部">财务部</option>
													<option value="行政部">行政部</option>
													<option value="开发部">开发部</option>
													<option value="后勤部">后勤部</option>
												</select>
											</div>
										</div>
										<input type="hidden" id="wid"  />
										<div class="control-group">
											<label class="control-label" for="position">职位</label>
											<div class="controls">
												<select name="position" id="wposition">
													<option>--请选择--</option>
													<option value="产品经理">产品经理</option>
													<option value="策划经理">策划经理</option>
													<option value="架构师">架构师</option>
													<option value="前端工程师">前端工程师</option>
													<option value="开发工程师">开发工程师</option>
													<option value="测试工程师">测试工程师</option>
													<option value="运维工程师">运维工程师</option>
												</select>
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
									<button class="btn btn-primary" id="add" onclick="addUser();">保存</button>
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
									<input type="hidden" id="wdel" value=""/>
									<button class="btn btn-primary"   onclick="DelUser();">确认</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
								</div>
							</div>
							<div class="page">
								<a href="listUser?currPage=1"><img src="images/08.png" title="首页" /></a>
								<c:if test="${PageUtil.hasPrePage }">
									<a href="listUser?currPage=${PageUtil.currPage-1 }"><img src="images/09.png" title="上一页" /></a>
								</c:if>
								<c:forEach items="${PageUtil.eachPage }" var="index" >
									<c:choose>
										<c:when test="${index == PageUtil.currPage }">
											<font color="red">${index}</font>
										</c:when>
										<c:otherwise>
											<a href="listUser?currPage=${index}">${index} </a>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
								<c:if test="${PageUtil.hasNextPage }">
								<a href="listUser?currPage=${PageUtil.currPage+1 }"><img src="images/10.png" title="下一页" /></a>
								</c:if>
								<a href="listUser?currPage=${PageUtil.pageCount }"><img src="images/11.png" title="尾页" /></a>
							</div>
						</div>
						
						<div style="display: none;" id="printModal">
                                    	<center>
                                        	<h3>员工信息详表</h3>
                                        </center>
                                        <div style="width: 20%; float: right;">
                                        	<span>日期：<%=(new Date().toLocaleString()).substring(0, 9) %></span>
                                        </div>
                                        <table class="table table-condensed table-bordered table-hover tab">
										<thead>
											<tr>
												<th width="5%">序号</th>
												<th width="10%">姓名</th>
												<th width="5%">性别</th>
												<th width="10%">生日</th>
												<th width="10%">学历</th>
												<th width="15%">住址</th>
												<th width="10%">电话号码</th>
												<th width="10%">部门</th>
												<th width="10%">职位</th>
											</tr>
										</thead>
										<tbody id="tbody">
											<c:forEach items="${users }" var="user" varStatus="stutus" >
												<tr>
												
													<td width="5%">${stutus.index + 1 }</td>
													<td width="10%">${user.name }</td>
													<td width="5%">${user.sex }</td>
													<td width="10%">${user.birthday }</td>
													<td width="10%">${user.education }</td>
													<td width="15%">${user.address }</td>
													<td width="10%">${user.tel }</td>
													<td width="10%">${user.dept }</td>
													<td width="10%">${user.position }</td>
												</tr>
											</c:forEach>
										</tbody>
										</tbody>
									</table>
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
			function addUser(){
				
				var id = document.getElementById("wid").value;
				var name = document.getElementById("wname").value;
				var dept = document.getElementById("wdept").value;
				var birthday = document.getElementById("wbirthday").value;
				var education = document.getElementById("weducation").value;
				var address = document.getElementById("waddress").value;
				var tel = document.getElementById("wtel").value;
				var position = document.getElementById("wposition").value;
			    var sex  = $('input[type="radio"]:checked').val(); //获取被选中Radio的Value
			     if(id!='' && id !=null ){
			    	
			    	
			    	 location.href = "updateUser?name="+name+"&sex="+sex+"&dept="+dept+"&birthday="+birthday
			    			+"&education="+education+"&address="+address+"&tel="+tel
			    			+"&position="+position+"&id="+id; 
			    }else{
			    	
			    	location.href = "inertUser?name="+name+"&sex="+sex+"&dept="+dept+"&birthday="+birthday
			    			+"&education="+education+"&address="+address+"&tel="+tel
			    			+"&position="+position;
			    } 
				
				
			}
			
			function opendelemp(id){
				
				var flag = confirm("你确定要删除么？");
				
				if(flag){
					
					location.href = "delUserByid?id="+id;
				}
				
			}
			function searchInf(){
				
				var name = $("#search").val();
				
				location.href = "listUser?name="+name;
				
			}
			function printed() {
				document.body.innerHTML = document.getElementById("printModal").innerHTML;
				window.print();
				location.reload();
			}
			
			laydate({
				elem: '#wbirthday'
			});
		</script>
	</body>

</html>