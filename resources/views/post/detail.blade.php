@extends('layout')
@section('title', $post->title)
@section('content')
    <div class="panel panel-default">
        <div class="panel-heading">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <span>#{{ $post->id }}</span>
                <a href="{{ url('posts') }}" class="action-link">{{ __('string.all') }}</a>
            </div>
        </div>
        <div class="panel-body">
            <h3>{{ $post->title }}</h3>
            <span class="glyphicon glyphicon-star">{{ $post->views }}</span>
            <p>
            {{ $post->content }}
            </p>
        </div>
    </div>
@endsection