<%--
  Created by IntelliJ IDEA.
  User: Dirge
  Date: 2019/5/7
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>河工程分享群-首页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-1.11.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/main.js"></script>
    <script src="/js/common.js"></script>
    <script src="/js/cookie.js"></script>
    <script>
        // 想要获取的cook键值
        var cookie_name= "SHARE_COOKIE_HEBEU";
        // 调用
        var cookie_value = getCookie(cookie_name);
        $.ajax({
            type: "GET",
            url: "/user/token/"+cookie_value,
            success: function (data) {
                console.log(data);
                if (data.status == 200) {
                    $("#register_btn").hide();
                    $("#login_btn").hide()
                    $("#user_a").text(data.data.userName);
                    $("#userid").val(data.data.userId);
                    $("#user_a").show();
                    $("#tuideng").show();
                }
            }
        });
    </script>

    <script>
        window.onload = function () {


            //面向对象实现选项卡
            var t1 = new Tab("head-Tabs");

            t1.init();

            //herfbang();
        };
    </script>

</head>

<body>


<div class="container">

    <!-- 顶部间隙 -->
    <div style="height: 4px"></div>
    <!-- 顶部间隙 End-->

    <!-- 导航栏 -->
    <nav class="navbar navbar-default" id="home_nav">

        <!-- 小屏幕时导航栏被压缩  包括logo-->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#navbar-collapse" aria-expanded="false">
                <!-- 小屏幕显示不全时，显示三条杠 -->
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand">河工程分享论坛</a>
        </div>
        <!-- 小屏幕时导航栏被压缩 -->

        <!-- 导航主体 -->
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav nav-tabs  nav-pills ">
                <li role="presentation" class="active"><a href="/" target="_self">我的主页</a></li>
                <li role="presentation"><a href="/page/download" target="_self">资料下载</a></li>
                <li role="presentation"><a href="/page/bbs" target="_self">工程论坛</a></li>
                <li role="presentation"><a href="/page/aboutwe" target="_self">关于我们</a></li>
                <li role="presentation" class="pull-right">

                    <button type="button" class="btn btn-success"  style="display: none" id="user_a"></button>
                    <button type="button" class="btn btn-default"  style="display: none" id="tuideng" onclick="$.cookie('SHARE_COOKIE_HEBEU', '', {expires: -1}); alert('退登成功'); window.location='/';">退登</button>
                    <button type="button" class="btn btn-default" onclick="window.location='/page/login'" id="login_btn">登录</button>
                    <button type="button" class="btn btn-success" onclick="window.location='/page/register'" id="register_btn"><span
                            class="glyphicon glyphicon-pencil"></span>&nbsp;免费注册
                    </button>
                </li>
            </ul>
            <form class="navbar-form">

                <!-- 站点地图 -->
                <ul class="breadcrumb" style="display: inline-block;padding-top: 10px" ;>
                    <li><span class="glyphicon glyphicon-home" aria-hidden="true"></span></li>
                    <li><a href="#">我的主页</a></li>
                </ul>
                <!-- 站点地图 End -->

                <!-- 搜索栏 -->
                <button type="submit" class="btn btn-default pull-right">搜索</button>
                <input id="secTxt" type="text" class="form-control pull-right" style="width:200px;"
                       placeholder="请输入查找内容">
                <!-- 搜索栏  End -->

            </form>
        </div>
        <!-- 导航主体 End -->

    </nav>
    <!-- 导航栏 End-->

    <!-- 广告栏 -->
    <div class="" style="height: 260px;">

        <div class="jumbotron">
            <h3>广告栏</h3>
            <p>这里是想写的文本。。。。。</p>
            <a href="#" class="btn btn-danger btn-lg">阅读更多</a>
        </div>

    </div>
    <!-- 广告栏 End -->

    <!-- 主体部分-->
    <div class="row" style="position: relative">


        <!-- 侧边栏 -->
        <div class="col-xs-3">


            <!-- 属性面板 -->
            <div class="panel panel-primary">
                <div class="panel-heading">个人面板</div>
                <div class="panel-body" style="margin-bottom: -26px;overflow: hidden">

                    <a href="#" style="position: absolute;right: 3px;top: 48px"><img src="img/setting.ico" width="50%"></a>

                    <div style="text-align: center; margin: 4px">
                        <a href="">
                            <img src="img/头像.jpg" height="150px" width="150px" class="img-circle"
                                 style="text-align: center;border: #36a2d1 1px solid">
                        </a>
                    </div>

                    <div id="idPan">
                        <table>
                            <tr>
                                <td>
                                    <h3>${user.nickName}</h3>
                                    <span class="glyphicon glyphicon-grain"></span>
                                    <a>${user.enrollmentYear}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="glyphicon glyphicon-heart-empty"></span>
                                    <a>${user.score} 积分</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="glyphicon glyphicon-education"></span>
                                    <a>${academyName}</a><br>
                                    <a style="margin-left: 26px">${professionName}</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="glyphicon glyphicon-certificate"></span>
                                    <a>等级：14级 (${user.experience}/500)</a>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped active" role="progressbar"
                                             aria-valuenow="45" aria-valuemin="2em" aria-valuemax="100"
                                             style="width: 45%">
                                            45%
                                        </div>
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </div>

                </div>
            </div>
            <!-- 属性面板 end -->

            <hr>

            <!-- 互动面板 -->
            <div class="panel panel-info">
                <div class="panel-heading">互动</div>
                <div class="panel-body">
                    <div id="hdPan">
                        <table class="col-xs-12 ba_color">
                            <tr>
                                <td>
                                    <a onclick="alert_show()">
                                        <span class="glyphicon glyphicon-floppy-open"></span>
                                        <br>
                                        <br>
                                        分享资料
                                    </a>
                                </td>
                                <td>
                                    <a href="#">
                                        <span class="glyphicon glyphicon-edit"></span>
                                        <br>
                                        <br>
                                        写回答
                                    </a>
                                </td>
                                <td>
                                    <a href="#">
                                        <span class="glyphicon glyphicon-list-alt"></span>
                                        <br>
                                        <br>
                                        提问题
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 互动面板 End-->

            <hr>

            <!-- 论坛信息面板 -->
            <div class="panel panel-warning">
                <div class="panel-heading">论坛信息</div>
                <div class="panel-body" style="margin-bottom: -26px">

                    <div id="infPan">
                        <table class="table table-condensed table-hover">
                            <tr>
                                <td><span class="glyphicon glyphicon-exclamation-sign"></span></td>
                                <td><a>我的消息</a></td>
                                <td class="b3"><span class="badge">5</span></td>
                            </tr>
                            <tr>
                                <td class="b1"><span class="glyphicon glyphicon-briefcase"></span></td>
                                <td class="b2"><a>我的收藏</a></td>
                                <td class="b3"><span class="badge" style="display: none">0</span></td>
                            </tr>
                            <tr>
                                <td class="b1"><span class="glyphicon glyphicon-tag"></span></td>
                                <td class="b2"><a>我关注的问题</a></td>
                                <td class="b3"><span class="badge" style="display: none">0</span></td>
                            </tr>
                            <tr>
                                <td class="b1"><span class="glyphicon glyphicon-earphone"></span></td>
                                <td class="b2"><a>我的邀请</a></td>
                                <td class="b3"><span class="badge" style="">3</span></td>
                            </tr>
                            <tr>
                                <td class="b1"><span class="glyphicon glyphicon-file"></span></td>
                                <td class="b2"><a>我的回答</a></td>
                                <td class="b3"><span class="badge" style="display: none">0</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 论坛信息面板 End-->

            <hr>

            <!-- 标签面板 -->
            <div class="panel panel-success">
                <div class="panel-heading">标签</div>
                <div class="panel-body">

                    <c:forEach items="${json}" var="lab" varStatus="status">
                        <button type="button" class="btn btn-success dropdown-toggle btn-group-xs pull-left"
                                aria-haspopup="true" aria-expanded="false" style="margin: 2px">${lab.name}
                        </button>
                    </c:forEach>


                </div>
            </div>
            <!-- 标签面板 End-->


        </div>
        <!-- 侧边栏 End-->

        <div class="col-xs-9" style="padding: 0px;">

            <!-- 分栏广告板 -->
            <div id="head-Tabs" style="height: auto;">

                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default" style="background: #ffcc63">热门主题</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">最新帖子</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">最新回复</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">悬赏任务</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">我的属性</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">社区成员</button>
                    </div>
                </div>

                <div class="sel_pan">
                    <div class="sel_div" style="display: block;">111</div>
                    <div class="sel_div">222</div>
                    <div class="sel_div">333</div>
                    <div class="sel_div">444</div>
                    <div class="sel_div">555</div>
                    <div class="sel_div">666</div>
                </div>

            </div>
            <!-- 分栏广告板 End -->

            <!-- 资源分享区 -->
            <div class="panel-group" id="homeBody_pane">


                <!-- 专业课-资料下载 -->
                <c:forEach items="${catgoryP}" var="par">
                    <div class="panel panel-default">
                        <div class="panel-heading" data-toggle="collapse" data-target="#body_pan${par.id}"
                             data-parent="#homeBody_pane">
                            <h4 class="panel-title">
                                <a style="text-decoration-line: none; color: #5bc0de">${par.name}</a>
                            </h4>
                        </div>

                        <div class="collapse panel-collapse" id="body_pan${par.id}">
                            <div class="panel-body">
                                <div class="row">
                                    <c:forEach items="${listCategory}" var="category">
                                        <c:forEach items="${category}" var="itemCategory">
                                            <c:if test="${par.id==itemCategory.parentId}">
                                                <div class="mini_div col-xs-12 col-md-6 col-lg-4">
                                                    <div class="mini_top">
                                                        <img class="img-rounded" src="img/math.jpg">
                                                        <div>
                                                            <p><a href="#"
                                                                  style="font-size: 16px">${itemCategory.name}</a></p>
                                                            <p style="font-size: 12px;line-height: 8px">相关资料：45</p>
                                                            <p style="font-size: 12px;line-height: 8px">最新上传: 1 分钟前</p>
                                                        </div>
                                                    </div>
                                                    <div class="mini_down">
                                                        <table class="table table-condensed table-hover">
                                                            <c:forEach items="${listContent}" var="content">
                                                                <c:forEach items="${content}" var="itemContent">
                                                                    <c:if test="${itemCategory.id==itemContent.categoryId}">
                                                                        <tr>
                                                                            <td class="c1">1</td>
                                                                            <td class="c2"><a
                                                                                    href="/resources/${itemContent.id}">${itemContent.title}</a>
                                                                            </td>
                                                                            <td class="c3"><span>04-15/11:40</span></td>
                                                                        </tr>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </table>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </div>

                                <ul class=" pagination pagination-sm " style="position: relative; left: 300px">
                                    <li><a>&laquo;</a></li>
                                    <li class="active"><a>1</a></li>
                                    <li><a>2</a></li>
                                    <li><a>3</a></li>
                                    <li><a>4</a></li>
                                    <li><a>5</a></li>
                                    <li><a>6</a></li>
                                    <li><a>&raquo;</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </c:forEach>
                <!-- 专业课-资料下载 End-->


            </div>
            <!-- 资源分享区 End-->

        </div>

        <!--页尾 -->
        <div class="col-xs-12" style="height: 200px;border: 1px rebeccapurple solid;margin-top: 20px"></div>
        <!--页尾 End-->

    </div>


