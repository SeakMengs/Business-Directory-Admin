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
            <Suspense :key="this.currentPage">
                <template #default>
                    <!--* Start of right side content *-->

                    <div class="right-side-control" :class="this.isOpenMenu ? 'disable-width' : ''">
                        <!-- these components can be found in resources/js/components/dashboard -->
                        <overview v-if="this.currentPage === 11"></overview>
                        <find-user v-else-if="this.currentPage === 21"></find-user>
                        <find-company-user v-else-if="this.currentPage === 22"></find-company-user>
                        <company v-else-if="this.currentPage === 23"></company>
                        <category v-else-if="this.currentPage === 31"></category>
                        <admin-profile v-else-if="this.currentPage === 41"></admin-profile>
                        <admin v-else-if="this.currentPage === 42"></admin>
                        <!-- <ban-list v-else-if="this.currentPage === 43"></ban-list> -->
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
</template>

<script>

import LeftMenu from './Left-menu.vue'
import Navbar from './Navbar.vue'
import Overview from './Overview.vue'
import { computed, ref } from 'vue'
import useFetch from '../../hooks/useFetch'

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
        this.user = await useFetch('/api/admin/user',
            {
                csrf: this.csrf,
                api_token: this.api_token
            })
        // because my custom useFetch hook return three objects, so I need to get the data object
        this.user = this.user.data

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

            // example: true -> false, false -> true
            contentRow.checked = !contentRow.checked

            const headChildWrapper = document.querySelector(`.head-child-row-${row}`)

            headChildWrapper.classList.toggle('hide-content-animation')
            headChildWrapper.classList.toggle('hide-content')
        },
        toggleProfilePopUp() {
            // this function will toggle pop us for profile in mobile version
            let popUpProfile = document.querySelector('.pop-up-pf')
            popUpProfile.classList.toggle('show-pop-up-profile')
            popUpProfile.classList.toggle('hide-pop-up-content')
        },
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
