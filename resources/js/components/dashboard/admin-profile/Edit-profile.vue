<template>
    <div class="cate-card">
        <div class="add-cate-wrapper">
            <form action="" class="add-cate-form">
                <img v-if="this.editProfile?.profile_url" :src="this.editProfile?.profile_url" alt="profile"
                    style="width: 128px; height: 128px; border-radius: 100%; object-fit: cover;">
                <div v-else-if="!this.editProfile?.profile_url" class="center">
                    <!-- default profile if user has never uploaded profile before -->
                    <i class="i-admin-user"></i>
                </div>
                <div class="cate-input-wrapper">
                    <h3>Admin Name:</h3>
                    <input class="cate-input-box" type="text" autocomplete="off" v-model="this.editProfile.name">
                </div>
                <div class="cate-input-wrapper">
                    <h3>Email:</h3>
                    <input class="cate-input-box" type="text" autocomplete="off" v-model="this.editProfile.email">
                </div>
                <div class="cate-input-wrapper">
                    <h3>New Password: </h3>
                    <input class="cate-input-box" type="password" autocomplete="off"
                        v-model="this.editProfile.new_password">
                </div>
                <div class="cate-input-wrapper">
                    <h3>Password: </h3>
                    <input class="cate-input-box" type="password" autocomplete="off" required
                        v-model="this.editProfile.password">
                </div>
                <div @click="uploadFile" class="upload-box">
                    <input @change="uploadImageToImgur($event)" class="hidden" type="file" name="" id="uploadIcon">
                    <span>Click in this area to upload the a new profile</span>
                </div>
                <button v-if="this.editProfile.isNewProfile" type="button" class="reset-cate-btn"
                    @click="this.removeUploadedImage">Use Current Profile Picture</button>
                <div class="cate-add-remove-wrapper">
                    <button @click="saveUpdateProfile" type="button" class="add-cate-btn">Update</button>
                    <button type="button" class="remove-cate-btn" @click="this.resetDefaultProfile">Reset Profile
                        Picture</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import usePost from '../../../hooks/usePost';
import { ref, inject } from 'vue'

export default {
    setup() {
        const csrf = inject('csrf')
        const api_token = inject('api_token')
        const user = inject('user')
        const getUserInfo = inject('getUserInfo')
        const IMGUR_CLIENT_ID = process.env.MIX_IMGUR_CLIENT_ID

        const editProfile = ref({
            name: user.value?.name,
            email: user.value?.email,
            password: '',
            new_password: '',
            profile_url: user.value?.profile_url,
            isNewProfile: false,
            admin_id: user.value?.admin_id
        })

        return {
            csrf,
            api_token,
            user,
            IMGUR_CLIENT_ID,
            editProfile,
            getUserInfo
        }
    },
    methods: {
        uploadFile() {
            document.getElementById('uploadIcon').click();
        },
        resetDefaultProfile() {
            this.editProfile.profile_url = '';
            this.editProfile.isNewProfile = false;
        },
        removeUploadedImage() {
            this.editProfile.profile_url = this.user?.profile_url;
            this.editProfile.isNewProfile = false;
        },
        async uploadImageToImgur(event) {
            //Reference: https://stackoverflow.com/questions/66616782/react-upload-an-image-to-imgur-using-axios-returns-err-http2-protocol-error
            const formData = new FormData();
            formData.append('image', event.target.files[0]);

            try {
                const res = await fetch('https://api.imgur.com/3/image', {
                    method: 'POST',
                    headers: {
                        Authorization: `Client-ID ${this.IMGUR_CLIENT_ID}`,
                    },
                    body: formData,
                });

                const data = await res.json();

                if (data.success) {
                    this.editProfile.profile_url = data.data.link;
                    this.editProfile.isNewProfile = true;
                }
            } catch (error) {
                console.log(error);
                alert('Upload image failed');
            }
        },
        async saveUpdateProfile() {
            if (this.editProfile.password === '') {
                alert('Password is required to update profile')
                return
            }
            if (this.editProfile.name === '') {
                alert('Please enter your name')
                return
            }
            if (this.editProfile.email === '') {
                alert('Please enter your email')
                return
            }

            const { res, error } = await usePost('/api/admin-management/post/profile/updateAdminProfile', {
                params: {
                    name: this.editProfile.name,
                    email: this.editProfile.email,
                    password: this.editProfile.password,
                    new_password: this.editProfile.new_password,
                    profile_url: this.editProfile.profile_url,
                    admin_id: this.editProfile.admin_id
                },
                csrf: this.csrf,
                api_token: this.api_token,
            })

            if (res.value?.data?.status === 'success') {
                alert('Profile has been updated')
                await this.getUserInfo()
            } else {
                alert(error.value?.data?.message || 'Something went wrong, please try again')
            }
        }
    },
    watch: {
        user: {
            handler: function () {
                this.editProfile = {
                    name: this.user?.name,
                    email: this.user?.email,
                    password: '',
                    new_password: '',
                    profile_url: this.user?.profile_url,
                    isNewProfile: false,
                    admin_id: this.user?.admin_id
                }
            },
            deep: true
        }
    }
}
</script>
