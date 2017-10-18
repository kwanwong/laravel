@extends('layout')
@section('title', $title)
@section('content')
    <div class="panel panel-default">
        <div class="panel-heading">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <span>{{ $title }}</span>
                <a href="{{ url('posts/create') }}" class="action-link">{{ __('string.add') }}</a>
            </div>
        </div>
        <div class="panel-body">
            <ul class="media-list">
                @foreach($posts as $post)
                    <li class="media">
                        <div class="media-left">
                            <img class="img-rounded" src="{{ !empty($post->thumb) ? $post->thumb : 'https://lorempixel.com/120/120/?20919' }}" alt="{{ $post->title }}"/>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <a href="{{ url('posts/'.$post->id) }}" title="{{ $post->title }}">{{ $post->title }}</a>
                            </h4>
                            <p>{{ $post->content }}</p>
                            <span class="glyphicon glyphicon-time small">{{ $post->created_at }}</span>
                        </div>
                    </li>
                @endforeach
            </ul>
            <div class="row" style="text-align: center">
                {{ $posts->links() }}
            </div>
        </div>
    </div>
@endsection