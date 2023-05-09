<template>
    <input type="checkbox" id="left-menu-slider">
    <div class="left-menu-style">
        <div class="main-content">
            <span class="head-title">Dashboard</span>
            <div class="head-child-wrapper">
                <div @click="$emit('setPage', $event, 1)" class="head-child" :class="currentPage == 1 ? 'isCurrentPage' : '' ">
                    <img src="images/search.svg" alt="icon" width="16px" height="16px">
                    <span class="head-child-title">Overview</span>
                </div>
                <div @click="$emit('setPage', $event, 2)" class="head-child" :class="currentPage == 2 ? 'isCurrentPage' : '' ">
                    <img src="images/search.svg" alt="icon" width="16px" height="16px">
                    <span class="head-child-title">Account Management</span>
                </div>
            </div>
        </div>
    </div>
    <!-- if user open menu and click on other side of the screen, close the screen -->
    <input type="checkbox" id="isCloseMenu">
    <div @click="$emit('closeMenu')" class="close-content-on-click">
    </div>
</template>

<script>
    export default {
        emits: ['closeMenu', 'setPage'],
        props: ['currentPage'],
    }
</script>
