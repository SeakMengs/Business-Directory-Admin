<template>
    <div class="cate-section-2">
        <div class="total-header all-cate-wrapper">
            <h1>Categories</h1>
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
            <span>Total result: {{ this.cateForSearch?.length }}</span>
        </div>
        <div class="cate-list">
            <div class="business-cate-parent show-content" v-for="category, i in this.cateForSearch"
                :title="'id ' + category.category_id" :key="category.name">
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
</template>

<script>
import { ref, inject } from 'vue';
import debounce from "lodash.debounce";
import useFetch from '../../../hooks/useFetch';

export default {
    async setup() {
        const csrf = inject('csrf')
        const api_token = inject('api_token')
        const reFetchCategorySearch = inject('reFetchCategorySearch')
        const reFetchCategorySearchFunc = inject('reFetchCategorySearchFunc')

        const isSearching = ref(false)

        const searchQuery = ref({
            searchValue: '',
            sortOrderBy: 'desc',
            searchBy: 'name',
        })

        const { data: cateForSearch } = await useFetch(`/api/admin/site-management/category?sortOrderBy=${searchQuery.value.sortOrderBy}&query=${searchQuery.value.searchValue}&searchBy=${searchQuery.value.searchBy}`, {
            csrf: csrf.value,
            api_token: api_token.value,
        })

        return {
            csrf,
            api_token,
            cateForSearch,
            searchQuery,
            isSearching,
            reFetchCategorySearch,
            reFetchCategorySearchFunc,
        }
    },
    methods: {
        async searchCategories() {
            const { data: result } = await useFetch(`/api/admin/site-management/category?sortOrderBy=${this.searchQuery.sortOrderBy}&query=${this.searchQuery.searchValue}&searchBy=${this.searchQuery.searchBy}`, {
                csrf: this.csrf,
                api_token: this.api_token,
            })

            this.cateForSearch = result.value
        },
        changeQuery(event) {
            if (event.target.value[0] === '#') {
                this.searchQuery.searchBy = 'category_id'
                // remove the # from the search value
                this.searchQuery.searchValue = event.target.value.slice(1)
            } else {
                this.searchQuery.searchBy = 'name'
                this.searchQuery.searchValue = event.target.value
            }

            // console.log(this.searchQuery)
        },
    },
    watch: {
        searchQuery: {
            handler: debounce(async function () {
                this.isSearching = true
                await this.searchCategories()
                this.isSearching = false
            }, 300),
            deep: true
        },
        reFetchCategorySearch: {
            handler: async function () {
                // console.log('reFetchCategorySearch', this.reFetchCategorySearch)

                if (this.reFetchCategorySearch) {
                    this.isSearching = true
                    await this.searchCategories()
                    this.isSearching = false
                }

                this.reFetchCategorySearchFunc(false)
            },
            deep: true
        }
    }

}
</script>
