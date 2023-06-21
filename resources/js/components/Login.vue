<template>
    <div class="center bg full-screen">
        <div class="glass p-5 center m-3">
            <div class="flex-col center">
                <span class="m-1 admin-login-text">Admin Login</span>
                <form action="/logging-in/admin" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="_token" :value="this.csrf">
                    <div class="flex flex-col m-1">
                        <label for="Email">Email</label>
                        <input class="p-1 input" type="text" name="email" id="Email" placeholder="Email">
                    </div>
                    <div class="flex flex-col m-1">
                        <label for="password">Password</label>
                        <input class="p-1 input" type="password" name="password" id="password" placeholder="Password">
                    </div>
                    <div v-if="this.test2" class="flex flex-col m-1">
                        <label class="wrong-input">Credentials doesn't match</label>
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
    // get props
    props: [
        'csrf',
        'test2'
    ],
}
</script>