</div>


<!-- 弹窗与遮罩 -->
<div id="cover" class="hide"></div>
<div id="alert" class="hide">
    <form id="pubForm_mod" name="pubForm_mod" method="post">
        <input value="" name="userId" style="display: none" id="userid">
    <!-- 属性面板 -->
    <div class="panel panel-info">
        <div class="panel-heading">
            分享网盘文件
        </div>
        <div class="panel-body" id="share_alert_body">

            <input type="text" class="form-control" id="share_title" placeholder="标题" name="title">

            <textarea class="form-control" style="resize:none;margin-top: 12px" rows="4" placeholder="请描述所分享的内容"
                      id="share_info" name="titleDesc"></textarea>

            <div style="margin-top: 14px">
                    <div class="form-group">
                        <label for="panUrl" class="col-sm-2 control-label" >网盘网址：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="panUrl" name="url"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="panCode" class="col-sm-2 control-label">分享密码：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="panCode" name="password"/>
                        </div>
                    </div>
            </div>
                <div>
                    <p style="position: relative;left: 300px;display: inline-block;font-size: 16px;">添加附件（大小不得超过100KB）
                        <input type="file" id="share_InputFile" style="display: inline-block;margin-left: 8px">
                    </p>
                </div>

                <hr>

                <div>
                    <h5 style="display:inline-block;">适用年级:</h5>
                    <div class="btn-group btn-group-sm" role="group" aria-label="年级"
                         style="margin-bottom: 2px;margin-left: 8px; display:inline-block;">
                        <input name="gradeLevel" id="gradeLevel"  style="display: none"/>
                        <button type="button" class="btn btn-default"onclick="$('#gradeLevel').val('大一')">大一</button>
                        <button type="button" class="btn btn-default" onclick="$('#gradeLevel').val('大二')">大二</button>
                        <button type="button" class="btn btn-default" onclick="$('#gradeLevel').val('大三')">大三</button>
                        <button type="button" class="btn btn-default" onclick="$('#gradeLevel').val('大四')">大四</button>
                        <button type="button" class="btn btn-default" onclick="$('#gradeLevel').val('通用')">通用</button>
                    </div>

                    <h5 style="display:inline-block;margin-left: 32px">选填:</h5>
                    <select class="form-control btn-xs"
                            style="width: 140px;margin-left: 8px; display:inline-block; " id="academy" name="academyId">
                    </select>

                    <select class="form-control btn-xs"
                            style="width: 140px;margin-left: 8px; display:inline-block;" id="profession" name="professionId">
                    </select>
                </div>


                <!-- 资料所属分类 -->
                <div style="margin-top: 4px">
                    <h5 style="display:inline-block;">资源分类:</h5>
                    <select class="form-control btn-xs" style="width: 140px;margin-left: 8px; display:inline-block;"  id="resource_big" name="macrotaxonomy">
                    </select>
                    <select class="form-control btn-xs" style="width: 140px;margin-left: 8px; display:inline-block;" id="resource_item" name="categoryId">
                    </select>

                    <select class="form-control btn-xs" style="width: 140px;margin-left: 8px; display:inline-block;" id="fenlei" name="classify">
                    </select>


                    <select class="form-control btn-xs" style="width: 140px;margin-left: 8px; display:inline-block;" id="wenjiangeshi" name="format">
                    </select>

                </div>

                <!-- 资料来源 -->
                <div style="margin-top: 4px">
                    <h5 style="display:inline-block;">是否原创:</h5>
                    <label style="margin-left: 8px">
                        <input type="radio" name="source" id="op5" value="1" checked>我是原创
                    </label>

                    <label style="margin-left: 8px">
                        <input type="radio" name="source" id="op6" value="2">来源于互联网
                    </label>

                    <label style="margin-left: 8px">
                        <input type="radio" name="source" id="op7" value="3">来源于其他渠道
                    </label>

                </div>


        </div>
        <div class="panel-footer" style="text-align: center;">
            <button type="submit" class="btn btn-success btn-lg" style="width: 150px;" onclick="release()">确认提交</button>
            <button type="submit" class="btn btn-danger btn-lg" style="width: 150px;margin-left: 30px"
                    onclick="alert_hide()">取消返回
            </button>
        </div>
    </div>
    <!-- 属性面板 end -->

    </form>
