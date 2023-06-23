<template>
    <div class="db-content-wrapper">
        <add-edit-category></add-edit-category>
        <search-category></search-category>
    </div>
</template>

<script>
import addEditCategory from './category/Add-edit-category.vue'
import searchCategory from './category/Search-category.vue'
import { ref, computed } from 'vue'

export default {
    setup() {
        const reFetchCategorySearch = ref(false)

        return {
            reFetchCategorySearch,
        }
    },
    components: {
        addEditCategory,
        searchCategory,
    },
    methods: {
        reFetchCategorySearchFunc(bool) {
            this.reFetchCategorySearch = bool
        }
    },
    provide() {
        return {
            reFetchCategorySearch: computed(() => this.reFetchCategorySearch),
            reFetchCategorySearchFunc: this.reFetchCategorySearchFunc,
        }
    },
}
</script>
