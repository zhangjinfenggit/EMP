<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="IE=7.0000" http-equiv="X-UA-Compatible">
<title>网络科技有限公司-公司简介</title>
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
					<a title="公司简介" href="aboutus.jsp">新闻公告</a>
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
</div>
<div class="banner"> 
<div class="img">
<img src="images/banner_07.jpg" width="984" height="336">
</div>
</div>
<span class="blank31"></span>
    <div class="area clearfix">
    <table class="tab_a1" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td class="tab_a2">
                       <div>
                       <div class="tit"> <span class="fsp">A</span>
 <h3>BOUT US</h3>
  <h2>关于震东</h2>
 
</div>
                      
                       
                         <a class="xys" title="别墅" href="/product/BieShu">
                         别墅</a>
                           <a class="xys" title="多层公寓" href="/product/DuoCengGongYu">
                           多层公寓</a>
                           <a class="xys" title="高层公寓" href="/product/GaoCengGongYu">
                           高层公寓</a>
                           <a class="xys" title="城市综合体" href="/product/ChengShiZongHeTi">
                           城市综合体</a>
                  </div>
                   <div class="clear"></div>
                   <div class="left_contact">
                  <h3>联系我们<span>contact</span></h3>
                  <div><p><span>绿城房产建设管理有限公司<br />地　　址：中国杭州市杭大路1号黄龙世纪广场 A 座 9 楼<br />业务咨询：0086-571-87901266<br />总　　机：0086-571-87957388<br />联 系 人：何宇<br />邮　　编：310007<br /></span>&nbsp;</p></div>
                   </div>
                    </td>
                <td class="tab_a3">
                    
                    <div class="sub_a1">
                      <span>培训通知</span> </div>
                    <div style="margin-bottom: 34px; overflow: hidden; padding-top: 30px">
                      
                        <center><h2>${train.title }</h2></center>
                        <br>
                         <center><span>讲师：${train.teacher}</span></center>
                         <br>
                         <center><span>时间：${train.time}</span></center>
                        <p>${train.description}</p>
                       
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>
   
<div class="foot">
			<p><br>Copyright &copy; 2017 网络科技有限公司 All rights reserved.</p>
		</div>
</body>
</html>