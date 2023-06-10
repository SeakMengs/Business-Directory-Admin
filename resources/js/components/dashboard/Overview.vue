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
                    <h1>{{ numFormatter.format(303000000) }}</h1>
                    <h3 class="h3-normal">User Accounts</h3>
                </div>
                <div class="total-card">
                    <div class="i-company-user-bg center">
                        <i class="i-company-user"></i>
                    </div>
                    <h1>{{ numFormatter.format(502303000) }}</h1>
                    <h3 class="h3-company">Company Accounts</h3>
                </div>
                <div class="total-card">
                    <div class="i-admin-user-bg center">
                        <i class="i-admin-user"></i>
                    </div>
                    <h1>{{ numFormatter.format(3) }}</h1>
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
                        <h1>{{ numFormatter.format(102) }}</h1>
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
                        <h1>{{ numFormatter.format(3030) }}</h1>
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

export default {
    setup() {
        const numFormatter = inject('numFormatter')
        const csrf = inject('csrf')
        const user = inject('user')
        const website = ref('');

        return {
            numFormatter,
            website
        }
    },
    async mounted() {
        console.log(this.csrf)
        console.log(this.user)

        // await getWebsiteDetail()

        // console.log(this.website)
    },
    methods: {
        async getWebsiteDetail() {
            const res = await axios.get('/admin/website-detail', {
                headers: {
                    'X-CSRF-TOKEN': this.csrf,
                    'Authorization': this.api_token
                }
            })

            this.website = res.data
        }
    },
}
</script>
