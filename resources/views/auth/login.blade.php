@extends('layout')
@section('title', '登录')
@section('content')
    <form method="POST" action="/login">
        {{ csrf_field() }}
        <div class="panel panel-default">
            <div class="panel-heading">登录</div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="email">邮箱</label>
                    <input type="email" class="form-control" name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control" name="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">登录</button>
                </div>
            </div>
        </div>
    </form>
@endsection