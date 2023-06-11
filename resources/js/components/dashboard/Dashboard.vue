<template>
    <div class="dashboard-bg fill-screen height-100">
        <navbar></navbar>
        <!-- pop up for mobile when user click on top right -->
        <div class="center">
            <!-- there is a function that toggle hide content to the div below -->
            <div class="pop-up-pf">
                <div class="pop-up-content">
                    <a class="center link-profile" href="/profile">
                        <img src="https://i.redd.it/v0caqchbtn741.jpg" alt="profile">
                        <div class="flex flex-col m-half">
                            <span class="profile-name">{{ this.user.name }}</span>
                            <span class="access-lv">Access level 2</span>
                        </div>
                    </a>
                    <div class="left-border-line"></div>
                    <form action="/logging-out/admin" method="POST">
                        <input type="hidden" name="_token" :value="this.csrf">
                        <button class="logout-btn">Logout</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- Component here ------------------------------------------------------------------- -->
        <div class="flex left-menu-wrapper height-100">
            <left-menu></left-menu>
            <Suspense>
                <template #default>
                    <!--* Start of right side content *-->

                    <div class="right-side-control" :class="isOpenMenu ? 'disable-width' : ''">
                        <!-- these components can be found in resources/js/components/dashboard -->
                        <overview v-if="currentPage === 11"></overview>
                        <find-user v-else-if="currentPage === 21"></find-user>
                        <find-company-user v-else-if="currentPage === 22"></find-company-user>
                        <company v-else-if="currentPage === 23"></company>
                        <category v-else-if="currentPage === 31"></category>
                        <admin-profile v-else-if="currentPage === 41"></admin-profile>
                        <admin v-else-if="currentPage === 42"></admin>
                        <ban-list v-else-if="currentPage === 43"></ban-list>
                    </div>
                    <!--* End of right side content *-->
                </template>
                <template #fallback>
                    <loading></loading>
                </template>
            </Suspense>
        </div>
        <!-- End of Component here ------------------------------------------------------------- -->
    </div>
    <loading></loading>
</template>

<script>

import LeftMenu from './Left-menu.vue'
import Navbar from './Navbar.vue'
import Overview from './Overview.vue'
import { computed, ref } from 'vue'

export default {
    // get csrf token from laravel
    props: [
        'csrf',
        'api_token',
    ],
    setup() {
        const inPage = ref('Overview')
        const currentPage = ref(11)
        const dashboardPage = ref('1')
        const isOpenMenu = ref(false)
        const currentDashboardStr = ref('Dashboard')
        // use this to format number
        const numFormatter = Intl.NumberFormat('en', { notation: 'compact' })
        const user = ref('');

        return {
            inPage,
            currentPage,
            isOpenMenu,
            dashboardPage,
            numFormatter,
            currentDashboardStr,
            user,
        }
    },
    async mounted() {
        // after component is mounted, get user info
        await this.getUser()

        // console.log(this.user)
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
                this.currentDashboardStr = 'Dashboard'
            } else if (page === 21) {
                this.inPage = 'Find user'
                this.currentDashboardStr = 'Account Management'
            } else if (page === 22) {
                this.inPage = 'Find company user'
                this.currentDashboardStr = 'Account Management'
            } else if (page === 23) {
                this.inPage = 'Company Management'
                this.currentDashboardStr = 'Account Management'
            } else if (page === 31) {
                this.inPage = 'Category'
                this.currentDashboardStr = 'Site Management'
            } else if (page === 41) {
                this.inPage = 'My Admin Profile'
                this.currentDashboardStr = 'Admin'
            } else if (page === 42) {
                this.inPage = 'Admin Management'
                this.currentDashboardStr = 'Admin'
            } else if (page === 43) {
                this.inPage = 'Ban List'
                this.currentDashboardStr = 'Admin'
            }

            // after click on menu, close the menu
            this.closeMenu()
        },
        toggleContent(row) {
            let contentRow = document.getElementById('arrowCheck' + row)
            let ArrayIndex = row - 1

            // example: true -> false, false -> true
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
        },
        async getUser() {
            try {
                const res = await axios.get('/api/admin/user', {
                    headers: {
                        'X-CSRF-TOKEN': this.csrf,
                        'Authorization': this.api_token,
                    }
                })

                this.user = res.data
            } catch (err) {
                alert(err);
            }
        }
    },
    // child component
    components: {
        LeftMenu,
        Navbar,
        Overview
    },
    provide() {
        return {
            // if we want to pass reactive data to child component
            // use computed() to make it reactive
            // https://vuejs.org/guide/components/provide-inject.html#inject
            currentPage: computed(() => this.currentPage),
            dashboardPage: computed(() => this.dashboardPage),
            inPage: computed(() => this.inPage),
            numFormatter: this.numFormatter,
            isOpenMenu: computed(() => this.isOpenMenu),
            currentDashboardStr: computed(() => this.currentDashboardStr),
            closeMenu: this.closeMenu,
            setPage: this.setPage,
            toggleContent: this.toggleContent,
            toggleLeftMenu: this.toggleLeftMenu,
            toggleProfilePopUp: this.toggleProfilePopUp,
            csrf: computed(() => this.csrf),
            api_token: computed(() => this.api_token),
            user: computed(() => this.user),
        }
    }
}
</script>
