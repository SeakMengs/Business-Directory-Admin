<template>
    <div class="db-content-wrapper">
        <div class="acc-management-section">
            <div class="search-wrapper">
                <input v-on:input="changeQuery($event)" class="search" type="text" name="search" id="search"
                    placeholder="Search" autocomplete="off">
                <div class="center search-bg">
                    <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
                        <path
                            d="M 21 3 C 11.621094 3 4 10.621094 4 20 C 4 29.378906 11.621094 37 21 37 C 24.710938 37 28.140625 35.804688 30.9375 33.78125 L 44.09375 46.90625 L 46.90625 44.09375 L 33.90625 31.0625 C 36.460938 28.085938 38 24.222656 38 20 C 38 10.621094 30.378906 3 21 3 Z M 21 5 C 29.296875 5 36 11.703125 36 20 C 36 28.296875 29.296875 35 21 35 C 12.703125 35 6 28.296875 6 20 C 6 11.703125 12.703125 5 21 5 Z" />
                    </svg>
                </div>
            </div>
            <label class="searching" v-if="this.isSearching">Loading...</label>
            <div class="sort-wrapper">
                <label for="sort-comp">Show By:</label>
                <select v-model="this.searchQuery.sortOrderBy" name="sortSelect" id="sort-user" class="sort-select">
                    <option value="desc">Newest</option>
                    <option value="asc">Oldest</option>
                </select>
            </div>
            <div class="sort-wrapper">
                <label for="sort-comp">Banned By:</label>
                <select v-model="this.searchQuery.banByAdminId" name="sortSelect" id="sort-user" class="sort-select">
                    <option value="" selected>None</option>
                    <option v-for="admin in this.admins" :value="admin?.admin_id" :key="admin.admin_id">{{ admin?.name }}
                    </option>
                </select>
            </div>
            <div class="sort-wrapper">
                <label for="sort-comp">Total result: {{ this.data?.users?.length }}</label>
            </div>
            <div class="total-wrapper">
                <div class="acc-card show-content" v-for="user, i in this.data?.users" :key="i">
                    <div class="i-normal-user-bg center">
                        <!-- default profile if user has never uploaded profile before -->
                        <i class="i-normal-user"></i>
                        <!-- <img src="https://static01.nyt.com/images/2021/02/27/arts/tomjerry1/tomjerry1-mediumSquareAt3X.jpg"
                            alt=""> -->
                    </div>
                    <h6>Join since: {{ this.isoToStringDate(user?.created_at) }}</h6>
                    <h6>ID: {{ user?.normal_user_id }}</h6>
                    <h3 class="h3-normal">{{ user?.name }}</h3>
                    <h6 v-if="user?.is_banned" class="sus-color">This user has been banned</h6>
                    <h6>Ban reason: {{ user?.ban_reason }}</h6>
                    <h6 v-if="user?.is_banned">Banned by admin id: {{ user?.ban_by_admin_id }}</h6>
                    <textarea v-if="!user?.is_banned" name="" :id="'ban_reason_' + user?.normal_user_id" cols="30"
                        rows="5">{{ user?.ban_reason }}</textarea>
                    <button v-if="!user?.is_banned" class="ban-user" @click="banNormalUser(user?.normal_user_id)">Ban
                        User</button>
                    <button v-if="user?.is_banned" class="reset-cate-btn"
                        @click="unBanNormalUser(user?.normal_user_id)">Unban
                        User</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { ref, inject } from 'vue';
import debounce from "lodash.debounce";
import useFetch from '../../hooks/useFetch'
import usePost from '../../hooks/usePost'
import isoToStringDate from '../../utils/isoToStringDate.vue';

export default {
    async setup() {
        const csrf = inject('csrf')
        const api_token = inject('api_token')

        const isSearching = ref(false)

        const searchQuery = ref({
            searchValue: '',
            sortOrderBy: 'desc',
            searchBy: 'name',
            banByAdminId: '',
        })

        const { data: admins } = await useFetch(`/api/admin/admin-management/admins?sortOrderBy=desc&query=&searchBy=name`, {
            csrf: csrf.value,
            api_token: api_token.value,
        })

        const { data, error } = await useFetch(`/api/admin/acc-management/normalUsers?sortOrderBy=${searchQuery.value.sortOrderBy}&query=${searchQuery.value.searchValue}&searchBy=${searchQuery.value.searchBy}&banByAdminId=${searchQuery.value.banByAdminId}`, {
            csrf: csrf.value,
            api_token: api_token.value,
        })

        return {
            csrf,
            api_token,
            searchQuery,
            data,
            error,
            isSearching,
            admins,
        }
    },
    methods: {
        isoToStringDate,
        async search() {
            const { data: result, error } = await useFetch(`/api/admin/acc-management/normalUsers?sortOrderBy=${this.searchQuery.sortOrderBy}&query=${this.searchQuery.searchValue}&searchBy=${this.searchQuery.searchBy}&banByAdminId=${this.searchQuery.banByAdminId}`, {
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (error.value) {
                console.log(error.value)
                this.error = error
            }

            this.data.users = result.value.users

            // console.log(this.data.users)
        },
        changeQuery(event) {
            if (event.target.value[0] === '#') {
                this.searchQuery.searchBy = 'normal_user_id'
                // remove the # from the search value
                this.searchQuery.searchValue = event.target.value.slice(1)
            } else {
                this.searchQuery.searchBy = 'name'
                this.searchQuery.searchValue = event.target.value
            }
        },
        async banNormalUser(normal_user_id) {
            const ban_reason = document.getElementById(`ban_reason_${normal_user_id}`).value

            if (!ban_reason) return alert('Please fill in the ban reason')

            const { res, error } = await usePost(`/api/admin/acc-management/post/banNormalUser`,
                {
                    params: {
                        normal_user_id: normal_user_id,
                        ban_reason: ban_reason,
                    },
                    csrf: this.csrf,
                    api_token: this.api_token,
                })

            if (res.value?.data?.status === 'success') {
                // get data again
                this.isSearching = true
                await this.search()
                this.isSearching = false
            } else {
                alert('Something went wrong, please try again')
            }
        },
        async unBanNormalUser(normal_user_id) {
            const { res, error } = await usePost(`/api/admin/acc-management/post/unBanNormalUser`,
                {
                    params: {
                        normal_user_id: normal_user_id,
                    },
                    csrf: this.csrf,
                    api_token: this.api_token,
                })

            if (res.value?.data?.status === 'success') {
                // get data again
                this.isSearching = true
                await this.search()
                this.isSearching = false
            } else {
                alert('Something went wrong, please try again')
            }
        }
    },
    watch: {
        searchQuery: {
            handler: debounce(async function () {
                this.isSearching = true
                await this.search()
                this.isSearching = false
                // 300ms delay
            }, 300),
            // deep watch is needed to watch for changes in object
            deep: true
        },
    }
}
</script>
