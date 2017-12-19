<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>采购查询工具</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Loading Bootstrap -->
    <link href="{{ mix('/css/app.css') }}" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="/flat-ui/css/flat-ui.css" rel="stylesheet">

    <link rel="shortcut icon" href="/flat-ui/img/favicon.ico">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="/flat-ui/js/vendor/html5shiv.js"></script>
    <script src="/flat-ui/js/vendor/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<style>
    body {
        min-height: 2000px;
        padding-top: 110px;
    }
    .navbar {
        min-height: 80px;
    }
    .navbar-brand{
        height: 80px;
    }
    .navbar-nav > li{
        line-height: 80px;
    }
    .navbar-nav > li > a{
        line-height: 50px;
    }
</style>

<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <img src="/images/admin_logo.png" height="100%"/>
            </a>
        </div>

        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="#">注册</a></li>
                <li><a href="#about">关于</a></li>
                <li><a href="#about">帮助</a></li>
            </ul>
        </div>
    </div>
</div>


<div class="row" id="app">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default">
            <div class="panel-heading">管理员登录</div>
            <div class="panel-body">
                <form action="/admin/login" method="post">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="email">账号</label>
                        <input type="email" name="email" placeholder="Email" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" name="password" placeholder="Password" class="form-control">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">登录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="{{ mix('/js/app.js') }}"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/flat-ui/js/vendor/jquery.min.js"></script>
<script src="/flat-ui/js/flat-ui.min.js"></script>

</body>
</html>
