<template>
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
                            <input v-model="this.addCategory.name" v-on:input="changeAddCategoryName" class="cate-input-box"
                                type="text" placeholder="Ex: Accountants - General" autocomplete="off">
                        </div>
                        <div class="cate-input-wrapper">
                            <h3>Category Icon:</h3>
                            <input v-model="this.addCategory.logo_url"
                                v-on:input="previewAddCategoryIcon(event, 'add-icon-preview', this.addCategory.name, this.addCategory.logo_url)"
                                class="cate-input-box" type="text"
                                placeholder="Ex: <i class='fa-solid fa-car fontawe-icon'></i>" autocomplete="off">
                        </div>
                        <div class="center">
                            <button class="add-cate-btn" @click="saveNewCategory">Add</button>
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
                            <!-- <input class="cate-input-box" type="text" placeholder="Ex: Accountants - General"
                                    list="chooseCategory" v-on:input="updateCategory()" v-model="this.changeCategory.inputName" autocomplete="off">
                                <datalist id="chooseCategory">
                                    <option v-for="category in this.categories" :key="category.id" :value="category.name">
                                    </option>
                                </datalist> -->
                            <select class="sort-select" id="update-cate-select" @change="updateCategory()"
                                v-model="this.changeCategory.inputName">
                                <option value="" selected>Choose Category</option>
                                <option v-for="category in this.categories" :key="category.name" :value="category.name">
                                    {{ category.name }}
                                </option>
                            </select>
                        </div>
                        <div class="cate-input-wrapper">
                            <h3>Change to :</h3>
                            <input class="cate-input-box" type="text" placeholder="Ex: Accountants - General"
                                autocomplete="off" v-model="this.changeCategory.name" v-on:input="changeCategoryName">
                        </div>
                        <div class="cate-input-wrapper">
                            <h3>Change Icon :</h3>
                            <input class="cate-input-box" type="text"
                                placeholder="Ex: <i class='fa-solid fa-car fontawe-icon'></i>" autocomplete="off"
                                v-model="this.changeCategory.logo_url"
                                v-on:input="previewAddCategoryIcon(event, 'change-icon-preview', this.changeCategory.name, this.changeCategory.logo_url)">
                        </div>
                        <div class="cate-add-remove-wrapper">
                            <button class="add-cate-btn" @click="saveUpdateCategory">Update</button>
                            <button class="remove-cate-btn" @click="removeOneCategory">Remove</button>
                        </div>
                    </div>
                    <div class="cate-line"></div>
                    <div class="preview-wrapper">
                        <h3>Preview</h3>
                        <div class="preview-upload">
                            <div class="business-cate-parent">
                                <div class="business-cate-div">
                                    <h5 class="card-title flex" id="change-icon-preview">
                                        <!-- <i class='fa-solid fa-car fontawe-icon'></i> -->
                                        {{ this.changeCategory.name }}
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { ref, inject } from 'vue';
import useFetch from '../../../hooks/useFetch';
import usePost from '../../../hooks/usePost';

