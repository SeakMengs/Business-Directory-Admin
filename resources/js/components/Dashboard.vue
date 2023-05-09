<template>
    <div class="dashboard-bg fill-screen height-100">
        <header class="header-style">
            <div class="header-child">
                <div @click="toggleLeftMenu" class="hamburger-menu">
                    <input type="checkbox" id="hamburger">
                    <span class="hamburger-line hamburger-line1"></span>
                    <span class="hamburger-line hamburger-line2"></span>
                    <span class="hamburger-line hamburger-line3"></span>
                </div>
            </div>
            <div class="header-child">
                <span>{{ inPage }}</span>
            </div>
            <div class="header-child">
                <div class="flex search-wrapper">
                    <input class="search" type="text" name="search" id="search" placeholder="Search">
                    <div class="center search-bg">
                        <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
                            <path
                                d="M 21 3 C 11.621094 3 4 10.621094 4 20 C 4 29.378906 11.621094 37 21 37 C 24.710938 37 28.140625 35.804688 30.9375 33.78125 L 44.09375 46.90625 L 46.90625 44.09375 L 33.90625 31.0625 C 36.460938 28.085938 38 24.222656 38 20 C 38 10.621094 30.378906 3 21 3 Z M 21 5 C 29.296875 5 36 11.703125 36 20 C 36 28.296875 29.296875 35 21 35 C 12.703125 35 6 28.296875 6 20 C 6 11.703125 12.703125 5 21 5 Z" />
                        </svg>
                    </div>
                </div>
            </div>
            <div class="header-child center">
                <a class="center link-profile" href="/profile">
                    <img src="https://i.redd.it/v0caqchbtn741.jpg" alt="profile">
                    <div class="flex flex-col m-half">
                        <span class="profile-name">Admin Name</span>
                        <span class="access-lv">Access level 2</span>
                    </div>
                </a>
                <div class="left-border-line"></div>
                <button class="logout-btn">Logout</button>
            </div>
            <div class="header-child center">
                <span>.</span>
            </div>
        </header>
        <div class="flex left-menu-wrapper height-100">
            <left-menu @closeMenu="closeMenu" @setPage="setPage" :currentPage="currentPage"></left-menu>
            <div class="right-side-control" v-if="currentPage === 1" :class="isOpenMenu ? 'disable-width' : ''">
                <!-- component can be found in resources/js/components/dashboard-content/Right-content' -->
                <right-content></right-content>
            </div>
            <div class="right-side-control" v-else-if="currentPage === 2" :class="isOpenMenu ? 'disable-width' : ''">
                <!-- component can be found in resources/js/components/dashboard-content/Right-content2' -->
                <right-content2></right-content2>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            inPage: 'Account Management > Dashboard',
            currentPage: 1,
            isOpenMenu: false
        }
    },
    methods: {
        toggleLeftMenu() {
            let leftMenuSlider = document.getElementById('left-menu-slider')
            let hamburger = document.getElementById('hamburger')
            let isCloseMenu = document.getElementById('isCloseMenu')

            // if menu is open, close it
            if (leftMenuSlider.checked) {
                hamburger.checked = false
                leftMenuSlider.checked = false
                isCloseMenu.checked = true
                this.isOpenMenu = false
            } else {
                // if menu is close, open it
                hamburger.checked = true
                leftMenuSlider.checked = true
                isCloseMenu.checked = false
                this.isOpenMenu = true
            }
        },
        closeMenu() {
            let leftMenuSlider = document.getElementById('left-menu-slider')
            let hamburger = document.getElementById('hamburger')
            let isCloseMenu = document.getElementById('isCloseMenu')

            if (leftMenuSlider.checked) {
                hamburger.checked = false
                leftMenuSlider.checked = false
                isCloseMenu.checked = true
                this.isOpenMenu = false
            }
        },
        setPage(event, page) {
            this.currentPage = page
            if (page === 1) {
                this.inPage = 'Account Management > Dashboard'
            } else if (page === 2) {
                this.inPage = 'Account Management > Dashboard2'
            }

            // after click on menu, close the menu
            this.closeMenu()
        }
    }
}
</script>
