<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String playerPath = basePath + "player";
String audioPath  = basePath + "audio" + "/animal/" + "test.mp3";;
String imagePath = basePath + "images";
session.setAttribute("basePath", basePath);
session.setAttribute("playerPath", playerPath);
session.setAttribute("audioPath", audioPath);
session.setAttribute("imagePath", imagePath);
%>
<!DOCTYPE html>
<html>
<title>HLS Player</title>
<head>
	<link rel="stylesheet" href="${basePath}static/css/animal.css" />
    <link rel="stylesheet" href="${playerPath}/mediaelementplayer.css" />
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdn.bootcss.com/vue/1.0.26/vue.js"></script>
    <script src="${playerPath}/mediaelement-and-player.js"></script>
<style>
.mejs-controls {
	display: none !important;
}
</style>
</head>
<body>
<div class="panel-group">
	<div class="panel panel-default">
		<div  class="panel-heading" id = "showTime" align="center" ></div>
	</div>
	<!-- Default panel contents -->
	<div class="panel panel-default">
	    <div class="row">
	    			<!-- 左側パネル:メディアリンク -->
			<div class="col-sm-3" align="left" style="border: 0px;">
			</div>

			<!-- 中央パネル:メディアプレイヤー -->
			<div class="col-sm-6" align="center" style="border: 0px;float">
				<div class="row">
					<div id="animal_tb">
						<animal-post  v-for="animal in animalList" v-bind:key="animal.id" v-bind:animal="animal"></animal-post>
					</div>
	  			</div>
	  			<!--${audioPath}-->
	  			<div style="display:none">
	  			<audio id="my-player" src="" type="audio/mp3" autostart="false2 loop="false" type="audio/mp3" controls preload hidden=true>
	  			</audio>
	  			</div>
			</div>

			<!-- 右側パネル:メディアリンク -->
			<div class="col-sm-3" align="right" style="border: 0px;">
			</div>

        </div>
	</div>

	<div class="panel panel-default" >
		<div  class="panel-footer navbar-fixed-bottom" align="center" style="margin-bottom : 10px">HLS Server by Tim.Zhang@2018</div>
	</div>
</div>
<%-- <script src="<%=basePath%>static/js/common.js" type="text/javascript"></script> --%>
<script src="<%=basePath%>/static/js/animal.js" type="text/javascript"></script>
</body>
</html>