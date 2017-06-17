<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href='styles/login.css' rel='stylesheet' type='text/css'>
		<script type="text/javascript" src="scripts/jquery-1.4a2.min.js"></script>
		<script type="text/javascript" src="scripts/slideShow.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#KinSlideshow").KinSlideshow({
					intervalTime:4, 
					titleBar:{titleBar_height:30,titleBar_bgColor:"#08355c",titleBar_alpha:0.5},
                	titleFont:{TitleFont_size:12,TitleFont_color:"#FFFFFF",TitleFont_weight:"normal"},
                	btn:{btn_bgColor:"#FFFFFF",btn_bgHoverColor:"#1072aa",btn_fontColor:"#000000",
                    btn_fontHoverColor:"#FFFFFF",btn_borderColor:"#cccccc",
                    btn_borderHoverColor:"#1188c0",btn_borderWidth:1}
				});
			})
		</script>
		<title>管理员登录</title>
	</head>

	<body>
		<div class="banner">
			
			<div id="KinSlideshow">
				<a href="#"><img src="images/bg.png" alt="多年的经营过程中，不断优化货源渠道，使产品价格更具竞争力！" width="720" height="400" /></a>
				<a href="#"><img src="images/bg.png" alt="多年的经营过程中，不断优化货源渠道，使产品价格更具竞争力！" width="720" height="400" /></a>
				<a href="#"><img src="images/bg.png" alt="多年的经营过程中，不断优化货源渠道，使产品价格更具竞争力！" width="720" height="400" /></a>
			</div>

			<div class="login-aside">
				<div id="o-box-up"></div>
				<div id="o-box-down" style="table-layout:fixed;">
					<form class="registerform" action="login" method="post" >
						<div class="fm-item">
							<label for="logonId" class="form-label">管理员登录：</label>
							<input type="text" placeholder="请输入账号" maxlength="100" id="username" name="name" class="i-text" datatype="s6-18" errormsg="用户名至少6个字符,最多18个字符！">
							<div class="ui-form-explain"></div>
						</div>

						<div class="fm-item">
							<label for="logonId" class="form-label">管理员密码：</label>
							<input type="password" placeholder="请输入密码" maxlength="100" id="password" name="pwd" class="i-text" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！">
							<div class="ui-form-explain"></div>
						</div>
						<div><label for="logonId" class="form-label">${mes }</label></div>
						<div class="fm-item">
							<label for="logonId" class="form-label"></label>
							<input type="submit" value="" tabindex="4" id="send-btn" class="btn-login"><br>
							<a href="index.html"><input type="button" value="" tabindex="4" id="send-btn" class="btn-logout"></a>
							<div class="ui-form-explain"></div>
						</div>
					</form>
				</div>
			</div>
	</body>

</html>