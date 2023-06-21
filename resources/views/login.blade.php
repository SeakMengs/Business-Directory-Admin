<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {{-- add csrf token to allow access to vue component --}}
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Business Directory Admin</title>
    <script src="{{ mix('js/app.js') }}" defer></script>
    <link rel="stylesheet" href="{{ asset('css/global.css') }}">
    <link rel="stylesheet" href="{{ asset('css/login.css') }}">
</head>

<body>
    @if (Auth::guard('adminUser')->check())
        <script>
            window.location.href = "/admin/dashboard";
        </script>
    @else
        <div id="app">
            {{-- login component can be found in \resources\js\components\Login.vue --}}
            <login csrf="{{ csrf_token() }}" test2="{{ $errors->any() ? true : false }}"></login>
        </div>
    @endif
</body>

</html>
