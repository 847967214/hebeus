<%--
  Created by IntelliJ IDEA.
  User: Dirge
  Date: 2019/5/9
  Time: 21:42
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
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>河工程分享群-注册账号</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/jquery-1.11.1.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/main.js"></script>

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
            </ul>


            <form class="navbar-form">

                <!-- 站点地图 -->
                <ul class="breadcrumb" style="display: inline-block;padding-top: 10px" ;>
                    <li><span class="glyphicon glyphicon-home" aria-hidden="true"></span></li>
                    <li><a href="/">我的主页</a></li>
                    <li><a href="#">注册</a></li>
                </ul>
                <!-- 站点地图 End -->

            </form>
        </div>
        <!-- 导航主体 End -->

    </nav>
    <!-- 导航栏 End-->


    <!-- 主体部分-->
    <div class="row" style="height: 600px;padding: 0 16px 0 16px">



        <form id="regForm_mod" name="regForm_mod" method="post">

        <div>

            <div style="text-align: center;font-size: 32px">
                注册
            </div>

            <hr>

            <div class="col-xs-6 col-xs-offset-3">
                    <input type="text" class="form-control input-lg regInput" id="regName" name="userName" placeholder="昵称">
                    <br>
                    <br>
                    <div class="input-group">
                        <input type="password" class="form-control input-lg regInput" id="pwd" name="userPassword" placeholder="密码(6-16个字符组成，区分大小写)" >
                        <span class="input-group-btn">
                              <button class="btn btn-default btn-lg" type="button">显示隐藏</button>
                            </span>
                    </div>
                    <br>
                    <br>
                    <div style="vertical-align: center">
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox1" value="option1">
                            我已同意
                        </label>

                        <a>《河工程分享网用户使用协议》</a>和<a>《河工程分享网账号中心规范》</a>

                    </div>

                    <br>

                    <div style="text-align: center">
                        <button type="submit" class="btn btn-success btn-lg" style="width: 150px;" id="reg_per_data" onclick="REGISTER.reg(); return false;">注册</button>
                    </div>

                </div>




        </div>

        </form>
    </div>

    <!--页尾 -->
    <div class="col-xs-12" style="height: 200px;border: 1px rebeccapurple solid;margin-top: 20px"></div>
    <!--页尾 End-->

</div>
<script type="text/javascript">
    var REGISTER={
        param:{
            //单点登录系统的url
            surl:""
        },
        inputcheck:function(){
            var flag = true;
            //不能为空检查
            if ($("#regName").val() == "") {
                showError("regName","userMamErr",defaultArr[8]);
                flag = false;
            }
            if ($("#pwd").val() == "") {
                showError("pwd","passwordErr",pwdArr[0]);
                flag = false;
            }
            return flag;
        },
        beforeSubmit:function() {
            //检查用户是否已经被占用
            $.ajax({
                url : REGISTER.param.surl + "/user/check/"+escape($("#regName").val())+"/1?r=" + Math.random(),
                success : function(data) {
                     if (data) {
                        //检查手机号是否存在
                        REGISTER.doSubmit();
                    } else {
                        alert("用户名已被注册！！！")
                    }
                }
            });

        },
        doSubmit:function() {

            console.log($("#regForm_mod").serialize());
            $.ajax({
                type: "POST",
                url: "/user/register",
                data: $("#regForm_mod").serialize(),
                success: function (data) {
                        if(data){
                            alert('用户注册成功，请登录！');
                            REGISTER.login();
                        } else {
                            alert("注册失败！");
                        }
                }
            });
        },
        login:function() {
            window.location.href = "/page/login";
        },
        reg:function() {
            if (this.inputcheck()) {
                this.beforeSubmit();
            }
            return false;
        }
    };
</script>

</body>
</html>

