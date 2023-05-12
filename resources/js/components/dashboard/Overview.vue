<template>
    <div class="db-content-wrapper">
        <!-- total account -->
        <div class="section section-1">
            <div class="total-account">
                <h1>Total Accounts</h1>
            </div>
            <div class="total-wrapper">
                <div class="total-card">
                    <div class="i-normal-user-bg center">
                        <i class="i-normal-user"></i>
                    </div>
                    <h1>{{ numFormatter.format(303000000)}}</h1>
                    <h3 class="h3-normal">User Accounts</h3>
                </div>
                <div class="total-card">
                    <div class="i-company-user-bg center">
                        <i class="i-company-user"></i>
                    </div>
                    <h1>{{ numFormatter.format(502303000)}}</h1>
                    <h3 class="h3-company">Company Accounts</h3>
                </div>
                <div class="total-card">
                    <div class="i-admin-user-bg center">
                        <i class="i-admin-user"></i>
                    </div>
                    <h1>{{ numFormatter.format(3)}}</h1>
                    <h3 class="h3-admin">Admin Accounts</h3>
                </div>
            </div>
        </div>
        <!-- end of total account -->
        <div class="section-2">
            <div class="section-2-child">
                <div class="total-account">
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
            </div>
            <div class="section-2-child">
                <div class="total-account">
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
            </div>
            <div class="section-2-child">
                <div class="total-account">
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
            </div>
        </div>
    </div>
</template>

<script>
    import { inject } from 'vue'

    export default {
        setup() {
            const numFormatter = inject('numFormatter')

            return {
                numFormatter
            }
        }
    }
</script>
