@extends('layout')
@section('title', $title)
@section('content')
<div class="panel panel-default">
    <div class="panel-heading">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <span>{{ __('string.add_post') }}</span>
            <a href="{{ url('posts') }}" class="action-link">{{ __('string.all') }}</a>
        </div>
    </div>
    <div class="panel-body">
        @include('errors.message')
        <form action="{{ url('posts') }}" method="POST">
            {{ csrf_field() }}
            <div class="form-group @if($errors->has('title')) has-error @endif">
                <label class="control-label" for="title">标题</label>
                <input type="text" class="form-control" name="title" value="{{ old('title') }}" placeholder="请输入文章标题">
            </div>
            <div class="form-group @if($errors->has('summary')) has-error @endif">
                <label class="control-label" for="summary">导语</label>
                <input type="text" class="form-control" name="summary" value="{{ old('summary') }}" placeholder="请输入导语">
            </div>
            <div class="form-group @if($errors->has('content')) has-error @endif">
                <label class="control-label" for="content">文章内容</label>
                <textarea class="form-control" name="content" rows="5" placeholder="请输入文章内容">{{ old('content') }}</textarea>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" name="" value="{{ __('string.add_post') }}">
            </div>
        </form>
    </div>
</div>
@endsection