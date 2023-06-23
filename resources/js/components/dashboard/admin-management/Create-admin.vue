<template>
    <div class="cate-section-1">
        <div class="cate-section-1-child">
            <div class="total-header">
                <h1>Create ADMIN</h1>
            </div>
            <div class="cate-card">
                <div class="add-cate-wrapper">
                    <form action="" class="add-cate-form">
                        <div class="cate-input-wrapper">
                            <h3>Admin Name:</h3>
                            <input v-model="this.newAdmin.name" class="cate-input-box" type="text" autocomplete="off">
                        </div>
                        <div class="cate-input-wrapper">
                            <h3>Admin Email:</h3>
                            <input v-model="this.newAdmin.email" class="cate-input-box" type="email" autocomplete="off">
                        </div>
                        <div class="cate-input-wrapper">
                            <h3>Password: </h3>
                            <input v-model="this.newAdmin.password" class="cate-input-box" type="password"
                                autocomplete="off">
                        </div>
                        <div class="cate-input-wrapper">
                            <h3>Privilege:</h3>
                        </div>
                        <div class="privilege-wrapper">
                            <div class="cate-tick-wrapper">
                                <input class="tick-input" type="checkbox" v-model="this.newAdmin.addCategory" id="addCategory">
                                <label for="addCategory">
                                    <h3>Add Category</h3>
                                </label>
                            </div>
                            <div class="cate-tick-wrapper">
                                <input v-model="this.newAdmin.banAccess" class="tick-input" type="checkbox"
                                    id="banUserAndCompany">
                                <label for="banUserAndCompany">
                                    <h3>Ban User&Company</h3>
                                </label>
                            </div>
                            <div class="cate-tick-wrapper">
                                <input v-model="this.newAdmin.accessEverything" class="tick-input" type="checkbox"
                                    id="accessEverything">
                                <label for="accessEverything">
                                    <h3>Access Everything</h3>
                                </label>
                            </div>
                        </div>
                        <div class="cate-add-remove-wrapper">
                            <button type="button" @click="createNewAdmin" class="add-cate-btn">Create Admin</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- edit category section -->
        <div class="cate-section-1-child">
            <div class="total-header">
                <h1>Main Website Status</h1>
            </div>
            <div class="cate-card">
                <div class="add-cate-wrapper">
                    <div class="add-cate-form">
                        <div class="sort-wrapper">
                            <label for="sort-comp">Site Status:</label>
                            <select name="sortSelect" id="sort-user" class="sort-select">
                                <option value="Normal">Normal</option>
                                <option value="Maintenance">Maintenance</option>
                            </select>
                        </div>
                        <label for="sort-comp">Current Site Status: <h3 style="display: inline;">Normal</h3></label>
                        <div class="cate-add-remove-wrapper">
                            <button class="reset-cate-btn">Set Site Status</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { ref, inject } from 'vue'
import usePost from '../../../hooks/usePost';

export default {
    setup() {
        const csrf = inject('csrf')
        const api_token = inject('api_token')
        const reFetchAdmins = inject('reFetchAdmins')
        const reFetchAdminsFunc = inject('reFetchAdminsFunc')

        const newAdmin = ref({
            name: '',
            email: '',
            password: '',
            addCategory: false,
            banAccess: false,
            accessEverything: false,
        })

        return {
            csrf,
            api_token,
            newAdmin,
            reFetchAdmins,
            reFetchAdminsFunc,
        }
    },
    methods: {
        async createNewAdmin() {

            const { res, error } = await usePost('/api/admin/admin-management/post/createAdmin', {
                params: {
                    name: this.newAdmin.name,
                    email: this.newAdmin.email,
                    password: this.newAdmin.password,
                    add_category: this.newAdmin.addCategory,
                    ban_access: this.newAdmin.banAccess,
                    access_everything: this.newAdmin.accessEverything,
                },
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (res.value?.data?.status === 'success') {
                alert('New admin has been created')

                // reset form data
                this.newAdmin = {
                    name: '',
                    email: '',
                    password: '',
                    addCategory: false,
                    banAccess: false,
                    accessEverything: false,
                }

                this.reFetchAdminsFunc(true)
            } else {
                alert(error.value?.data?.message || 'Something went wrong, please try again')
            }
        },
        //* NOTE: I decide to remove this function because I want admin with access everything role can change other admin privilege

        // privilegeWatcher(privilege) {
        //     switch (privilege) {
        //         case 'addCategory':
        //             this.newAdmin.addCategory = !this.newAdmin.addCategory

        //             // check access everything
        //             this.newAdmin.accessEverything = this.newAdmin.banAccess && this.newAdmin.addCategory

        //             break
        //         case 'banAccess':
        //             this.newAdmin.banAccess = !this.newAdmin.banAccess

        //             // check access everything
        //             this.newAdmin.accessEverything = this.newAdmin.banAccess && this.newAdmin.addCategory

        //             break
        //         case 'accessEverything':
        //             this.newAdmin.accessEverything = !this.newAdmin.accessEverything

        //             if (this.newAdmin.accessEverything) {
        //                 this.newAdmin.banAccess = true
        //                 this.newAdmin.addCategory = true
        //             } else {
        //                 this.newAdmin.banAccess = false
        //                 this.newAdmin.addCategory = false
        //             }

        //             break
        //     }

        //     // console.log('accessEverything', this.newAdmin.accessEverything, 'banAccess', this.newAdmin.banAccess, 'addCategory', this.newAdmin.addCategory)
        // }
    },
}
</script>
