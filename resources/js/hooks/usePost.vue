<script>
import { ref } from 'vue';

export default async function usePost(url, { csrf, api_token, params }) {
    const res = ref(null)
    const error = ref(null)

    // console.log(csrf, api_token, params)

    try {
        res.value = await axios.post(url, params, {
            headers: {
                'X-CSRF-TOKEN': csrf,
                'Authorization': api_token
            },
        })
    } catch (err) {
        error.value = err.response
    } finally {
        return { res, error }
    }
}
</script>