export default {
    async setup() {
        const csrf = inject('csrf')
        const api_token = inject('api_token')
        const reFetchCategorySearch = inject('reFetchCategorySearch')
        const reFetchCategorySearchFunc = inject('reFetchCategorySearchFunc')

        const addCategory = ref({
            name: '',
            logo_url: '',
        })

        const changeCategory = ref({
            inputName: '',
            id: '',
            name: '',
            logo_url: '',
        })

        const { data: categories } = await useFetch("/api/admin/site-management/category?sortOrderBy=desc&query=&searchBy=name", {
            csrf: csrf.value,
            api_token: api_token.value,
        })

        console.log(categories.value)

        return {
            csrf,
            api_token,
            categories,
            addCategory,
            changeCategory,
            reFetchCategorySearch,
            reFetchCategorySearchFunc,
        }
    },
    methods: {
        async fetchCategories() {
            const { data: result } = await useFetch("/api/admin/site-management/category?sortOrderBy=desc&query=&searchBy=name", {
                csrf: this.csrf,
                api_token: this.api_token,
            })

            this.categories = result.value

            // console.log(this.categories)
        },
        changeAddCategoryName(event) {
            if (this.addCategory.name.length >= 50) {
                // slice(0, 50) => cut string from 0 to 50
                this.addCategory.name = this.addCategory.name.slice(0, 50)
                alert("Category name must be less than 50 characters")
                return
            }

            this.previewAddCategoryIcon(event, 'add-icon-preview', this.addCategory.name, this.addCategory.logo_url)
        },
        changeCategoryName(event) {
            if (this.changeCategory.name.length >= 50) {
                // slice(0, 50) => cut string from 0 to 50
                this.changeCategory.name = this.changeCategory.name.slice(0, 50)
                alert("Category name must be less than 50 characters")
                return
            }

            this.previewAddCategoryIcon(event, 'change-icon-preview', this.changeCategory.name, this.changeCategory.logo_url)
        },
        previewAddCategoryIcon(event, id, name, logo_url) {
            const parent = document.getElementById(id)

            // verify font-awesome icon by checking it has <i> tag or not first
            if (logo_url?.includes('<i') && logo_url?.includes('</i>')) {
                // if it has <i> tag, then check if it has 'fa-' class or not
                // https://fontawesome.com/docs/web/add-icons/how-to
                if (logo_url?.includes('fa')) {
                    parent.innerHTML = logo_url + name
                    return
                }
            }

            // if it doesn't have <i> tag, then re-render icon
            parent.innerHTML = name
        },
        updateCategory(event) {
            for (let i = 0; i < this.categories.length; i++) {
                if (this.categories[i].name === this.changeCategory.inputName) {
                    this.changeCategory.id = this.categories[i].category_id
                    this.changeCategory.name = this.categories[i].name
                    this.changeCategory.logo_url = this.categories[i].logo_url

                    this.previewAddCategoryIcon(event, 'change-icon-preview', this.changeCategory.name, this.changeCategory.logo_url)
                    return
                }
            }

            // if it doesn't find any category, then reset changeCategory
            this.resetAfterUpdateCategory()
        },
        checkCanSaveAddOrUpdateCategory(name, logo, id) {
            if (!name) {
                alert('Category name is required')
                return false
            }
            if (!logo.includes('<i') && !logo.includes('</i>')) {
                alert('Category icon is required')
                return false
            }
            // if it has <i> tag, then check if it has 'fa-' class or not
            if (!logo.includes('fa')) {
                alert('Category icon is required')
                return false
            }
            if (!id) {
                alert('ID is required to update a category')
                return false
            }

            return true
        },
        async saveNewCategory() {

            if (!this.checkCanSaveAddOrUpdateCategory(this.addCategory.name, this.addCategory.logo_url, 'thisArgumentIsToByPassIdCheck')) {
                return
            }

            const { res, error } = await usePost('/api/admin/site-management/post/addCategory', {
                params: this.addCategory,
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (res.value?.data?.status === 'success') {
                this.addCategory = {
                    name: '',
                    logo_url: '',
                }

                alert('Add category successfully')

                // fetch new categories
                this.fetchCategories()
            } else {
                alert(error.value?.data?.message || 'Something went wrong, please try again')
            }
        },
        resetAfterUpdateCategory() {
            // reset changeCategory data to empty
            this.changeCategory = {
                inputName: '',
                id: '',
                name: '',
                logo_url: '',
            }

            // reset select option
            const select = document.getElementById('update-cate-select')
            select.selectedIndex = 0

            // reset preview icon
            this.previewAddCategoryIcon('event', 'change-icon-preview', this.changeCategory.name, this.changeCategory.logo_url)

        },
        async saveUpdateCategory() {

            if (!this.checkCanSaveAddOrUpdateCategory(this.changeCategory.name, this.changeCategory.logo_url, this.changeCategory.id)) {
                return
            }

            const { res, error } = await usePost('/api/admin/site-management/post/updateCategory', {
                params: {
                    name: this.changeCategory.name,
                    category_id: this.changeCategory.id,
                    logo_url: this.changeCategory.logo_url
                },
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (res.value?.data?.status === 'success') {
                alert('Update category successfully')
                this.fetchCategories()
            } else {
                alert(error.value?.data?.message || 'Something went wrong, please try again')
            }
        },
        async removeOneCategory() {
            if (!this.changeCategory.id) {
                alert('ID is required to remove a category')
                return
            }

            const { res, error } = await usePost('/api/admin/site-management/post/removeCategory', {
                params: {
                    category_id: this.changeCategory.id
                },
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (res.value?.data?.status === 'success') {
                alert('Category has been removed')
                this.fetchCategories()
            } else {
                alert(error.value?.data?.message || 'Something went wrong, please try again')
            }
        },
    },
    watch: {
        // if categories change, then reset changeCategory data to empty
        categories: {
            handler: function () {
                this.resetAfterUpdateCategory()

                // send signal to re-fetch category search in other component
                this.reFetchCategorySearchFunc(true)
            },
            deep: true
        },
    }
}
</script>
