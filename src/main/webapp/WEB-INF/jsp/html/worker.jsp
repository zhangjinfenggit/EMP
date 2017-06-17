﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
									<a href="news.html"><img class="left-icon-child" src="images/07.png" /><span class="left-body"> 新闻公告</span></a>
								</div>
								<div class="accordion-inner">
									<a href="worker.html"><img class="left-icon-child" src="images/01.png" /><span class="left-body"> 职员信息</span></a>
								</div>
								<div class="accordion-inner">
									<a href="wages.html"><img class="left-icon-child" src="images/02.png" /><span class="left-body"> 职员薪资</span></a>
								</div>
								<div class="accordion-inner">
									<a href="train.html"><img class="left-icon-child" src="images/03.png" /><span class="left-body"> 职员培训</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="span10 content-right">
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="add">
								<a class="btn btn-success" onclick="openadd('新增职员');">新增</a>
								<a class="btn btn-success">打印</a>
							</div>
							<div class="page">
								<a href="#"><img src="images/08.png" title="首页" /></a>
								<a href="#"><img src="images/09.png" title="上一页" /></a>
								当前是第&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;共&nbsp;&nbsp;页
								<a href="#"><img src="images/10.png" title="下一页" /></a>
								<a href="#"><img src="images/11.png" title="尾页" /></a>
							</div>
							<div class="search">
								<input type="text" placeholder="Search" class="seartext" />
								<a class="btn btn-success">搜索</a>
							</div>
							<div class="w">
								<div class="span12">
									<table class="table table-condensed table-bordered table-hover tab">
										<thead>
											<tr>
												<th width="10%">姓名</th>
												<th width="5%">性别</th>
												<th width="10%">生日</th>
												<th width="5%">学历</th>
												<th width="25%">住址</th>
												<th width="10%">电话号码</th>
												<th width="10%">部门</th>
												<th width="10%">职位</th>
												<th width="15%">操作</th>
											</tr>
										</thead>
										<tbody id="tbody">
											<tr>
												<td width="10%">姓名</td>
												<td width="5%">性别</td>
												<td width="10%">生日</td>
												<td width="5%">学历</td>
												<td width="25%">住址</td>
												<td width="10%">电话号码</td>
												<td width="10%">部门</td>
												<td width="10%">职位</td>
												<td width="15%">
													<a class="btn" onclick="openedt('修改职员');">修改</a>&nbsp;&nbsp;
													<a class="btn" onclick="opendel();">删除</a>
												</td>
											</tr>
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
									<form class="form-horizontal">
										<div class="control-group">
											<label class="control-label" for="name">姓名</label>
											<div class="controls">
												<input type="text" id="name" name="worker.name" placeholder="职员姓名">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="sex">性别</label>
											<div class="controls">
												<img src="images/14.png" title="男" width="25px" height="25px" />
												<input type="radio" id="sex" name="worker.sex" value="男">&nbsp;&nbsp;&nbsp;&nbsp;
												<img src="images/15.png" title="女" width="25px" height="25px" />
												<input type="radio" id="sex" name="worker.sex" value="女">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="birthday">生日</label>
											<div class="controls">
												<input type="text" id="birthday" name="worker.birthday">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="diploma">学历</label>
											<div class="controls">
												<select name="worker.record">
													<option>--请选择--</option>
													<option>大学专科</option>
													<option>大学本科</option>
													<option>硕士研究生</option>
													<option>博士研究生</option>
												</select>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="address">住址</label>
											<div class="controls">
												<input type="text" id="address" name="worker.address" placeholder="详细住址">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="tel">电话</label>
											<div class="controls">
												<input type="text" id="tel" name="worker.tel" placeholder="联系电话">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="department">部门</label>
											<div class="controls">
												<select name="worker.dept">
													<option>--请选择--</option>
													<option>人力资源部</option>
													<option>市场营销部</option>
													<option>财务部</option>
													<option>行政部</option>
													<option>开发部</option>
													<option>后勤部</option>
												</select>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="position">职位</label>
											<div class="controls">
												<select name="worker.position">
													<option>--请选择--</option>
													<option>产品经理</option>
													<option>策划经理</option>
													<option>架构师</option>
													<option>前端工程师</option>
													<option>开发工程师</option>
													<option>测试工程师</option>
													<option>运维工程师</option>
												</select>
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
									<button class="btn btn-primary" id="add" onclick="add();">保存</button>
								</div>
							</div>

							<div id="adminModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top: 25%;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 id="myModalLabel">修改密码</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal">
										<div class="control-group">
											<label class="control-label" for="name">帐号</label>
											<div class="controls">
												<input type="text" id="name" placeholder="" readonly="readonly">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="time">密码</label>
											<div class="controls">
												<input type="password" id="time" placeholder="">
											</div>
										</div>
									</form>
								</div>

								<div class="modal-del-footer">
									<button class="btn btn-primary" id="edt" onclick="edtadmin();">确认</button>&nbsp;&nbsp;&nbsp;&nbsp;
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
			laydate({
				elem: '#birthday'
			});
		</script>
	</body>

</html>