<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="loginAndRegister">
<meta charset="UTF-8">
<title></title>
<link href="css/login.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<style type="text/css">
body {
	font: normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;
	color: #222;
	background: url(img/pattern.png);
	overflow-y: scroll;
}
</style>
</head>
<body>
	<div class="form" >
		<div id="landing">登录</div>
		<div id="registered">注册</div>
		<div class="fix"></div>
		 <div id="landing-content" class="show">
			<form class="form-horizontal " role="form"
				action="UserServlet?op=login" method="post" id="FormLogin">
				<div id="photo">
					<img src="img/photo.jpg" />
				</div>
				<div class="inp">
					<input type="email" placeholder="邮箱" id="inputEmail" name="email" />
				</div>
				<div class="inp">
					<input type="password" placeholder="密码" name="password"
						id="inputPassword" /> <small><input type="checkbox"
						name="rememberMe" value="yes" id="rememberMe" />记住我</small>
				</div>
				<div class="login" id="login">登录</div>
				<div id="bottom">
					<a href="forgetPassword.jsp"><span id="forgotpassword">忘记密码</span></a>
				</div>
			</form>
		</div>
		
		
		<div id="registered-content" class="hidden">
			<form class="form-horizontal " role="form"
				action="UserServlet?op=register" method="post" id="Formregister">
				
				<div class="inp">
					<input type="text" placeholder="请输入用户名" name="rname" id="rname" />
					<small class="hidden">中文、字母、数字或下划线的组合<span class='triangle-left'></span></small>
				</div>
				<div class="inp">
					<input type="password" placeholder="请输入密码" name="rpassword" id="rpassword" />
					<small class="hidden">字母开头，6~18个字母和数字<span class='triangle-left'></span></small>
				</div>
				<div class="inp">
					<input type="password" placeholder="请再次输入密码" name="ensurePassword" id="ensurePassword"/>
					<small class="hidden">两次输入的密码不同<span class='triangle-left'></span></small>
				</div>
				<div class="inp">
					<input type="text" placeholder="电子邮箱" name="remail" id="remail"/>
					<small class="hidden">邮箱格式错误<span class='triangle-left'></span></small>
				</div>
				<div class="ensureEmail">
					<input type="text" placeholder="验证码" name="captcha" id="captcha" />
					<a href="javaScript:void(0)" id="sendEmail"><span id="reSend">邮箱验证</span></a>
					<small class="hidden" id="reSmall">请到邮箱查看验证码<span class='triangle-left'></span></small>
				</div>
				<div class="login" id="register">立即注册</div>
			</form>
		</div>
	</div>


</body>

