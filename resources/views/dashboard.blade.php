<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {{-- add csrf token to allow access to vue component --}}
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Business Directory Admin Dashboard</title>
    <script src="{{ mix('js/app.js') }}" defer></script>

    <!-- Font Awesome icon library -->
    <script src="https://kit.fontawesome.com/72e69fb0a8.js" crossorigin="anonymous"></script>

    <!-- Font Awesome 5 CSS -->
    {{-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-Z4o4z9Xg1Aed2yNQODaGJiMDvfSZYGGZtjgoZtJOGFkg9XvE0UCDgnI/gMjSg5w5J5eG+DURq3lZ4ch0zveX4g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" /> --}}

    <link rel="stylesheet" href="{{ asset('css/global.css') }}">
    <link rel="stylesheet" href="{{ asset('css/dashboard.css') }}">
    <link rel="stylesheet" href="{{ asset('css/left-menu.css') }}">
    <link rel="stylesheet" href="{{ asset('css/overview.css') }}">
    <link rel="stylesheet" href="{{ asset('css/acc-management.css') }}">
    <link rel="stylesheet" href="{{ asset('css/category.css') }}">
    <link rel="stylesheet" href="{{ asset('css/admin.css') }}">
</head>

<body>
    <div id="app">
        {{-- dashboard component can be found in \resources\js\components\Login.vue --}}
        <dashboard api_token="{{ isset($api_token) ? $api_token : null }}" csrf="{{ csrf_token() }}"></dashboard>
    </div>
</body>

</html>