</div>
<script>
        //$("#resource_big").remove();//清空select列表数据
        function selects(id ,atr){
            $.ajax({
                type : "POST",
                url : "/ContentCategory/"+id,
                success : function(data) {
                    console.log(data);
                    $("#"+atr+"").prepend("<option value='0'>请选择</option>");//添加第一个option值
                    for (var i = 0; i < data.data.length; i++) {
                        //如果在select中传递其他参数，可以在option 的value属性中添加参数
                        //$("#selectSM").append("<option value='"+msg.rows[i].id+"'>"+msg.rows[i]+"</option>");
                        $("#"+atr).append("<option value='"+data.data[i].id+"'>"+data.data[i].name+"</option>");
                    }
                }
            });
        }
        selects(61,"fenlei");
        selects(100,"resource_big");
        selects(62,"wenjiangeshi");
        $.ajax({
            type : "POST",
            url : "/academy/list",
            success : function(data) {
                console.log(data);
                $("#academy").prepend("<option value='0'>请选择</option>");//添加第一个option值
                for (var i = 0; i < data.data.length; i++) {
                    //如果在select中传递其他参数，可以在option 的value属性中添加参数
                    //$("#selectSM").append("<option value='"+msg.rows[i].id+"'>"+msg.rows[i]+"</option>");
                    $("#academy").append("<option value='"+data.data[i].academyId+"'>"+data.data[i].academyName+"</option>");
                }
            }
        });
        $("#resource_big").change(function (e) {
            $("#resource_item").empty();
            console.log($("#resource_big").val());
            $.ajax({
                type : "POST",
                url : "/ContentCategory/"+$("#resource_big").val(),
                success : function(data) {
                    console.log(data);
                    $("#resource_item").prepend("<option value='0'>请选择</option>");//添加第一个option值
                    for (var i = 0; i < data.data.length; i++) {
                        //如果在select中传递其他参数，可以在option 的value属性中添加参数
                        //$("#selectSM").append("<option value='"+msg.rows[i].id+"'>"+msg.rows[i]+"</option>");
                        $("#resource_item").append("<option value='"+data.data[i].id+"'>"+data.data[i].name+"</option>");
                    }
                }
            });

        });
        $("#academy").change(function (e) {
            $("#profession").empty();
            console.log($("#academy").val());
            $.ajax({
                type : "POST",
                url : "/profession/"+$("#academy").val(),
                success : function(data) {
                    console.log(data);
                    $("#profession").prepend("<option value='0'>请选择</option>");//添加第一个option值
                    for (var i = 0; i < data.data.length; i++) {
                        //如果在select中传递其他参数，可以在option 的value属性中添加参数
                        //$("#selectSM").append("<option value='"+msg.rows[i].id+"'>"+msg.rows[i]+"</option>");
                        $("#profession").append("<option value='"+data.data[i].professionId+"'>"+data.data[i].professionName+"</option>");
                    }
                }
            });
        });
    function release(e) {
        console.log($("#pubForm_mod").serialize());
        $.ajax({
            type: "POST",
            url: "/publish",
            data: $("#pubForm_mod").serialize(),
            success: function (data) {
                if (data.status==200)
                    alert("发布成功");
                else
                    alert("发布失败");
            }
        });
    }

</script>
</body>
</html>
