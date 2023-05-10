<template>
    <div class="dashboard-bg fill-screen height-100">
        <navbar></navbar>
        <!-- pop up for mobile when user click on top right -->
        <div class="center">
            <div class="pop-up-pf">
                <div class="pop-up-content">
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
            </div>
        </div>
        <!-- Component here ------------------------------------------------------------------- -->
        <div class="flex left-menu-wrapper height-100">
            <left-menu></left-menu>

            <div class="right-side-control" v-if="currentPage === 11" :class="isOpenMenu ? 'disable-width' : ''">
                <!-- component can be found in resources/js/components/dashboard-content/Right-content' -->
                <overview></overview>
            </div>
            <div class="right-side-control" v-else-if="currentPage === 21" :class="isOpenMenu ? 'disable-width' : ''">
                <!-- component can be found in resources/js/components/dashboard-content/Right-content2' -->
                <account-management></account-management>
            </div>
        </div>
        <!-- End of Component here ------------------------------------------------------------- -->
    </div>
</template>

<script>

import LeftMenu from './Left-menu.vue'
import Navbar from './Navbar.vue'
import { computed, ref } from 'vue'

export default {
    setup() {
        const inPage = ref('Overview')
        const currentPage = ref(11)
        const dashboardPage = ref('1')
        const isOpenMenu = ref(false)

        return {
            inPage,
            currentPage,
            isOpenMenu,
            dashboardPage
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
        setPage(page) {
            this.currentPage = page
            this.dashboardPage = page.toString().charAt(0)
            if (page === 11) {
                this.inPage = 'Overview'
            } else if (page === 21) {
                this.inPage = 'Find user'
            } else if (page === 22) {
                this.inPage = 'Find company user'
            }

            // after click on menu, close the menu
            this.closeMenu()
        },
        toggleContent(row) {
            let contentRow = document.getElementById('arrowCheck' + row)
            let ArrayIndex = row - 1

            // if (contentRow.checked) {
            //     contentRow.checked = false
            // } else {
            //     contentRow.checked = true
            // }

            // shorter of above code logic
            contentRow.checked = !contentRow.checked

            let headChildWrapper = document.querySelectorAll('.head-child-wrapper')[ArrayIndex]
            headChildWrapper.classList.toggle('hide-content-animation')
            headChildWrapper.classList.toggle('hide-content')
        },
        toggleProfilePopUp() {
            // this function will toggle pop us for profile in mobile version
            let popUpProfile = document.querySelector('.pop-up-pf')
            popUpProfile.classList.toggle('show-pop-up-profile')
            popUpProfile.classList.toggle('hide-pop-up-content')
        }
    },
    // child component
    components: {
        LeftMenu,
        Navbar
    },
    provide() {
        return {
            // if we want to pass reactive data to child component
            // use computed() to make it reactive
            // https://vuejs.org/guide/components/provide-inject.html#inject
            currentPage: computed(() => this.currentPage),
            dashboardPage: computed(() => this.dashboardPage),
            inPage: computed(() => this.inPage),
            closeMenu: this.closeMenu,
            setPage: this.setPage,
            toggleContent: this.toggleContent,
            toggleLeftMenu: this.toggleLeftMenu,
            toggleProfilePopUp: this.toggleProfilePopUp
        }
    }
}
</script>
