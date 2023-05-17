<template>
    <div style="user-select:auto;" class="db-content-wrapper">
        <div class="admin-profile-parent">
            <div class="profile-line">
                <div @click="changeTab(1)" class="profile-tab" :class="{ 'active-tab': this.currentTab === 1 }">
                    <span>Banned Company</span>
                </div>
                <div @click="changeTab(2)" class="profile-tab" :class="{ 'active-tab': this.currentTab === 2 }">
                    <span>Banned User</span>
                </div>
            </div>
            <!--* tab component start here -->
            <ban-list-company v-if="this.currentTab === 1"></ban-list-company>
            <ban-list-user v-else-if="this.currentTab === 2"></ban-list-user>
        </div>
    </div>
</template>

<script>
import { ref } from 'vue'

export default {
    setup() {
        const currentTab = ref(1)

        return {
            currentTab,
        }
    },
    methods: {
        changeTab(tab) {
            this.currentTab = tab
        }
    }
}
</script>
