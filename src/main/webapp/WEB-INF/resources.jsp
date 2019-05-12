<%--
  Created by IntelliJ IDEA.
  User: Dirge
  Date: 2019/5/11
  Time: 22:50
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
    <title>河工程分享群-资料下载</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/jquery-1.11.1.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/common.js"></script>
    <script src="/js/cookie.js"></script>
    <script>
        // 想要获取的cook键值
        var cookie_name= "SHARE_COOKIE_HEBEU";
        // 调用
        var cookie_value =getCookie(cookie_name);
        $.ajax({
            type: "GET",
            url: "/user/token/"+cookie_value,
            success: function (data) {
                console.log(data);
                if (data.status == 200) {
                    $("#register_btn").hide();
                    $("#login_btn").hide()
                    $("#user_a").text(data.data.userName);
                    $("#userid").text(data.data.userId);
                    $("#user_a").show();
                    $("#tuideng").show();
                }
            }
        });
    </script>

    <script>
        window.onload = function () {

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
                <li role="presentation"><a href="/" target="_self">我的主页</a></li>
                <li role="presentation" class="active"><a href="/page/download" target="_self">资料下载</a></li>
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
                    <li><a href="/">我的主页</a></li>
                    <li><a href="/page/download">资料下载</a></li>
                    <li><a href="#">资料简介</a></li>
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
    <div class="row">


        <!-- 侧边栏 -->
        <div class="col-xs-3">


            <!-- 网站公告 -->
            <div class="panel panel-primary">
                <div class="panel-heading">网站公告</div>
                <div class="panel-body">


                    <table class="table table-condensed table-hover">
                        <tr>
                            <td width="150px"><a>1.关于本站</a></td>
                            <td class="b3"><span class="badge">1月2日</span></td>
                        </tr>
                        <tr>
                            <td class="b2"><a>2.积分说明</a></td>
                            <td class="b3"><span class="badge">6月24日</span></td>
                        </tr>
                        <tr>
                            <td class="b2"><a>3.上传规则</a></td>
                            <td class="b3"><span class="badge">7月4日</span></td>
                        </tr>
                        <tr>
                            <td class="b2"><a>4.免责声明</a></td>
                            <td class="b3"><span class="badge">7月18日</span></td>
                        </tr>
                    </table>


                </div>
            </div>
            <!-- 属性面板 end -->

            <hr>

            <!-- 互动面板 -->
            <div class="panel panel-info">
                <div class="panel-heading">互动</div>
                <div class="panel-body">
                    <table class="col-xs-12 ba_color" style="text-align: center;padding-top: 4px ;height: 80px">
                        <tr>
                            <td>
                                <a style="color: black" onclick="alert_show()">
                                <span class="glyphicon glyphicon-book" aria-hidden="true"
                                      style="font-size: 20px;color: #3f86d1;"></span>
                                    <br>
                                    <br>
                                    资料分享
                                </a>
                            </td>
                            <td>
                                <a style="color: black" href="#">
                                <span class="glyphicon glyphicon-edit" aria-hidden="true"
                                      style="font-size: 20px;color: #3f86d1;"></span>
                                    <br>
                                    <br>
                                    写回答
                                </a>
                            </td>
                            <td>
                                <a style="color: black" href="#">
                                <span class="glyphicon glyphicon-education" aria-hidden="true"
                                      style="font-size: 20px;color: #3f86d1;"></span>
                                    <br>
                                    <br>
                                    提问题
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <!-- 互动面板 End-->

            <hr>

            <!-- 信息面板 -->
            <div class="panel panel-warning">
                <div class="panel-heading">信息</div>
                <div class="panel-body">

                    <table class="table table-condensed table-hover">
                        <tr>
                            <td class="b1"><span class="glyphicon glyphicon-star-empty" aria-hidden="true"
                                                 style="font-size: 14px;display: inline;"></span></td>
                            <td class="b2"><a>我的收藏</a></td>
                            <td class="b3"><span class="badge">3</span></td>
                        </tr>
                        <tr>
                            <td class="b1"><span class="glyphicon glyphicon-tag" aria-hidden="true"
                                                 style="font-size: 14px"></span></td>
                            <td class="b2"><a>我关注的问题</a></td>
                            <td class="b3"><span class="badge">3</span></td>
                        </tr>
                        <tr>
                            <td class="b1"><span class="glyphicon glyphicon-earphone" aria-hidden="true"
                                                 style="font-size: 14px"></span></td>
                            <td class="b2"><a>我的邀请</a></td>
                            <td class="b3"><span class="badge">3</span></td>
                        </tr>
                        <tr>
                            <td class="b1"><span class="glyphicon glyphicon-file" aria-hidden="true"
                                                 style="font-size: 14px"></span></td>
                            <td class="b2"><a>我的回答</a></td>
                            <td class="b3"><span class="badge" style="background: #5bc0de">3</span></td>
                        </tr>
                    </table>

                </div>
            </div>
            <!-- 信息面板 End-->

            <hr>

            <!-- 标签面板 -->
            <div class="panel panel-success">
                <div class="panel-heading">标签</div>
                <div class="panel-body">

                    <button type="button" class="btn btn-success dropdown-toggle btn-group-xs pull-left"
                            aria-haspopup="true" aria-expanded="false" style="margin: 2px">java
                    </button>
                    <button type="button" class="btn btn-success dropdown-toggle btn-group-xs pull-left"
                            aria-haspopup="true" aria-expanded="false" style="margin: 2px">c#
                    </button>
                    <button type="button" class="btn btn-success dropdown-toggle btn-group-xs pull-left"
                            aria-haspopup="true" aria-expanded="false" style="margin: 2px">C++
                    </button>
                    <button type="button" class="btn btn-success dropdown-toggle btn-group-xs pull-left"
                            aria-haspopup="true" aria-expanded="false" style="margin: 2px">ubantu
                    </button>
                    <button type="button" class="btn btn-success dropdown-toggle btn-group-xs pull-left"
                            aria-haspopup="true" aria-expanded="false" style="margin: 2px">sqlserver
                    </button>
                    <button type="button" class="btn btn-success dropdown-toggle btn-group-xs pull-left"
                            aria-haspopup="true" aria-expanded="false" style="margin: 2px">五子棋
                    </button>
                    <button type="button" class="btn btn-success dropdown-toggle btn-group-xs pull-left"
                            aria-haspopup="true" aria-expanded="false" style="margin: 2px">吉他
                    </button>

                </div>
            </div>
            <!-- 标签面板 End-->


        </div>
        <!-- 侧边栏 End-->

        <div class="col-xs-9">

            <!-- 资源分享区 -->
            <div id="homeBody_pane">

                <div class="sourcesInfo" style="height: 200px;">

                    <div class="col-xs-3" style="float: left;border: 1px sienna solid">
                        <img src="http://img.oyksoft.com/ico/201708/13112624_6e796276ae.png"
                             style="width: 100%;height: auto;">
                    </div>

                    <div class="col-xs-9" style="float: left;position: relative">

                        <div>
                            <h3>${content.title}</h3>
                            <div style="cursor:pointer"><span style="font-size:16px;display:inline-block;width:6em;">好评：65</span><span class="glyphicon glyphicon-thumbs-up"></span></div>
                            <div style="cursor:pointer"><span style="font-size:16px;display:inline-block;width:6em;">一般：55</span><span class=" glyphicon glyphicon-hand-right"></span></div>
                            <div style="cursor:pointer"><span style="font-size:16px;display:inline-block;width:6em;">差评：9  </span><span class="glyphicon glyphicon-thumbs-down"></span></div>
                        </div>
                        <br>

                        <div style="bottom: 20px;font-size: 16px">
                            <div style="float: left;">
                                评分：
                            </div>

                            <div class="progress" style="margin: auto;float: left;width: 90%;">
                                <div class="progress-bar progress-bar-success progress-bar-striped active"
                                     style="width: 35%;">
                                    <span>35% (好评)</span>
                                </div>
                                <div class="progress-bar progress-bar-warning progress-bar-striped active"
                                     style="width: 20%">
                                    <span>20% (一般)</span>
                                </div>
                                <div class="progress-bar progress-bar-danger progress-bar-striped active"
                                     style="width: 45%">
                                    <span>10% (差评)</span>
                                </div>
                            </div>
                        </div>

                    </div>


                </div>

                <div class="sourcesInfo">

                    <table class="table" style="font-size: 16px">
                        <tr>
                            <td>
                                适用学院：${academy}
                            </td>
                            <td>
                                适用专业：${profession}
                            </td>
                            <td>
                                适用专业：${category}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                类别：${classify}
                            </td>
                            <td>
                                大小：20MB
                            </td>
                            <td>
                                更新时间：<fmt:formatDate value="${content.updated}" pattern="yyyy年MM月dd日HH点mm分ss秒" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                上传人：${username}
                            </td>
                            <td>
                                原创：${content.source==1?"是":"否"}
                            </td>
                            <td>
                                下载费用：免费
                            </td>
                        </tr>
                    </table>

                    <div style="text-align: center;">
                        <button type="submit" class="btn btn-success btn-lg" style="width: 150px;" onclick="alert_show()">下载</button>
                    </div>

                </div>

                <div class="sourcesInfo" style="height: 300px;">
                    ${content.titleDesc}
                </div>

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
<div id="alert" class="hide" style="height: 400px">
    <!-- 属性面板 -->
    <div class="panel panel-info">
        <div class="panel-heading">
            网盘地址
        </div>
        <div class="panel-body" id="share_alert_body" style="height: 250px;">

            <textarea class="form-control" rows="4" placeholder="请描述所分享内容的"></textarea>

            <div style="margin-top: 14px">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="panUrl" class="col-sm-2 control-label">网盘网址：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="panUrl" value="${content.url}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="panCode" class="col-sm-2 control-label">分享密码：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="panCode" value="${content.password}">
                        </div>
                    </div>
                </form>
            </div>


        </div>
        <div class="panel-footer" style="text-align: center;">
            <button type="submit" class="btn btn-success btn-lg" style="width: 150px;" onclick="alert_hide()">确认并退出</button>
            <button type="submit" class="btn btn-danger btn-lg" style="width: 150px;margin-left: 30px"
                    onclick="alert_hide()">保存到桌面
            </button>
        </div>
    </div>
    <!-- 属性面板 end -->


</div>


</body>
</html>