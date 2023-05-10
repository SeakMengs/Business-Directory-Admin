<template>
    <input class="hidden" type="checkbox" id="left-menu-slider">
    <div class="left-menu-style">
        <div class="main-content">
            <div @click="toggleContent(1)" class="head-title-wrapper" :class="{ 'isCurrentPage': this.dashboardPage === '1' }">
                <span class="head-title">Dashboard</span>
                <!-- when copy main-content modify id and add 1 behind the number -->
                <input class="hidden arrowCheck" type="checkbox" id="arrowCheck1">
                <div class="arrow mask-image-arrow"></div>
            </div>
            <div class="head-child-wrapper">
                <div @click="setPage(11)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 11 }">
                    <img src="images/search.svg" alt="icon" width="16px" height="16px">
                    <span class="head-child-title">Overview</span>
                </div>
                <div @click="setPage(12)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 12 }">
                    <img src="images/search.svg" alt="icon" width="16px" height="16px">
                    <span class="head-child-title">Overview2</span>
                </div>
            </div>
        </div>
        <div class="main-content">
            <div @click="toggleContent(2)" class="head-title-wrapper" :class="{ 'isCurrentPage': this.dashboardPage === '2' }">
                <span class="head-title">Account Management</span>
                <input class="hidden arrowCheck" type="checkbox" id="arrowCheck2">
                <div class="arrow mask-image-arrow"></div>
            </div>
            <div class="head-child-wrapper">
                <div @click="setPage(21)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 21 }">
                    <img src="images/search.svg" alt="icon" width="16px" height="16px">
                    <span class="head-child-title">Find User</span>
                </div>
                <div @click="setPage(22)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 22 }">
                    <img src="images/search.svg" alt="icon" width="16px" height="16px">
                    <span class="head-child-title">Find Company</span>
                </div>
            </div>
        </div>
    </div>
    <!-- if user open menu and click on other side of the screen, close the screen -->
    <input class="hidden" type="checkbox" id="isCloseMenu">
    <div @click="closeMenu()" class="close-content-on-click">
    </div>
</template>

<script>

import { inject } from 'vue'

export default {
    // example of props and emits if pass data from parent to child
    // emits: ['closeMenu', 'setPage'],
    // props: ['currentPage'],

    // get injected from parent
    // inject: ['currentPage', 'closeMenu', 'setPage'],
    setup() {
        const currentPage = inject('currentPage')
        const dashboardPage = inject('dashboardPage')
        const closeMenu = inject('closeMenu')
        const setPage = inject('setPage')
        const toggleContent = inject('toggleContent')

        return {
            currentPage,
            closeMenu,
            setPage,
            toggleContent,
            dashboardPage
        }
    }
}
</script>
