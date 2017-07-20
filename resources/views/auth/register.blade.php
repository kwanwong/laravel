@extends('layout')
@section('title', '新用户注册')
@section('content')
    <div class="panel panel-default">
        <div class="panel-heading">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <span>{{ __('string.register') }}</span>
                <a href="{{ url('users') }}" class="action-link">{{ __('string.all') }}</a>
            </div>
        </div>
        <div class="panel-body">
            @include('errors.message')
            <form action="{{ url('register') }}" method="POST">
            {{ csrf_field() }}
            <div class="form-group">
                <label for="name">姓名</label>
                <input type="text" class="form-control" name="name" value="{{ old('name') }}" placeholder="请输入姓名">
            </div>
            <div class="form-group">
                <label for="email">邮箱</label>
                <input type="text" class="form-control" name="email" value="{{ old('email') }}" placeholder="请输入邮箱">
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" class="form-control" name="password" placeholder="请输入密码">
            </div>
            <div class="form-group">
                <label for="password_confirmation">确认密码</label>
                <input type="password" class="form-control" name="password_confirmation" placeholder="请再次输入密码">
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" name="" value="现在注册">
            </div>
            </form>
        </div>
    </div>
@endsection