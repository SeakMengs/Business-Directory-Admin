<template>
    <div style="user-select:auto;" class="db-content-wrapper">
        <div v-if="this.user" class="admin-profile-parent">
            <div class="admin-profile-wrapper">
                <div class="profile-and-name">
                    <img v-if="this.user?.profile_url" :src="this.user?.profile_url" alt="profile">
                    <div v-else-if="!this.user?.profile_url" class="center">
                        <!-- default profile if user has never uploaded profile before -->
                        <i class="i-admin-user"></i>
                    </div>
                    <h1>{{ this.user?.name }}</h1>
                </div>
                <div class="admin-prof-detail">
                    <span>Admin ID: {{ this.user?.admin_id }}</span>
                    <span>Join since: {{ this.isoToStringDate(this.user?.created_at) }}</span>
                    <div class="admin-privilege">
                        <div v-if="this.user?.add_category" class="privilege-border">
                            <span>Add Category</span>
                        </div>
                        <div v-if="this.user?.ban_access" class="privilege-border">
                            <span>Ban User & Company</span>
                        </div>
                        <div v-if="this.user?.access_everything" class="privilege-border">
                            <span>Access Everything</span>
                        </div>
                    </div>
                    <button @click="changeTab(3)" class="add-cate-btn">Edit Profile</button>
                </div>
            </div>
            <div class="profile-line">

                <!--
                    NOTE: I decide to move who has the admin ban to find ban page because
                    it's more convenient to find the user and company to ban there and some admin
                    doesn't have ban access.
                -->
                <!-- <div @click="changeTab(1)" class="profile-tab" :class="{ 'active-tab': this.currentTab === 1 }">
                    <span>Banned Company</span>
                </div>
                <div @click="changeTab(2)" class="profile-tab" :class="{ 'active-tab': this.currentTab === 2 }">
                    <span>Banned User</span>
                </div>
                <div @click="changeTab(3)" class="profile-tab" :class="{ 'active-tab': this.currentTab === 3 }"> -->


                <div style="background-color: transparent; border: none; border-top: 2px solid var(--text-color-2);"
                    class="profile-tab" :class="{ 'active-tab': this.currentTab === 3 }">
                    <span>Edit Profile</span>
                </div>
            </div>
            <!--* tab component start here -->
            <!-- <banned-company v-if="this.currentTab === 1"></banned-company>
            <banned-user v-else-if="this.currentTab === 2"></banned-user> -->
            <!-- <edit-profile v-else-if="this.currentTab === 3"></edit-profile> -->
            <edit-profile v-if="this.currentTab === 3"></edit-profile>
        </div>
        <div v-else-if="!this.user">
            <h1>Not logged in</h1>
        </div>
    </div>
</template>

<script>
import { ref, inject } from 'vue';
import isoToStringDate from '../../utils/isoToStringDate.vue';

export default {
    async setup() {
        const currentTab = ref(3)
        const user = inject('user')

        return {
            currentTab,
            user,
        }
    },
    methods: {
        changeTab(tab) {
            this.currentTab = tab
        },
        isoToStringDate,
    },
}
</script>
