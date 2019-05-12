<%--
  Created by IntelliJ IDEA.
  User: Dirge
  Date: 2019/5/12
  Time: 8:53
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <li><a href="index.html">我的主页</a></li>
                    <li><a href="#">资料下载</a></li>
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

                    <div class="noticePan">
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
                                <td class="b1"><span class="glyphicon glyphicon-tag" ></span></td>
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

        <div class="col-xs-9" style="padding: 0px;">

            <!-- 资源分享区 -->
            <div class="panel-group" id="homeBody_pane">

                <div class="panel panel-default" style="margin-right:14px">
                    <div class="panel-heading">分类栏</div>
                    <div class="panel-body">
                        <form id="souForm_mod" name="souForm_mod" method="post">
                        <table width="100%">
                            <tr>
                                <td>
                                    <h5 style="float: left">适用年级:</h5>
                                    <div class="btn-group btn-group-sm" role="group" aria-label="年级"
                                         style="margin-bottom: 2px;margin-left: 8px;float: left">
                                        <input name="gradeLevel" id="gradeLevel"  style="display: none"/>
                                        <button type="button" class="btn btn-default" onclick="$('#gradeLevel').val('大一')">大一</button>
                                        <button type="button" class="btn btn-default" onclick="$('#gradeLevel').val('大二')">大二</button>
                                        <button type="button" class="btn btn-default" onclick="$('#gradeLevel').val('大三')">大三</button>
                                        <button type="button" class="btn btn-default" onclick="$('#gradeLevel').val('大四')">大四</button>
                                        <button type="button" class="btn btn-default" onclick="$('#gradeLevel').val('通用')">通用</button>
                                    </div>

                                </td>
                                <td>
                                    <select class="form-control btn-xs"
                                            style="width: 160px;margin-left: 8px; display:inline-block; float: right" id="profession" name="professionId">
                                    </select>
                                    <select class="form-control btn-xs"
                                            style="width: 150px;margin-left: 8px; display:inline-block;float: right" id="academy" name="academyId">
                                    </select>
                                    <h5 style="display:inline-block;float: right">选填:</h5>
                                </td>
                            </tr>
                        </table>
                        <table width="100%">

                            <tr>
                                <td>
                                    <h5 style="float: left">资源分类:</h5>
                                    <select class="form-control btn-xs" style="width: 140px;margin-left: 8px; display:inline-block;" id="resource_big" name="macrotaxonomy">
                                    </select>

                                    <select class="form-control btn-xs" style="width: 140px;margin-left: 8px; display:inline-block;" id="resource_item" name="categoryId">
                                    </select>

                                    <select class="form-control btn-xs" style="width: 140px;margin-left: 8px; display:inline-block;" id="fenlei" name="classify">

                                    </select>
                                </td>

                                <td>
                                    <select class="form-control btn-xs" style="width: 160px;margin-left: 8px; display:inline-block;float: right" id="wenjiangeshi" name="format">
                                    </select>
                                    <h5 style="display:inline-block;float: right">资源格式:</h5>
                                </td>
                            </tr>
                        </table>
                        </form>
                        <a  class="btn btn-success btn-sm" style="width: 90px;margin-top:20px;float: right" id="sousuo">搜索</a>
                    </div>
                </div>


            </div>
            <!-- 资源分享区 End-->


            <table class="table table-hover">
                <thead>
                <tr>
                    <th>#</th>
                    <th>标题</th>
                    <th>是否原创</th>
                    <th>时间</th>
                </tr>
                </thead>
                <tbody id="tb_body">
                </tbody>
            </table>

        </div>

        <!--页尾 -->
        <div class="col-xs-12" style="height: 200px;border: 1px rebeccapurple solid;margin-top: 20px"></div>
        <!--页尾 End-->



    </div>


</div>


<!-- 弹窗与遮罩 -->
<div id="cover" class="hide" ></div>

<script>
    $("#sousuo").click(function () {
        console.log($("#souForm_mod").serialize());
        $.ajax({
            type: "POST",
            url: "/download/list",
            data: $("#souForm_mod").serialize(),
            success: function (data) {
                console.log(data);
                if (data.status==200){
                    for (var i = 0; i < data.data.length; i++) {
                        var num = 1+i;
                        $("#tb_body").append("<tr>" +"<th scope='row'>"+
                            num+"</th>"+
                        "<td>" +"<a href='/resources/"+data.data[i].id+"'>"+
                        data.data[i].title+
                        "</a></td>" +
                        "<td>"+"是"+"</td>" +
                        "<td>"+data.data[i].updated+"</td>" +
                        "</tr>");
                    }
                }
                else
                    alert(data.msg);
            }
        });
        return false;
    });

    //$("#resource_big").remove();//清空select列表数据
    function selects(id ,atr){
        $.ajax({
            type : "POST",
            url : "/ContentCategory/"+id,
            success : function(data) {
                console.log(data);
                $("#"+atr+"").prepend("<option value=''>请选择</option>");//添加第一个option值
                for (var i = 0; i < data.data.length; i++) {
                    //如果在select中传递其他参数，可以在option 的value属性中添加参数
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
            $("#academy").prepend("<option value=''>请选择</option>");//添加第一个option值
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
                $("#resource_item").prepend("<option value=''>请选择</option>");//添加第一个option值
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
                //$("#profession").prepend("<option value='0'>请选择</option>");//添加第一个option值
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
        alert($("#pubForm_mod").serialize());
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
