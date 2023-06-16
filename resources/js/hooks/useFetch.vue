<script>
    import { ref } from 'vue';

    export default async function useFetch (url, { csrf, api_token, params }) {
        const data = ref(null);
        const error = ref(null);
        const loading = ref(false);

        loading.value = true;

        try {
            const res = await axios.get(url, {
                headers: {
                    'X-CSRF-TOKEN': csrf,
                    'Authorization': api_token
                },
            });

            data.value = res.data;
        } catch (err) {
            error.value = err.message;
        } finally {
            loading.value = false;
        }

        return { data, error, loading };
    }
</script>
