<%--
  Created by IntelliJ IDEA.
  User: Dirge
  Date: 2019/5/9
  Time: 21:39
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
    <title>河工程分享群-登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/jquery-1.11.1.js"></script>
    <script src="/js/cookie.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/main.js"></script>

    <script>
        window.onload=function () {
            var showbtn=document.getElementById("showPasswordBtn");
            var inputPass=document.getElementById("inputPassword");
            showbtn.onclick=function () {
                var btnClass=showbtn.className;
                if(btnClass=="btn btn-default btn-lg"){
                    inputPass.type =("text");
                    showbtn.className="btn btn-danger btn-lg";
                }else if(btnClass=="btn btn-danger btn-lg"){
                    inputPass.type =("password");
                    showbtn.className="btn btn-default btn-lg";
                }


            }
        }

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
            </ul>


            <form class="navbar-form">

                <!-- 站点地图 -->
                <ul class="breadcrumb" style="display: inline-block;padding-top: 10px" ;>
                    <li><span class="glyphicon glyphicon-home" aria-hidden="true"></span></li>
                    <li><a href="/">我的主页</a></li>
                    <li><a href="#">登录</a></li>
                </ul>
                <!-- 站点地图 End -->

            </form>
        </div>
        <!-- 导航主体 End -->

    </nav>
    <!-- 导航栏 End-->


    <!-- 主体部分-->
    <div class="row" style="height: 500px;">





        <div>

            <div style="text-align: center;font-size: 32px">
                登录
            </div>

            <hr>
            <form id="formlogin" method="post" >
            <div class="col-xs-6 col-xs-offset-3">

                <input type="text" class="form-control input-lg" id="inputName" name="username" placeholder="昵称">
                <br>
                <br>

                <div class="input-group">
                    <input type="password" class="form-control input-lg" id="password" placeholder="请输入密码" name="password">
                    <span class="input-group-btn">
                          <button id="showPasswordBtn" class="btn btn-default btn-lg" type="button">显示隐藏</button>
                        </span>
                </div>
                <br>
                <br>


                <div>
                    <label class="checkbox-inline">
                        <input type="checkbox" id="inlineCheckbox1" value="option1">
                        记住密码
                    </label>
                    <a class="pull-right">忘记密码</a>
                </div>


                <br>

                <div style="text-align: center">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 150px;" id="login_sub" onclick="LOGIN.login(); return false;">登录</button>
                </div>

            </div>
            </form>



        </div>


    </div>

    <!--页尾 -->
    <div class="col-xs-12" style="height: 200px;border: 1px rebeccapurple solid;margin-top: 20px"></div>
    <!--页尾 End-->

</div>


<script type="text/javascript">
    <%--var redirectUrl = "";${redirect}--%>
    var redirectUrl = "";
    var LOGIN = {
        // checkInput:function() {
        //     $("#sfbestNameErr").attr("class", "").html("").prev().attr("class", "border");
        //     $("#sfbestPwdErr").attr("class", "").html("").prev().attr("class", "border");
        //
        //     if(!$("#formlogin #loginname").val()) {
        //         $("#sfbestNameErr").attr("class", "error").show().html("请输入用户名").prev().attr("class", "border-error");
        //         return false;
        //     }
        //     if(!$("#formlogin input[name='password']").val()) {
        //         $("#sfbestPwdErr").attr("class", "error").show().html("请输入密码").prev().attr("class", "border-error");
        //         return false;
        //     }
        //     $("#username").val($("#loginname").val());
        //     return true;
        // },
        doLogin:function() {
            // $.post("/user/login", $("#formlogin").serialize(),function(data){
            //     console.log(data);
            //     if (data == "ok") {
            //         jAlert('登录成功！',"提示", function(){
            //             if (redirectUrl == "") {
            //                 window.location.href = "http://localhost:8082";
            //             } else {
            //                 location.href = "";
            //             }
            //         });
            //
            //     } else {
            //         jAlert("登录失败，原因是：" + data.msg,"失败");
            //     }
            // });
            $.ajax({
                type: "POST",
                url: "/user/login",
                data: $("#formlogin").serialize(),
                success: function (data) {
                    console.log(data);
                        if (data.status==200) {
                            alert('登录成功！',"提示", function(){
                            });
                            $.cookie('SHARE_COOKIE_HEBEU', data.data, { expires: 265 ,path:'/'});
                            window.location.href = "/";

                        } else {
                            alert("登录失败，原因是：" + data.msg );
                        }
                }
            });
        },
        login:function() {
                this.doLogin();
        }

    };
    // $(function(){
    //     $("#login_sub").click(function(){
    //         LOGIN.login();
    //     });
    //
    //     return false;
    // });
</script>

</body>
</html>
