<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="login">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<title>首页</title>

<link href="css/index.css" rel="stylesheet" />
<link href="css/init.css" rel="stylesheet" />
<style type="text/css">

</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy" style="margin-top:30px;">
	<jsp:include page="nav.jsp" flush="true"></jsp:include>
	
	<div class="container" id="content">
		<div class="row clearfix">
			<div class="col-lg-2" id="myScrollspy">
				<div class="panel-group" id="accordion" data-spy="affix" data-offset-top="125">
							<div class="panel panel-group-header">
								<div class="panel-heading">
								<span class="glyphicon glyphicon-th-list"></span>
								</div>
							</div>
							<div class="panel">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">HTML/CSS</a>
								</div>
								<div id="collapseOne" class="panel-collapse collapse">
									<div class="panel-body">
										<a href="#">HTML</a><a href="#">HTML5</a><a href="#">CSS</a><a href="#">CSS3</a><a href="#">Bootstrap</a><a href="#">Font&emsp;Awesome</a><a href="#">Foundation</a>
									</div>
								</div>
							</div>
							<div class="panel">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">JavaScript</a>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<a href="#">JavaScript</a><a href="#">JQuery</a><a href="#">AngularJS</a><a href="#">AngularJS2</a><a href="#">Vue.js</a><a href="#">React</a><a href="#">JQuery UI</a><a href="#">Node.js</a><a href="#">AJAX</a><a href="#">JSON</a><a href="#">HightCharts</a>
										<a href="#">Google地图</a>
									</div>
								</div>
							</div>
							<div class="panel">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">服务端</a>
								</div>
								<div id="collapseThree" class="panel-collapse collapse">
									<div class="panel-body">
										<a href="#">PHP</a><a href="#">JAVA</a><a href="#">Python</a><a href="#">Python3</a><a href="#">C</a><a href="#">C++</a><a href="#">JSP</a></div>
								</div>
							</div>
							<div class="panel">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">HTML/CSS</a>
								</div>
								<div id="collapseOne" class="panel-collapse collapse">
									<div class="panel-body">
										<a href="#">HTML</a><a href="#">HTML5</a><a href="#">CSS</a><a href="#">CSS3</a><a href="#">Bootstrap</a><a href="#">Font&emsp;Awesome</a><a href="#">Foundation</a>
									</div>
								</div>
							</div>
							<div class="panel">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">JavaScript</a>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<a href="#">JavaScript</a><a href="#">JQuery</a><a href="#">AngularJS</a><a href="#">AngularJS2</a><a href="#">Vue.js</a><a href="#">React</a><a href="#">JQuery UI</a><a href="#">Node.js</a><a href="#">AJAX</a><a href="#">JSON</a><a href="#">HightCharts</a>
										<a href="#">Google地图</a>
									</div>
								</div>
							</div>
							<div class="panel">
								<div class="panel-heading">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">服务端</a>
								</div>
								<div id="collapseThree" class="panel-collapse collapse">
									<div class="panel-body">
										<a href="#">PHP</a><a href="#">JAVA</a><a href="#">Python</a><a href="#">Python3</a><a href="#">C</a><a href="#">C++</a><a href="#">JSP</a></div>
								</div>
							</div>
							<div class="panel-group-footer">
							</div>
						</div>
				</div>
				<div class="col-lg-7" id="content-center">
					<div class="carousel slide" id="carousel-930279">
						<ol class="carousel-indicators">
							<li class="active" data-slide-to="0"
								data-target="#carousel-930279"></li>
							<li data-slide-to="1" data-target="#carousel-930279"></li>
							<li data-slide-to="2" data-target="#carousel-930279"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="img/default.jpg" />
								<div class="carousel-caption">
									<h4>First Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="img/default1.jpg" />
								<div class="carousel-caption">
									<h4>Second Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="img/default2.jpg" />
								<div class="carousel-caption">
									<h4>Third Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-930279"
							data-slide="prev"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#carousel-930279"
							data-slide="next"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>

					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#profile" data-toggle="tab">
								最新</a></li>
						<li><a href="#activity" data-toggle="tab">感兴趣</a></li>
						<li><a href="#edit" data-toggle="tab">Edit Profile &amp;
								Settings</a></li>
					</ul>
					<ul class="content-text">
						<li>
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a href="javaScript:void(0)" class="sessionName">JAVA</a>
									</h3>
									<a href="topic.jsp">题目sdf</a> <span
										class="glyphicon glyphicon-log-out"></span> 22
								</div>
								<div class="panel-body">
									<p>用起来感觉一般般，也可能是我带投石车的都不是高武武将吧。总是砸到自己人，砸敌人的sdfasdfsdfds</p>
									<ul style="width: 625px;">
										<li><img src="img/骑行.jpg" class="img-responsive"></li>
										<li><img src="img/骑行.jpg" class="img-responsive"></li>
										<li><img src="img/骑行.jpg" class="img-responsive"></li>
									</ul>
								</div>
								<div class="panel-footer">
									<span class="glyphicon glyphicon-user"></span> <a
										href="user.jsp" title="主题作者" target="_blank"> 1900lwy</a> <span
										class="glyphicon glyphicon-time"></span> <span class="time">10月
										10日 00:22</span>
								</div>
							</div>
						</li>
						<li>
							<div class="panel">
								<div class="panel-heading ">
									<h3 class="panel-title">
										<a href="javaScript:void(0)" class="sessionName">JAVA</a>
									</h3>
									<a href="topic.jsp">题目sdf</a> <span
										class="glyphicon glyphicon-log-in"></span>42
								</div>
								<div class="panel-body">
									<p>用起来感觉一般般，也可能是我带投石车的都不是高武武将吧。总是砸到自己人，砸敌人的sdfasdfsdfds</p>
									<ul style="width: 625px;">
										<li><img src="img/哦.jpg"></li>
										<li><img src="img/哦.jpg"></li>
										<li><img src="img/哦.jpg"></li>
									</ul>
								</div>
								<div class="panel-footer">
									<span class="glyphicon glyphicon-user"></span> <a
										href="user.jsp" title="主题作者" target="_blank"> 1900lwy</a> <span
										class="glyphicon glyphicon-time"></span> <span class="time">10月
										10日 00:22</span>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<div class="col-lg-3" id="content-right">
					<div class="panel panel-info">
						<div class="panel-heading  text-center">
							<img class="img-circle" src="img/骑行.jpg" width="60" height="60" />
						</div>
						<div class="panel-body">
							<h3 class="panel-title">
								Favorite Tags<a href="#" class="small">edit</a>
							</h3>
							<div style="line-height: 25px;">
								<span class="label label-info">java</span> <span
									class="label label-info">javascript</span> <span
									class="label label-info">bootstrap</span> <span
									class="label label-info">json</span> <span
									class="label label-info">mysql</span> <span
									class="label label-info">java</span> <span
									class="label label-info">javascript</span> <span
									class="label label-info">bootstrap</span> <span
									class="label label-info">json</span> <span
									class="label label-info">mysql</span>
							</div>
						</div>
					</div>
					<div class="panel panel-default" id="HotQuestion">
						<div class="panel-heading">
							<h3 class="panel-title">热议</h3>
						</div>
						<div class="panel-body">
							<ul class="">
								<li><span class="label label-success col-xs-1">1</span> <a
									href="#" class="col-xs-11"> This is fake right? "FACEBOOK
										USER LOCATION FINDER"This is fake right? "FACEBOOK USER
										LOCATION FINDER"</a></li>
								<li><span class="label label-success col-xs-1">1</span> <a
									href="#" class="col-xs-11"> This is fake right? "FACEBOOK
										USER LOCATION FINDER"This is fake right? "FACEBOOK USER
										LOCATION FINDER"</a></li>
								<li><span class="label label-success col-xs-1">1</span> <a
									href="#" class="col-xs-11"> This is fake right? "FACEBOOK
										USER LOCATION FINDER"This is fake right? "FACEBOOK USER
										LOCATION FINDER"</a></li>
								<li><span class="label label-success col-xs-1">1</span> <a
									href="#" class="col-xs-11"> This is fake right? "FACEBOOK
										USER LOCATION FINDER"This is fake right? "FACEBOOK USER
										LOCATION FINDER"</a></li>
								<li><span class="label label-success col-xs-1">1</span> <a
									href="#" class="col-xs-11"> This is fake right? "FACEBOOK
										USER LOCATION FINDER"This is fake right? "FACEBOOK USER
										LOCATION FINDER"</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<a href="#" class="btn btn-link" id="return_top"></a>
</body>
	<script type="text/javascript">
	 	/*session的跳转*/
	 	$(function(){
	 		$('.sessionName').click(function(){
	 			location.href="Session?op=toSession&sessionName="+$(this).html();
	 		});//end sessionName.click
	 	});
	</script>
</html>