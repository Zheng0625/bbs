<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>主体内容</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<link href="${APP_PATH}/static/css/css.css" rel="stylesheet">
</head>
<body>
	<%-- 方便ajax获取APP_PATH --%>
	<input id="APP_PATH" type="hidden" value="${APP_PATH}">
	<%-- 方便ajax获取session中的userid --%>
	<input id="session_userid" type="hidden" value="${userid}">
	<!--主体（下）-->
	<div class="container">
		<div class="row">
			<!--左边板块-->
			<div id="content_left">
			<!-- 轮播 -->
				<div class="layui-carousel" id="test1" lay-filter="test1">
					<div carousel-item="">
						<div><img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569248277273&di=98cf1bdbf6a49a820666d8a699356d85&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F3af0ab269d05a082eaaf03c5d3fffdabb4cd3ea317a80-66bQGb_fw658"></div>
						<div><img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569248277273&di=181cbea4a78cea58cf979e8a21973852&imgtype=0&src=http%3A%2F%2Fimg.zxxk.com%2F2014-3%2FZXXKCOM201403061200457651497.jpg"></div>
						<div><img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569248463094&di=2f2d742e48f898a28a6989fa37b695c9&imgtype=jpg&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D1735688044%2C4235283864%26fm%3D214%26gp%3D0.jpg"></div>
						<div><img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569248277272&di=be655e89822473da9d5af580ff517dad&imgtype=0&src=http%3A%2F%2Fi3.sinaimg.cn%2Fgm%2Fo%2Fi%2F2008-09-03%2FU1901P115T41D148033F757DT20080903105357.jpg"></div>
						<div><img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569248277271&di=1f4923b1a5def33ed54260fa0269db81&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fc257e795d3995caa6e26066c0ac6c946b703f8142a7bf-O4f6mz_fw658"></div>
					</div>
				</div>
				<!--代码部分begin-->
				<div class="jq22">
					<!-- 帖子展示-循环 -->
					<div id="articles_all"></div>
					<div class="text-center more" id="appendMore"></div>
				</div>
				<div class="row">
					<div class="col-md-12"
						style="position: relative; background-color: #f6f6f6; height: 30px;"></div>
				</div>
			</div>


			<!--右边板块-->
			<div id="content_right">
				<div class="row">
					<div class="col-md-12"
						style="position: relative; padding-top: 10px;">
						<b>所有板块</b>
						<hr>
					</div>
				</div>
				<!-- 板块展示-循环 -->
				<div class="row" id="plates_all"></div>
				<div class="row">
					<div class="col-md-12"
						style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
				</div>

				<div class="row">
					<div class="col-md-12"
						style="position: relative; padding-top: 10px;">
						<b>热门文章</b>
						<hr>
					</div>
				</div>
				<!-- 热门帖子展示-循环 -->
				<div id="hotArticle_all"></div>

				<div class="row"
					style="position: relative; background-color: #f6f6f6; height: 10px;"></div>

				<div class="row"
					style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
				<div class="row">
					<div class="col-md-12"
						style="position: relative; padding-top: 10px;">
						<b>许愿墙简介</b>
						<hr>
					</div>
				</div>
				<div>
					<p style="line-height: 30px;">该许愿墙之所以存在是为了方便大家在一起许愿、学习、祝福、祈祷</p>
				</div>

				<div class="row"
					style="position: relative; background-color: #f6f6f6; height: 10px;"></div>

    <div class="row" style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
            <div class="row">
                <div class="col-md-12" style="position: relative; padding-top: 10px;">
                    <b>访问统计</b>
                    <hr>
                </div>
            </div>
            <div style="" id="visit_country"></div>
            <hr>
            <div style="height:530px; margin: 0px auto;" id="visit_province"></div>

				<div class="row"
					style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
				<div class="row">
					<div class="col-md-12"
						style="position: relative; padding-top: 10px;">
						<b>友情链接</b>
						<hr>
					</div>
				</div>
				<div style="line-height: 30px;">
					<p>
						<a
							href="https://baike.baidu.com/item/%E8%AE%B8%E6%84%BF/3013528?fr=aladdin"
							target="_blank"> <b class="text-primary">许愿</b> - <small>百度百科</small>
						</a>
					</p>
					<p>
						<a
							href="http://image.baidu.com/search/index?tn=baiduimage&ps=1&ct=201326592&lm=-1&cl=2&nc=1&ie=utf-8&word=%E8%AE%B8%E6%84%BF"
							target="_blank"> <b class="text-primary">图片</b> - <small>百度图片</small>
						</a>
					</p>
				</div>

				<div class="row"
					style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
				<div class="row"></div>

				<div style="line-height: 30px;"></div>

				<div class="row"
					style="position: relative; background-color: #f6f6f6; height: 10px;"></div>

				<div class="row"></div>
				<div style="line-height: 20px;"></div>

			</div>
		</div>
	</div>

	<jsp:include page="/content/top.jsp"></jsp:include>

	<script src="${APP_PATH }/static/js/content/content.js"></script>
	<script src="${APP_PATH }/static/js/content/comment.js"></script>
	<script src="${APP_PATH }/static/js/content/attention.js"></script>
	<script src="${APP_PATH }/static/js/content/collect.js"></script>
	<script src="${APP_PATH }/static/js/content/plate.js"></script>
	<script src="${APP_PATH }/static/js/content/article.js"></script>


	<script src="${APP_PATH }/static/js/phones_pc.js"></script>
	<script src="${APP_PATH }/static/js/load_more.js"></script>
	<script src="${APP_PATH }/static/js/echars/echarts.min.js"></script>

</body>
</html>
