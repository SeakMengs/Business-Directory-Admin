<template>
    <div class="db-content-wrapper">
        <create-admin></create-admin>
        <admin-list></admin-list>
    </div>
</template>

<script>
import CreateAdmin from './admin-management/Create-admin.vue'
import AdminList from './admin-management/Admin-list.vue'
import { ref, computed } from 'vue';

export default {
    setup() {
        const reFetchAdmins = ref(false)

        return {
            reFetchAdmins,
        }
    },
    components: {
        CreateAdmin,
        AdminList,
    },
    methods: {
        reFetchAdminsFunc(bool) {
            this.reFetchAdmins = bool
            // console.log(this.reFetchAdmins)
        }
    },
    provide() {
        return {
            reFetchAdmins: computed(() => this.reFetchAdmins),
            reFetchAdminsFunc: this.reFetchAdminsFunc,
        }
    },
}
</script>
