@extends('layout')
@section('title', $title)
@section('content')
    <div class="panel panel-default">
        <div class="panel-heading">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <span>{{ $title }}</span>
                <a href="{{ url('register') }}" class="action-link">{{ __('string.add') }}</a>
            </div>
        </div>
        <div class="panel-body">
            <table class="table table-borderless m-b-none">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Role</th>
                    <th>Email</th>
                    <th>Created</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                @foreach($users as $user)
                <tr>
                    <!-- ID -->
                    <td style="vertical-align: middle;">
                        <a href="{{ url('users/'.$user->id) }}">{{ $user->id }}</a>
                    </td>

                    <!-- Name -->
                    <td style="vertical-align: middle;">
                        {{ $user->name }}
                    </td>

                    <!-- Role -->
                    <td style="vertical-align: middle;">
                        {{ $user->role }}
                    </td>

                    <!-- Email -->
                    <td style="vertical-align: middle;">
                        {{ $user->email }}
                    </td>

                    <!-- Created at -->
                    <td style="vertical-align: middle;">
                        {{ $user->created_at }}
                    </td>

                    <!-- Operate -->
                    <td style="vertical-align: middle;">
                        <a href="{{ url('users/'.$user->id.'/edit') }}">Edit</a>
                    </td>
                </tr>
                @endforeach
                </tbody>
            </table>
            <div class="row" style="text-align: center">
                {{ $users->links() }}
            </div>
        </div>
    </div>
@endsection