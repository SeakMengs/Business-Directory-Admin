<template>
    <input class="hidden" type="checkbox" id="left-menu-slider">
    <div class="left-menu-style">
        <div class="main-content">
            <div @click="toggleContent(1)" class="head-title-wrapper">
                <span class="head-title">Dashboard</span>
                <input class="hidden" type="checkbox" id="arrowCheck1">
                <div class="arrow mask-image-arrow"></div>
            </div>
            <div class="head-child-wrapper">
                <div @click="setPage(1)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 1 }">
                    <img src="images/search.svg" alt="icon" width="16px" height="16px">
                    <span class="head-child-title">Overview</span>
                </div>
                <div @click="setPage(2)" class="head-child" :class="{ 'isCurrentPage': this.currentPage === 2 }">
                    <img src="images/search.svg" alt="icon" width="16px" height="16px">
                    <span class="head-child-title">Account Management</span>
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
        const closeMenu = inject('closeMenu')
        const setPage = inject('setPage')
        const toggleContent = inject('toggleContent')

        return {
            currentPage,
            closeMenu,
            setPage,
            toggleContent
        }
    },
}
</script>
