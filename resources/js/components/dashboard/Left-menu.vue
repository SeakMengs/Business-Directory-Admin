<template>
    <input class="hidden" type="checkbox" id="left-menu-slider">
    <div class="left-menu-style">
        <div class="main-content">
            <div @click="toggleContent(1)" class="head-title-wrapper"
                :class="{ 'isCurrentPage': this.dashboardPage === '1' }">
                <span class="head-title">Dashboard</span>
                <!-- when copy main-content modify id and add 1 behind the number -->
                <input class="hidden arrowCheck" type="checkbox" id="arrowCheck1">
                <i class="arrow mask-image-arrow"></i>
            </div>
            <div class="head-child-wrapper">
                <div @click="setPage(11)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 11 }">
                    <i class="i-overview"></i>
                    <span class="head-child-title">Overview</span>
                </div>
            </div>
        </div>
        <!-- second menu content -->
        <div class="main-content">
            <div @click="toggleContent(2)" class="head-title-wrapper"
                :class="{ 'isCurrentPage': this.dashboardPage === '2' }">
                <span class="head-title">Account Management</span>
                <!-- when copy main-content modify id and add 1 behind the number -->
                <input class="hidden arrowCheck" type="checkbox" id="arrowCheck2">
                <i class="arrow mask-image-arrow"></i>
            </div>
            <div class="head-child-wrapper">
                <div @click="setPage(21)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 21 }">
                    <i class="i-find-user"></i>
                    <span class="head-child-title">Find User</span>
                </div>
                <div @click="setPage(22)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 22 }">
                    <i class="i-left-company-user"></i>
                    <span class="head-child-title">Find Company User</span>
                </div>
                <div @click="setPage(23)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 23 }">
                    <i class="i-find-company"></i>
                    <span class="head-child-title">Company Management</span>
                </div>
            </div>
        </div>
        <!-- Third menu content -->
        <div class="main-content">
            <div @click="toggleContent(3)" class="head-title-wrapper"
                :class="{ 'isCurrentPage': this.dashboardPage === '3' }">
                <span class="head-title">Site Management</span>
                <!-- when copy main-content modify id and add 1 behind the number -->
                <input class="hidden arrowCheck" type="checkbox" id="arrowCheck3">
                <i class="arrow mask-image-arrow"></i>
            </div>
            <div class="head-child-wrapper">
                <div @click="setPage(31)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 31 }">
                    <i class="i-menu-category"></i>
                    <span class="head-child-title">Category</span>
                </div>
            </div>
        </div>
        <!-- Fourth menu content -->
        <div class="main-content">
            <div @click="toggleContent(4)" class="head-title-wrapper"
                :class="{ 'isCurrentPage': this.dashboardPage === '4' }">
                <span class="head-title">Admin</span>
                <!-- when copy main-content modify id and add 1 behind the number -->
                <input class="hidden arrowCheck" type="checkbox" id="arrowCheck4">
                <i class="arrow mask-image-arrow"></i>
            </div>
            <div class="head-child-wrapper">
                <div @click="setPage(41)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 41 }">
                    <i class="i-menu-category"></i>
                    <span class="head-child-title">My Admin Profile</span>
                </div>
                <div @click="setPage(42)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 42 }">
                    <i class="i-find-company"></i>
                    <span class="head-child-title">Admin Management</span>
                </div>
            </div>
        </div>
    </div>
    <!-- if user open menu and click on other side of the screen, close the screen -->
    <input type="checkbox" id="isCloseMenu">
    <div @click="closeMenu()" :class="{ 'close-content-on-click': this.isOpenMenu }">
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
        const isOpenMenu = inject('isOpenMenu')

        return {
            currentPage,
            closeMenu,
            setPage,
            toggleContent,
            dashboardPage,
            isOpenMenu,
        }
    }
}
</script>
