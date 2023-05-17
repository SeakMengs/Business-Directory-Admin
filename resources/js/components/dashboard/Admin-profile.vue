<template>
    <div style="user-select:auto;" class="db-content-wrapper">
        <div class="admin-profile-parent">
            <div class="admin-profile-wrapper">
                <div class="profile-and-name">
                    <img src="https://static01.nyt.com/images/2021/02/27/arts/tomjerry1/tomjerry1-mediumSquareAt3X.jpg"
                        alt="profile">
                    <h1>Tom</h1>
                </div>
                <div class="admin-prof-detail">
                    <span>Admin ID: 15150</span>
                    <span>Join since: 9/12/2022</span>
                    <span>Access Level: 4</span>
                    <div class="admin-privilege">
                        <div class="privilege-border">
                            <span>Find All User</span>
                        </div>
                        <div class="privilege-border">
                            <span>Add Category</span>
                        </div>
                        <div class="privilege-border">
                            <span>Ban User & Company</span>
                        </div>
                        <div class="privilege-border">
                            <span>Access Everything</span>
                        </div>
                    </div>
                    <button @click="changeTab(3)" class="add-cate-btn">Edit Profile</button>
                </div>
            </div>
            <div class="profile-line">
                <div @click="changeTab(1)"  class="profile-tab" :class="{'active-tab': this.currentTab === 1}">
                    <span>Banned Company</span>
                </div>
                <div @click="changeTab(2)" class="profile-tab" :class="{'active-tab': this.currentTab === 2}">
                    <span>Banned User</span>
                </div>
                <div @click="changeTab(3)" class="profile-tab" :class="{'active-tab': this.currentTab === 3}">
                    <span>Edit Profile</span>
                </div>
            </div>
            <!--* tab component start here -->
            <banned-company v-if="this.currentTab === 1"></banned-company>
            <banned-user v-else-if="this.currentTab === 2"></banned-user>
            <edit-profile v-else-if="this.currentTab === 3"></edit-profile>
        </div>
    </div>
</template>

<script>
    import { ref } from 'vue';

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
