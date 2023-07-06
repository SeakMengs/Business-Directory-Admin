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
            <div class="sort-wrapper">
                <label for="sort-comp">Banned By:</label>
                <select v-model="this.searchQuery.banByAdminId" name="sortSelect" id="sort-user" class="sort-select">
                    <option value="" selected>None</option>
                    <option v-for="admin in this.admins" :value="admin?.admin_id" :key="admin.admin_id">{{ admin?.name }}
                    </option>
                </select>
            </div>
            <div class="sort-wrapper">
                <label for="sort-comp">Total result: {{ this.data?.companies?.length }}</label>
            </div>
            <div class="total-wrapper">
                <div class="acc-card show-content" v-for="company, i in this.data?.companies" :key="i">
                    <div class="i-company-user-bg center">
                        <!-- default profile if user has never uploaded profile before -->
                        <!-- <img v-if="company?.logo"
                            :src=company?.logo
                            alt=""> -->
                        <!-- <i v-else class="i-company-user"></i> -->
                        <i class="i-company-user"></i>
                    </div>
                    <h6>Join since: {{ this.isoToStringDate(company?.created_at) }}</h6>
                    <h6>ID: {{ company?.company_id }}</h6>
                    <h6 class="sus-color">Suspicious Level: {{ company?.report_count }}</h6>
                    <h6>Listed by: @{{ company?.company_user?.name }}</h6>
                    <h6 class="h3-company">Company Name: {{ company?.name }}</h6>
                    <h6 v-if="company?.is_banned" class="sus-color">This company has been banned</h6>
                    <h6>Ban reason: {{ company?.ban_reason }}</h6>
                    <h6 v-if="company?.is_banned">Banned by admin id: {{ company?.ban_by_admin_id }}</h6>
                    <textarea v-if="!company?.is_banned" name="" :id="'ban_reason_' + company?.company_id" cols="30"
                        rows="5">{{ company?.ban_reason }}</textarea>
                    <button v-if="!company?.is_banned" class="ban-user"
                        @click="banCompany(company?.company_id, company?.company_user_id)">Ban
                        Company</button>
                    <button v-if="company?.is_banned" class="reset-cate-btn"
                        @click="unBanCompany(company?.company_id, company?.company_user_id)">Unban
                        Company</button>
                    <details v-if="company?.reports.length > 0">
                        <summary>Report by user</summary>
                        <div style="align-items: flex-start;" class="flex flex-col">
                            <div style="align-items: flex-start; gap: 2px;" class="flex"
                                v-for="report, i in company?.reports" :key="i">
                                <strong style="word-break: initial;white-space: nowrap;">{{ report?.report_by?.name
                                }}:&#160;</strong>
                                <span style="text-align: initial;">{{ report?.reason
                                }}</span>
                            </div>
                        </div>
                    </details>
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
            sortBy: 'created_at',
            searchBy: 'name',
            banByAdminId: '',
        })

        const { data: admins } = await useFetch(`/api/admin/admin-management/admins?sortOrderBy=desc&query=&searchBy=name`, {
            csrf: csrf.value,
            api_token: api_token.value,
        })

        const { data, error } = await useFetch(`/api/admin/acc-management/companies?sortOrderBy=${searchQuery.value.sortOrderBy}&sortBy=${searchQuery.value.sortBy}&query=${searchQuery.value.searchValue}&searchBy=${searchQuery.value.searchBy}&banByAdminId=${searchQuery.value.banByAdminId}`, {
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
            isSearching,
            admins,
        }
    },
    methods: {
        isoToStringDate,
        async search() {
            const { data: result, error } = await useFetch(`/api/admin/acc-management/companies?sortOrderBy=${this.searchQuery.sortOrderBy}&sortBy=${this.searchQuery.sortBy}&query=${this.searchQuery.searchValue}&searchBy=${this.searchQuery.searchBy}&banByAdminId=${this.searchQuery.banByAdminId}`, {
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
        async banCompany(company_id, company_user_id) {
            const ban_reason = document.getElementById(`ban_reason_${company_id}`).value

            if (!ban_reason) return alert('Please fill in the ban reason')

            // console.log(company_id, company_user_id, ban_reason)

            const { res, error } = await usePost(`/api/admin/acc-management/post/banCompany`,
                {
                    params: {
                        company_id: company_id,
                        company_user_id: company_user_id,
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
        async unBanCompany(company_id, company_user_id) {
            const { res, error } = await usePost(`/api/admin/acc-management/post/unBanCompany`,
                {
                    params: {
                        company_id: company_id,
                        company_user_id: company_user_id,
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
