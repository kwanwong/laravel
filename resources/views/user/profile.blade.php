@extends('layout')
@section('title', '用户信息')
@section('content')
<user-profile user_id="{{ $user->id }}" title="{{ $title }}" back="{{ url('users') }}"></user-profile>
<post-list user_id="{{ $user->id }}" title="关联文章"></post-list>
@endsection