<script type="text/javascript">
	/*发送邮箱验证，ajax*/
	$(document).ready(function(){
		$("#sendEmail").click(function(){
			if($("#remail").val()==""){
				$("#remail").focus();
				$("#remail").siblings("small").show(300);
			}else{
				var param = {
					"op" : "emailCaptcha",
					"remail" : $("#remail").val()
				}
				$.post("AuthenticateServlet",param,function(data){
					console.log(data);
					if(data == "false"){
						$("#reSmall").html("发送失败，请检查邮箱");
						$("#reSmall").show(300);
					}else{
						$("#reSmall").html("发送成功，请在邮箱查看验证码");
						$("#reSmall").show(300);
					}
					$("#sendEmail").css('opacity','0.5');
					$("#reSend").html("重新发送");
				});	
			}
		});
	});
	/*校验验证码是否正确,ajax*/
	$(document).ready(function(){
		$("#captcha").blur(function(){
			var param = {
				"op" :"toCheckEmailCaptcha",
				"captcha" :$("#captcha").val()
			}
			$.post("AuthenticateServlet",param,function(data){
				console.log(data);
				if(data == "true"){
					$("#reSmall").hide();
					$("#reSmall").html("true");
				}else{
					$("#reSmall").html("验证码错误!<span class='triangle-left'></span>");
					$("#reSmall").show(300);
				}
			});
		});
	});
	/*点击登录和注册的动作*/
	$(document).ready(function() {

		$(".form").slideDown(300);

		$("#landing").addClass("border-btn");

		$("#registered").click(function() {
			$("#landing").removeClass("border-btn");
			$("#landing-content").hide(300);
			$(this).addClass("border-btn");
			$("#registered-content").show(300);
		})

		$("#landing").click(function() {
			$("#registered").removeClass("border-btn");
			$(this).addClass("border-btn");

			$("#landing-content").show(300);
			$("#registered-content").hide(300);
		})
	});

	/*表单校验*/
	$(document).ready(function(){	
		
		/*验证名字*/
		$("#rname").blur(function(){
			var regName = /^[\u4e00-\u9fa5\w+$]/;
			if(!regName.test($(this).val())||$(this).val()==""){
				$("#rname").siblings("small").show(300);
			}else{
				$.post("UserServlet",{"op":"isNameExist","uname":$("#rname").val()},function(data){
					if(data=="true"){
						$("#rname").siblings("small").html('用户名已存在');
						$("#rname").siblings("small").show(300);
					}else{
						$("#rname").siblings("small").hide();
						$("#rname").siblings("small").html("中文、字母、数字或下划线的组合<span class='triangle-left'></span>");
					}
				});
			}
		});
		/*验证密码*/
		$("#rpassword").blur(function(){
			var regPass = /^[a-zA-Z]\w{5,17}$/;
			if(!regPass.test($(this).val())||$(this).val()==""){
				
				$(this).siblings("small").show(300);
			}else{
				$(this).siblings("small").fadeOut(300);
			}
		});
		/*确认密码*/
		$("#ensurePassword").blur(function(){
			if($(this).val()!=$("#rpassword").val()){
				$(this).siblings("small").show(300);
			}else{
				$(this).siblings("small").fadeOut(300);
			}
		});
		/*验证邮箱*/
		$("#remail").blur(function(){
			var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if(!regEmail.test($(this).val())||$(this).val()==""){
				$(this).siblings("small").show(300);
			}else{
				$(this).siblings("small").fadeOut(300);
			}
		});
		/*表单提交*/
		$("#login").click(myLogin);
		/*键盘监听事件*/
		$(document).on('keydown',function(event){
			if(event.keyCode==13){
				myLogin();
			}
		});
		function myLogin() {
			if($("#inputEmail").val()==""){
				$("#inputEmail").focus();
			}else if($("#inputPassword").val()==""){
				$("#inputPassword").focus();
			}else{
				$("#FormLogin").submit();				
			}
		}
		$("#register").click(function() {
			var regName = /^[\u4e00-\u9fa5\w+$]/;
			var regPass = /^[a-zA-Z]\w{5,17}$/;
			var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if(!regName.test($("#rname").val())||$("#rname").val()==""){
				$("#rname").focus();
				$("#rname").siblings("small").show(300);
			}else if(!regPass.test($("#rpassword").val())||$("#rpassword").val()==""){
				$("#rpassword").focus();
				$("#rpassword").siblings("small").show(300);
			}else if($("#ensurePassword").val()!=$("#rpassword").val()){
				$("#ensurePassword").focus();
				$("#ensurePassword").siblings("small").show(300);
			}else if(!regEmail.test($("#remail").val())||$("#remail").val()==""){
				$("#remail").focus();
				$("#remail").siblings("small").show(300);
			}else if($("#reSmall").html()!="true"){
				$("#captcha").focus();
				$("#reSmall").show(300);
			}else{
				$("#Formregister").submit();				
			}
		});
	});
	/*ajax 自动回填密码*/
	$(function() {
		$("#inputEmail").blur(function() {
			var param = {
				"op" : "getPassword",
				"email" : this.value
			};
			$.post("UserServlet", param, function(data) {
				$("#inputPassword").val(data);
				$("#rememberMe").attr("checked", "checked");
			});
		});
	});
</script>

</html>