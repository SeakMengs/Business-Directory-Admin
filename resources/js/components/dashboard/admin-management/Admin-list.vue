<template>
    <div class="cate-section-2">
        <div class="total-header all-cate-wrapper">
            <h1>Admin List</h1>
            <div class="search-wrapper search-cate">
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
        </div>
        <div class="total-result">
            <div class="sort-wrapper">
                <label for="sort-comp">Show By:</label>
                <select v-model="this.searchQuery.sortOrderBy" name="sortSelect" id="sort-comp" class="sort-select">
                    <option value="desc">Newest</option>
                    <option value="asc">Oldest</option>
                </select>
            </div>
        </div>
        <div class="total-result">
            <span>Total result: {{ this.admins.length }}</span>
        </div>
        <div class="table-wrapper">
            <table v-if="this.admins.length > 0" class="table">
                <tr>
                    <th>ID</th>
                    <th>Profile</th>
                    <th>Admin Username</th>
                    <th>Add Category</th>
                    <th>Ban User & Company</th>
                    <th>Access Everything</th>
                    <th>Action</th>
                    <th>Reset Default Password</th>
                </tr>
                <!-- data start here -->
                <tr v-for="admin in this.admins" :key="admin.admin_id">
                    <td>
                        <input type="text" :value="admin.admin_id" readonly>
                    </td>
                    <td>
                        <div class="i-admin-user-bg center">
                            <!-- default profile if user has never uploaded profile before -->
                            <i class="i-admin-user"></i>
                        </div>
                    </td>
                    <td>
                        <input type="text" :value="admin.name" name="name" :id="'admin-name-id-' + admin.admin_id">
                    </td>
                    <td>
                        <select name="add_category" :id="'admin-add_category-id-' + admin.admin_id">
                            <option value="1" :selected="admin.add_category">Yes</option>
                            <option value="0" :selected="!admin.add_category">No</option>
                        </select>
                    </td>
                    <td>
                        <select name="ban_access" :id="'admin-ban_access-id-' + admin.admin_id">
                            <option value="1" :selected="admin.ban_access">Yes</option>
                            <option value="0" :selected="!admin.ban_access">No</option>
                        </select>
                    </td>
                    <td>
                        <select name="access_everything" :id="'admin-access_everything-id-' + admin.admin_id">
                            <option value="1" :selected="admin.access_everything">Yes</option>
                            <option value="0" :selected="!admin.access_everything">No</option>
                        </select>
                    </td>
                    <td>
                        <div class="cate-add-remove-wrapper">
                            <button class="add-cate-btn" @click="updateAdmin(admin.admin_id)">Update</button>
                            <button class="remove-cate-btn" @click="removeAdmin(admin.admin_id)">Remove</button>
                        </div>
                    </td>
                    <td>
                        <button class="reset-cate-btn" @click="resetDefaultAdminPassword(admin.admin_id)">Reset</button>
                    </td>
                </tr>
                <!-- data end here -->
            </table>
            <h1 v-else>No user found</h1>
        </div>
    </div>
</template>

<script>
import { ref, inject } from 'vue'
import debounce from "lodash.debounce";
import usePost from '../../../hooks/usePost';
import useFetch from '../../../hooks/useFetch';

export default {
    async setup() {
        const csrf = inject('csrf')
        const api_token = inject('api_token')

        const isSearching = ref(false)

        const searchQuery = ref({
            searchValue: '',
            sortOrderBy: 'desc',
            searchBy: 'name',
        })

        const { data: admins, error } = await useFetch(`/api/admin/admin-management/admins?sortOrderBy=${searchQuery.value.sortOrderBy}&query=${searchQuery.value.searchValue}&searchBy=${searchQuery.value.searchBy}`, {
            csrf: csrf.value,
            api_token: api_token.value,
        })

        console.log(admins.value)

        return {
            csrf,
            api_token,
            admins,
            searchQuery,
            isSearching,
        }
    },
    methods: {
        async getAdmins() {
            const { data: result, error } = await useFetch(`/api/admin/admin-management/admins?sortOrderBy=${this.searchQuery.sortOrderBy}&query=${this.searchQuery.searchValue}&searchBy=${this.searchQuery.searchBy}`, {
                csrf: this.csrf,
                api_token: this.api_token,
            })

            this.admins = result.value
        },
        changeQuery(event) {
            if (event.target.value[0] === '#') {
                this.searchQuery.searchBy = 'admin_id'
                // remove the # from the search value
                this.searchQuery.searchValue = event.target.value.slice(1)
            } else {
                this.searchQuery.searchBy = 'name'
                this.searchQuery.searchValue = event.target.value
            }
        },
        async updateAdmin(admin_id) {
            const name = document.getElementById(`admin-name-id-${admin_id}`).value
            const add_category = document.getElementById(`admin-add_category-id-${admin_id}`).value
            const ban_access = document.getElementById(`admin-ban_access-id-${admin_id}`).value
            const access_everything = document.getElementById(`admin-access_everything-id-${admin_id}`).value

            const { res, error } = await usePost('/api/admin/admin-management/post/updateAdmin', {
                params: {
                    name: name,
                    add_category: add_category,
                    ban_access: ban_access,
                    access_everything: access_everything,
                    admin_id: admin_id,
                },
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (res.value?.data?.status === 'success') {
                alert('Admin updated successfully')

                this.getAdmins()
            } else {
                alert(error.value?.data?.message || 'Something went wrong, please try again')
            }
        },
        async removeAdmin(admin_id) {
            const { res, error } = await usePost('/api/admin/admin-management/post/removeAdmin', {
                params: {
                    admin_id: admin_id,
                },
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (res.value?.data?.status === 'success') {
                alert('Admin removed successfully')

                this.getAdmins()
            } else {
                alert(error.value?.data?.message || 'Something went wrong, please try again')
            }
        },
        async resetDefaultAdminPassword(admin_id) {
            const { res, error } = await usePost('/api/admin-management/post/admin/reset-default-password', {
                params: {
                    admin_id: admin_id,
                },
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (res.value?.data?.status === 'success') {
                alert('Admin password has been reset')
            } else {
                alert(error.value?.data?.message || 'Something went wrong, please try again')
            }
        },
    },
    watch: {
        searchQuery: {
            handler: debounce(async function () {
                this.isSearching = true
                await this.getAdmins()
                this.isSearching = false
            }, 300),
            deep: true
        }
    }
}
</script>
