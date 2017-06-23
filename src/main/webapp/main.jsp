<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>网络科技有限公司-首页</title>
		<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script language="javascript" type="text/javascript" src="scripts/jquery-3.0.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="styles/home.css">
		
	</head>

	<body>
		<div class="head clearfix">
			<ul class="head_a1">
				<li class="logo"><img src="images/logo.png" width="50px" height="50px" />网络科技有限公司</li>
			</ul>
			<ul class="head_b1">
				<li>
					<a title="首页" href="index">首页</a>
				</li>
				<li>
					<a title="公司简介" href="aboutus.jsp">公司简介</a>
				</li>
				<li>
					<a title="公司动态" href="#">公司动态</a>
				</li>
				<li>
					<a title="员工培训" href="#">职员培训</a>
				</li>
				<li>
					<a title="公司风采" href="#">公司风采</a>
				</li>
				<li>
					<a title="后台管理" href="jumpLogin">后台管理</a>
				</li>
			</ul>
		</div>
				<div class="banner">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="1500">
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
					  </ol>
					
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner" role="listbox">
					    <div class="item active" style="width: 984px;">
					      <img src="images/banner_07.jpg" />
					      
					    </div>
					    <div class="item">
					      <img src="images/banner_07.jpg" />
					      
					    </div>
					    <div class="item">
					      <img src="images/banner_07.jpg" />
					      
					    </div>
					    ...
					  </div>
					
					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" data-interval="2000">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
			</div>
		</div>
		<span class="blank31"></span>
		<div class="area clearfix">
			<div style="width: 100%" class="index_a1">
				<div class="about">
					<div class="index_f0">
						<div class="about-title">
							<span><a href="aboutus.html"><img src="images/more.jpg" width="40" height="14"></a></span>
							<h3>公司简介<font color="#f88000">Company</font></h3>
						</div>
					</div>
					<div style="margin-left: 20px" class="index_f2">
						<p><img src="images/08.jpg" width="132" height="92" align="left" style="padding-right:10px;">&nbsp;&nbsp;&nbsp;&nbsp;绿城房产建设管理有限公司（以下简称：绿城建设），成立于2010年9月25日，全面秉承绿城文化理念，整合绿城现有品牌及管理资源，与外部机构进行广泛合作，以契约形式向政府机构、项目合作伙伴及资本市场等委托方提供房地产项目开发管理和品牌输出服务（项目代建），与合作伙伴共同创造城市美丽的专业房地产品牌服务管理公司。 绿城建设的成立源于绿城房地产集团有限公司，绿城房地产集团有限公司为国内知名开发企业，专注于高品质物业的开发。</span>
						</p>
						</p>
					</div>
				</div>
				<div class="news">
					<div class="index_f1">
						<div class="first-title">
							<span><a href=""><img src="images/more.jpg" width="40" height="14"></a></span>
							<h3>公司动态<font color="#f88000">News</font></h3>
						</div>
					</div>
					<div id="divCount1">
						<ul class="index_c3">
							<c:forEach items="${newsList }" var="news" >
								<li><span>${news.time }</span>
									<a title="标题" href="showNews?id=${news.id }">${news.title }</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="train">
					<div class="index_f1">
						<div class="first-title">
							<span><a href=""><img src="images/more.jpg" width="40" height="14"></a></span>
							<h3>职员培训<font color="#f88000">Train</font></h3>
						</div>
					</div>
					<div id="divCount1">
						<ul class="index_c3">
							<c:forEach items="${trains }" var="train" >
								<li><span>${train.time }</span>
									<a title="标题" href="showTrain?id=${train.id }">${train.title }</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<span class="blank31"></span>
		<div class="area clearfix">

			<div class="case">
				<div class="product_tit">
					<span><a href=""><img src="images/more.jpg" width="40" height="14"></a></span>
					<h3>公司风采<font color="#f88000">Products</font></h3>
				</div>
				<div id="product_show">

					<style type="text/css">
						#demo_p {
							overflow: hidden;
							width: 960px;
							margin-left: 20px;
						}
						
						#demo_p img {
							border: 2px solid #7bc5ff;
						}
						
						#indemo_p {
							float: left;
							width: 800%;
						}
						
						#demo1_p {
							float: left;
						}
						
						#demo2_p {
							float: left;
						}
						
						#demo_pro {
							width: 150px;
							float: left;
							padding-right: 20px;
							padding-left: 20px;
						}
						
						#demo_pro span {
							text-align: center;
							float: left;
							width: 160px;
						}
					</style>
					<div id="demo_p">
						<div id="indemo_p">
							<div id="demo1_p">
								<div id="demo_pro">
									<a href="/prodetail/9430.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9431.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9434.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名.</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9435.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名.</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9436.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9437.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9438.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9440.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9441.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9442.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9443.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9444.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9446.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9447.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
								<div id="demo_pro">
									<a href="/prodetail/9450.aspx"> <img src="images/08.jpg" border="0" width="160px" height="120px" /> <span>图片名</span> </a>
								</div>
							</div>
							<div id="demo2_p"> </div>
						</div>
					</div>
				</div>
				<div class="products_bt">
				</div>
			</div>
		</div>
		<div class="foot">
			<p><br>Copyright &copy; 2017 网络科技有限公司 All rights reserved.</p>
		</div>
	</body>

</html>