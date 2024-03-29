<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="referrer" content="no-referrer">
    {{-- <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> --}}
    {{-- add csrf token to allow access to vue component --}}
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/x-icon" href="https://i.imgur.com/T0cqgO1.png">
    <title>Business Directory Admin</title>
    <script src="{{ mix('js/app.js') }}" defer></script>
    <link rel="stylesheet" href="{{ asset('css/global.css') }}">
    <link rel="stylesheet" href="{{ asset('css/login.css') }}">
    <style>
        * {
            color: green;
        }
    </style>
</head>

<body>
    <?php
    echo '<h1>ServerName: ' . gethostname() . '<br></h1>';
    if (isset($_SERVER['SERVER_ADDR'])) {
        echo '<h1>ServerIP: ' . $_SERVER['SERVER_ADDR'] . '</h1>';
    }
    ?>
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
