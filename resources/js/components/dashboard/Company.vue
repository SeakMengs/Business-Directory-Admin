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
                <select v-on:input="changeSortBy($event)" name="sortSelect" id="sort-comp" class="sort-select">
                    <option value="desc">Newest</option>
                    <option value="asc">Oldest</option>
                    <option value="mostReport">Most Report</option>
                    <option value="leastReport">Least Report</option>
                </select>
            </div>
            <div class="total-wrapper">
                <div class="acc-card show-content" v-for="company, i in this.data?.companies" :key="i">
                    <div class="i-company-user-bg center">
                        <!-- default profile if user has never uploaded profile before -->
                        <i class="i-company-user"></i>
                        <!-- <img src="https://static01.nyt.com/images/2021/02/27/arts/tomjerry1/tomjerry1-mediumSquareAt3X.jpg"
                            alt=""> -->
                    </div>
                    <h6>Join since: {{ isoToStringDate(company?.created_at) }}</h6>
                    <h6>ID: {{ company?.company_id }}</h6>
                    <h6 class="sus-color">Suspicious Level: {{ company?.report_count }}</h6>
                    <h6>Listed by: @{{ company?.company_user?.name }}</h6>
                    <h6 class="h3-company">Company Name: {{ company?.name }}</h6>
                    <h6 v-if="company?.is_banned" class="sus-color">This company has been banned</h6>
                    <h6>Ban reason: {{ company?.ban_reason }}</h6>
                    <textarea v-if="!company?.is_banned" name="" :id="'ban_reason_' + company?.company_id" cols="30" rows="5">{{ company?.ban_reason }}</textarea>
                    <button v-if="!company?.is_banned" class="ban-user" @click="banCompany(company?.company_id, company?.company_user_id)">Ban
                        Company</button>
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

export default {
    async setup() {
        const csrf = inject('csrf')
        const api_token = inject('api_token')
        const isSearching = ref(false)
        const searchQuery = ref({
            searchValue: '',
            sortOrderBy: 'desc',
            sortBy: 'created_at',
            searchBy: 'name',
        })

        const { data, error } = await useFetch(`/api/admin/acc-management/companies?sortOrderBy=${searchQuery.value.sortOrderBy}&sortBy=${searchQuery.value.sortBy}&query=${searchQuery.value.searchValue}&searchBy=${searchQuery.value.searchBy}`, {
            csrf: csrf.value,
            api_token: api_token.value,
        })

        console.log(data.value.companies)

        return {
            csrf,
            api_token,
            searchQuery,
            data,
            error,
            isSearching
        }
    },
    methods: {
        async search() {
            const { data: result, error } = await useFetch(`/api/admin/acc-management/companies?sortOrderBy=${this.searchQuery.sortOrderBy}&sortBy=${this.searchQuery.sortBy}&query=${this.searchQuery.searchValue}&searchBy=${this.searchQuery.searchBy}`, {
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (error.value) {
                console.log(error.value)
                this.error = error
            }

            this.data.companies = result.value.companies

            console.log(this.data.companies)
        },
        changeQuery(event) {
            if (event.target.value[0] === '#') {
                this.searchQuery.searchBy = 'company_id'
                this.searchQuery.searchValue = event.target.value.slice(1)
            } else {
                this.searchQuery.searchBy = 'name'
                this.searchQuery.searchValue = event.target.value
            }
        },
        changeSortBy(event) {

            if (event.target.value.includes('Report')) {
                this.searchQuery.sortBy = 'report_count'

                if (event.target.value.includes('most')) {
                    this.searchQuery.sortOrderBy = 'desc'
                } else if (event.target.value.includes('least')) {
                    this.searchQuery.sortOrderBy = 'asc'
                }


            } else {
                this.searchQuery.sortBy = 'created_at'
                this.searchQuery.sortOrderBy = event.target.value
            }

            // console.log(this.searchQuery.sortOrderBy, this.searchQuery.sortBy)
        },
        isoToStringDate(isoDate) {
            // https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_tolocalestring
            const date = new Date(isoDate)
            return date.toLocaleDateString()
        },
        async banCompany(company_id, companyUser_id) {
            const ban_reason = document.getElementById(`ban_reason_${company_id}`).value

            if (!ban_reason) return alert('Please fill in the ban reason')

            // console.log(company_id, companyUser_id, ban_reason)

            const { res, error } = await usePost(`/api/admin/acc-management/post/banCompany`,
                {
                    params: {
                        company_id: company_id,
                        company_user_id: companyUser_id,
                        ban_reason: ban_reason,
                    },
                    csrf: this.csrf,
                    api_token: this.api_token,
                })

            if (res.value.data?.status === 'success') {
                alert('Company has been banned')
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
        }
    }
}
</script>