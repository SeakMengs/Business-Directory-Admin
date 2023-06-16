<template>
    <div class="db-content-wrapper">
        <!-- total account -->
        <div class="section section-1">
            <div class="total-header">
                <h1>Total Accounts</h1>
            </div>
            <div class="total-wrapper">
                <div class="total-card">
                    <div class="i-normal-user-bg center">
                        <i class="i-normal-user"></i>
                    </div>
                    <h1>{{ numFormatter.format(this.website.total?.normalUsers) }}</h1>
                    <h3 class="h3-normal">User Accounts</h3>
                </div>
                <div class="total-card">
                    <div class="i-company-user-bg center">
                        <i class="i-company-user"></i>
                    </div>
                    <h1>{{ numFormatter.format(this.website.total?.companyUsers) }}</h1>
                    <h3 class="h3-company">Company Accounts</h3>
                </div>
                <div class="total-card">
                    <div class="i-admin-user-bg center">
                        <i class="i-admin-user"></i>
                    </div>
                    <h1>{{ numFormatter.format(this.website.total?.admins) }}</h1>
                    <h3 class="h3-admin">Admin Accounts</h3>
                </div>
            </div>
        </div>
        <!-- end of total account -->
        <!-- start of section 2 -->
        <div class="section-2">
            <div class="section-2-child">
                <div class="total-header">
                    <h1>Total Companies</h1>
                </div>
                <div class="total-wrapper">
                    <div class="total-card">
                        <div class="i-company-user-bg center">
                            <i class="i-company"></i>
                        </div>
                        <h1>{{ numFormatter.format(this.website.total?.companies) }}</h1>
                        <h3 class="h3-company">Companies listed</h3>
                    </div>
                </div>
            </div>
            <div class="section-2-child">
                <div class="total-header">
                    <h1>Total Categories</h1>
                </div>
                <div class="total-wrapper">
                    <div class="total-card">
                        <div class="i-admin-user-bg center">
                            <i class="i-category"></i>
                        </div>
                        <h1>{{ numFormatter.format(this.website.total?.categories) }}</h1>
                        <h3 class="h3-admin">Categories</h3>
                    </div>
                </div>
            </div>
            <!-- ! for now this card has unknown purpose, might delete if i don't know what to put -->
            <!-- <div class="section-2-child">
                    <div class="total-header">
                        <h1>Total Account</h1>
                    </div>
                    <div class="total-wrapper">
                        <div class="total-card">
                            <div class="i-normal-user-bg center">
                                <i class="i-normal-user"></i>
                            </div>
                            <h1>{{ numFormatter.format(303000000)}}</h1>
                            <h3 class="h3-normal">User Accounts</h3>
                        </div>
                    </div>
                </div> -->
            <!-- !--------------------End---------------------------------------------------- -->
        </div>
    </div>
</template>

<script>
import { inject, ref } from 'vue'
import useFetch from '../../hooks/useFetch'

export default {
    async setup() {
        const numFormatter = inject('numFormatter')
        const csrf = inject('csrf')
        const api_token = inject('api_token')
        // const user = inject('user')
        const { data: website } = await useFetch('/api/admin/website-overview', {
            csrf: csrf.value,
            api_token: api_token.value
        })

        return {
            numFormatter,
            // user,
            csrf,
            api_token,
            website,
        }
    },
    mounted() {
        // console.log(this.website)
    },
    watch: {
        // function must match the variable name of the prop
        // user() {
        //     console.log(this.user)
        // }
    },
    methods: {
    },
}
</script>
