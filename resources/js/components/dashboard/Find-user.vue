<template>
    <div class="db-content-wrapper">
        <div class="acc-management-section">
            <div class="search-wrapper">
                <input @change="changeQuery($event)" class="search" type="text" name="search" id="search"
                    placeholder="Search" autocomplete="off">
                <div class="center search-bg">
                    <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
                        <path
                            d="M 21 3 C 11.621094 3 4 10.621094 4 20 C 4 29.378906 11.621094 37 21 37 C 24.710938 37 28.140625 35.804688 30.9375 33.78125 L 44.09375 46.90625 L 46.90625 44.09375 L 33.90625 31.0625 C 36.460938 28.085938 38 24.222656 38 20 C 38 10.621094 30.378906 3 21 3 Z M 21 5 C 29.296875 5 36 11.703125 36 20 C 36 28.296875 29.296875 35 21 35 C 12.703125 35 6 28.296875 6 20 C 6 11.703125 12.703125 5 21 5 Z" />
                    </svg>
                </div>
            </div>
            <div class="sort-wrapper">
                <label for="sort-comp">Show By:</label>
                <select @change="changeSortBy($event)" v-model="this.searchQuery.sortBy" name="sortSelect" id="sort-user" class="sort-select">
                    <option value="asc">Newest</option>
                    <option value="desc">Oldest</option>
                </select>
            </div>
            <div class="total-wrapper">
                <div class="acc-card" v-for="user in this.data?.users" :key="user?.normal_user_id">
                    <div class="i-normal-user-bg center">
                        <!-- default profile if user has never uploaded profile before -->
                        <i class="i-normal-user"></i>
                        <!-- <img src="https://static01.nyt.com/images/2021/02/27/arts/tomjerry1/tomjerry1-mediumSquareAt3X.jpg"
                            alt=""> -->
                    </div>
                    <h6>Join since: {{ user?.created_at }}</h6>
                    <h6>ID: {{ user?.normal_user_id }}</h6>
                    <h3 class="h3-normal">{{ user?.name }}</h3>
                    <h6>Ban reason: <span role="textarea" contenteditable></span></h6>
                    <button class="ban-user">Ban User</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { ref, inject } from 'vue';
import useFetch from '../../hooks/useFetch'

export default {
    async setup() {
        const csrf = inject('csrf')
        const api_token = inject('api_token')
        const searchQuery = ref({
            searchValue: '',
            sortBy: 'asc',
            searchBy: 'name',
        })

        const { data, error } = await useFetch(`/api/admin/acc-management/normalUsers?sortBy=${searchQuery.value.sortBy}&query=${searchQuery.value.searchValue}&searchBy=${searchQuery.value.searchBy}`, {
            csrf: csrf.value,
            api_token: api_token.value,
        })

        return {
            csrf,
            api_token,
            searchQuery,
            data,
            error
        }
    },
    methods: {
        async search() {
            const { data: result, error } = await useFetch(`/api/admin/acc-management/normalUsers?sortBy=${this.searchQuery.sortBy}&query=${this.searchQuery.searchValue}&searchBy=${this.searchQuery.searchBy}`, {
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (error.value) {
                console.log(error.value)
                this.error = error
            }

            this.data.users = result.value.users

            console.log(this.data.users)
        },
        async changeSortBy(event) {
            this.searchQuery.sortBy = event.target.value

            console.log(this.searchQuery)
            await this.search()
        },
        async changeQuery(event) {
            if (event.target.value[0] === '#') {
                this.searchQuery.searchBy = 'normal_user_id'
                this.searchQuery.searchValue = event.target.value.slice(1)
            } else {
                this.searchQuery.searchBy = 'name'
                this.searchQuery.searchValue = event.target.value
            }

            console.log(this.searchQuery)
            await this.search()
        },
    },
    watch: {
        searchQuery: {
            handler: async function () {
                console.log('ran', this.searchQuery)
                // await this.search()
            },
        }
    }
}
</script>
