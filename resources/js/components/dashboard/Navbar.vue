<template>
    <header class="header-style">
        <div class="header-child">
            <div @click="toggleLeftMenu()" class="hamburger-menu">
                <input type="checkbox" id="hamburger">
                <span class="hamburger-line hamburger-line1"></span>
                <span class="hamburger-line hamburger-line2"></span>
                <span class="hamburger-line hamburger-line3"></span>
            </div>
        </div>
        <div class="header-child">
            <h5 class="cur-page-title"> {{ currentDashboardStr }} <i class="fa-light fa-greater-than fa-xl"
                    style="color: #495057;"></i> {{ inPage }}</h5>
        </div>
        <div class="header-child center">
            <a  @click="setPage(41)" class="center link-profile">
                <img v-if="this.user?.profile_url" :src="this.user?.profile_url" alt="profile">
                <div v-else-if="!this.user?.profile_url" class="center">
                    <!-- default profile if user has never uploaded profile before -->
                    <i style="-webkit-mask-size: auto 2rem; width: 2rem; height: 2rem;" class="i-admin-user"></i>
                </div>
                <div class="flex flex-col m-half">
                    <span class="profile-name">{{ this.user?.name }}</span>
                </div>
            </a>
            <div class="left-border-line"></div>
            <form action="/logging-out/admin" method="POST">
                <input type="hidden" name="_token" :value="this.csrf">
                <button class="logout-btn">Logout</button>
            </form>
        </div>
        <div @click="toggleProfilePopUp()" class="header-child center">
            <div class="flex flex-col">
                <i class="three-dots"></i>
                <i class="three-dots"></i>
                <i class="three-dots"></i>
            </div>
        </div>
    </header>
</template>

<script>
import { inject } from 'vue';

export default {
    setup() {
        const inPage = inject('inPage')
        const toggleLeftMenu = inject('toggleLeftMenu')
        const toggleProfilePopUp = inject('toggleProfilePopUp')
        const currentDashboardStr = inject('currentDashboardStr')
        const setPage = inject('setPage')
        const csrf = inject('csrf')
        const user = inject('user')

        return {
            inPage,
            toggleLeftMenu,
            toggleProfilePopUp,
            currentDashboardStr,
            csrf,
            user,
            setPage
        }
    },
}

</script>
