<template>
    <div class="center bg full-screen">
        <div class="glass p-5 center m-3">
            <div class="flex-col center">
                <span class="m-1 admin-login-text">Admin Login</span>
                <form action="" method="POST" enctype="multipart/form-data">
                    <!-- @csrf -->
                    <div class="flex flex-col m-1">
                        <label for="username">Username</label>
                        <input class="p-1 input" type="text" name="username" id="username" placeholder="Username">
                    </div>
                    <div class="flex flex-col m-1">
                        <label for="password">Password</label>
                        <input class="p-1 input" type="password" name="password" id="password" placeholder="Password">
                    </div>
                    <div class="flex flex-col m-1">
                        <label class="wrong-input">The username or password is incorrect</label>
                    </div>
                    <div class="flex flex-col m-1">
                        <input class="p-1 submit" type="submit" value="Login">
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
export default {
}
</script>
