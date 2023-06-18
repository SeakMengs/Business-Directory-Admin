<template>
    <div class="db-content-wrapper">
        <div class="cate-section-1">
            <div class="cate-section-1-child">
                <div class="total-header">
                    <h1>Add Category</h1>
                </div>
                <div class="cate-card">
                    <div class="add-cate-wrapper">
                        <div class="add-cate-form">
                            <div class="cate-input-wrapper">
                                <h3>Category Name:</h3>
                                <input v-model="this.addCategory.name" v-on:input="changeAddCategoryName"
                                    class="cate-input-box" type="text" placeholder="Ex: Accountants - General"
                                    autocomplete="off">
                            </div>
                            <div class="cate-input-wrapper">
                                <h3>Category Icon:</h3>
                                <input v-model="this.addCategory.logo_url" v-on:input="previewAddCategoryIcon"
                                    class="cate-input-box" type="text"
                                    placeholder="Ex: <i class='fa-solid fa-car fontawe-icon'></i>" autocomplete="off">
                            </div>
                            <div class="center">
                                <button class="add-cate-btn" @click="saveNewCategory">Add Category</button>
                            </div>
                        </div>
                        <div class="cate-line"></div>
                        <div class="preview-wrapper">
                            <h3>Preview</h3>
                            <div class="preview-upload">
                                <div class="business-cate-parent">
                                    <div class="business-cate-div">
                                        <h5 class="card-title" :key="this.addCategory.name" id="add-icon-preview">
                                            <!-- <i class='fa-solid fa-car fontawe-icon'></i> -->
                                            {{ this.addCategory.name }}
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- edit category section -->
            <div class="cate-section-1-child">
                <div class="total-header">
                    <h1>Edit Category</h1>
                </div>
                <div class="cate-card">
                    <div class="add-cate-wrapper">
                        <div class="add-cate-form">
                            <div class="cate-input-wrapper">
                                <h3>Category Name:</h3>
                                <input class="cate-input-box" type="text" placeholder="Ex: Accountants - General"
                                    list="chooseCategory">
                                <datalist id="chooseCategory">
                                    <option v-for="category in this.categories" :key="category.id" :value="category.name">
                                    </option>
                                </datalist>
                            </div>
                            <div class="cate-input-wrapper">
                                <h3>Change to :</h3>
                                <input class="cate-input-box" type="text" placeholder="Ex: Accountants - General"
                                    autocomplete="off">
                            </div>
                            <div class="cate-input-wrapper">
                                <h3>Change Icon :</h3>
                                <input class="cate-input-box" type="text"
                                    placeholder="Ex: <i class='fa-solid fa-car fontawe-icon'></i>" autocomplete="off">
                            </div>
                            <div class="cate-add-remove-wrapper">
                                <button class="add-cate-btn">Edit Category</button>
                                <button class="remove-cate-btn">Remove Category</button>
                            </div>
                        </div>
                        <div class="cate-line"></div>
                        <div class="preview-wrapper">
                            <h3>Preview</h3>
                            <div class="preview-upload">
                                <div class="business-cate-parent">
                                    <div class="business-cate-div">
                                        <h5 class="card-title">
                                            <i class='fa-solid fa-car fontawe-icon'></i>
                                            General Accountants
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cate-section-2">
            <div class="total-header all-cate-wrapper">
                <h1>Categories</h1>
                <div class="search-wrapper search-cate">
                    <input class="search" type="text" name="search" id="search" placeholder="Search" autocomplete="off">
                    <div class="center search-bg">
                        <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
                            <path
                                d="M 21 3 C 11.621094 3 4 10.621094 4 20 C 4 29.378906 11.621094 37 21 37 C 24.710938 37 28.140625 35.804688 30.9375 33.78125 L 44.09375 46.90625 L 46.90625 44.09375 L 33.90625 31.0625 C 36.460938 28.085938 38 24.222656 38 20 C 38 10.621094 30.378906 3 21 3 Z M 21 5 C 29.296875 5 36 11.703125 36 20 C 36 28.296875 29.296875 35 21 35 C 12.703125 35 6 28.296875 6 20 C 6 11.703125 12.703125 5 21 5 Z" />
                        </svg>
                    </div>
                </div>
            </div>
            <div class="total-result">
                <div class="sort-wrapper">
                    <label for="sort-comp">Show By:</label>
                    <select name="sortSelect" id="sort-comp" class="sort-select">
                        <option value="Most Report">Recent</option>
                        <option value="Least Report">Old</option>
                    </select>
                </div>
            </div>
            <div class="total-result">
                <span>Total result: 305</span>
            </div>
            <div class="cate-list">
                <div class="business-cate-parent" v-for="category, i in this.cateForSearch" :title="'id ' + category.category_id"
                    :key="i">
                    <div class="business-cate-div">
                        <h5 style="display: flex;" class="card-title">
                            <!-- <i class='fa-solid fa-car fontawe-icon'></i> -->
                            <div class="" v-html="category.logo_url"></div>
                            {{ category.name }}
                        </h5>
                    </div>
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
        const addCategory = ref({
            name: '',
            logo_url: '',
        })
        const changeCategory = ref({
            id: null,
            name: null,
            logo_url: null,
        })
        const searchQuery = ref({
            searchValue: '',
            sortOrderBy: 'desc',
            searchBy: 'name',
        })

        const { data: categories } = await useFetch(`/api/admin/site-management/category?sortOrderBy=${searchQuery.value.sortOrderBy}&query=${searchQuery.value.searchValue}&searchBy=${searchQuery.value.searchBy}`, {
            csrf: csrf.value,
            api_token: api_token.value,
        })
        const { data: cateForSearch } = await useFetch(`/api/admin/site-management/category?sortOrderBy=${searchQuery.value.sortOrderBy}&query=${searchQuery.value.searchValue}&searchBy=${searchQuery.value.searchBy}`, {
            csrf: csrf.value,
            api_token: api_token.value,
        })

        console.log(categories.value)

        return {
            csrf,
            api_token,
            categories,
            cateForSearch,
            searchQuery,
            addCategory,
            changeCategory,
        }
    },
    methods: {
        changeAddCategoryName(event) {
            if (this.addCategory.name.length >= 50) {
                // slice(0, 50) => cut string from 0 to 50
                this.addCategory.name = this.addCategory.name.slice(0, 50)
                alert("Category name must be less than 50 characters")
                return
            }

            this.previewAddCategoryIcon(event)
        },
        previewAddCategoryIcon(event) {
            const parent = document.querySelector('#add-icon-preview')

            // verify font-awesome icon by checking it has <i> tag or not first
            if (this.addCategory.logo_url.includes('<i') && this.addCategory.logo_url.includes('</i>')) {
                // if it has <i> tag, then check if it has 'fa-' class or not
                // https://fontawesome.com/docs/web/add-icons/how-to
                if (this.addCategory.logo_url.includes('fa')) {
                    parent.innerHTML = this.addCategory.logo_url + this.addCategory.name
                    return
                }
            }

            // if it doesn't have <i> tag, then re-render icon
            parent.innerHTML = this.addCategory.name
        },
        async saveNewCategory() {
            if (!this.addCategory.name) {
                alert('Category name is required')
                return
            }
            if (!this.addCategory.logo_url.includes('<i') && !this.addCategory.logo_url.includes('</i>')) {
                alert('Category icon is required')
                return
            }
            // if it has <i> tag, then check if it has 'fa-' class or not
            if (!this.addCategory.logo_url.includes('fa')) {
                alert('Category icon is required')
                return
            }

            const { res } = await usePost('/api/admin/site-management/post/addCategory', {
                params: this.addCategory,
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (res.value?.data?.status === 'success') {
                this.addCategory.name = ''
                this.addCategory.logo_url = ''

                alert('Add category successfully')
                // get data again
                // this.isSearching = true
                // await this.search()
                // this.isSearching = false
            } else {
                alert('Something went wrong, please try again')
            }
        }
    },
    watch: {
    }
}
</script>
