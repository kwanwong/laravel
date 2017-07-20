@extends('layout')
@section('title', '用户列表')
@section('content')
    <div class="panel panel-default">
        <div class="panel-heading">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <span>用户列表</span>
                <a href="{{ url('register') }}" class="action-link">{{ __('string.add') }}</a>
            </div>
        </div>
        <div class="panel-body">
            <table class="table table-borderless m-b-none">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Created</th>
                </tr>
                </thead>
                <tbody>
                @foreach($users as $user)
                <tr>
                    <!-- ID -->
                    <td style="vertical-align: middle;">
                        {{ $user->id }}
                    </td>

                    <!-- Name -->
                    <td style="vertical-align: middle;">
                        {{ $user->name }}
                    </td>

                    <!-- Email -->
                    <td style="vertical-align: middle;">
                        {{ $user->email }}
                    </td>

                    <!-- Password -->
                    <td style="vertical-align: middle;">
                        <code>{{ $user->password }}</code>
                    </td>

                    <!-- Created at -->
                    <td style="vertical-align: middle;">
                        {{ $user->created_at }}
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