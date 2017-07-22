@extends('layout')
@section('title', '编辑用户')
@section('content')
    <div class="panel panel-default">
        <div class="panel-heading">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <span>{{ __('string.edit') }}</span>
                <a href="{{ url('users') }}" class="action-link">{{ __('string.all') }}</a>
            </div>
        </div>
        <div class="panel-body">
            @include('errors.message')
            <form action="{{ url('users/'.$user->id) }}" method="POST">
                {{ csrf_field() }}
                <input type="hidden" name="_method" value="PUT">
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" class="form-control" name="name" value="{{ $user->name }}" placeholder="请输入姓名">
                </div>
                <div class="form-group">
                    <label for="email">邮箱</label>
                    <input type="text" class="form-control" name="email" value="{{ $user->email }}" placeholder="请输入邮箱">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" name="" value="修改">
                </div>
            </form>
        </div>
    </div>
@endsection