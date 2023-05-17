<template>
    <div class="cate-card">
        <div class="add-cate-wrapper">
            <form action="" class="add-cate-form">
                <img class="profile-round" src="https://static01.nyt.com/images/2021/02/27/arts/tomjerry1/tomjerry1-mediumSquareAt3X.jpg"
                    alt="profile">
                <div class="cate-input-wrapper">
                    <h3>Admin Name:</h3>
                    <input class="cate-input-box" type="text" autocomplete="off">
                </div>
                <div class="cate-input-wrapper">
                    <h3>New Password: </h3>
                    <input class="cate-input-box" type="password" autocomplete="off">
                </div>
                <div class="cate-input-wrapper">
                    <h3>Password: </h3>
                    <input class="cate-input-box" type="password" autocomplete="off" required>
                </div>
                <div @click="uploadFile" class="upload-box">
                    <input class="hidden" type="file" name="" id="uploadIcon">
                    <span>Drag the icon in or Click in this area</span>
                </div>
                <div class="cate-add-remove-wrapper">
                    <button type="submit" class="add-cate-btn">Update Profile</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
export default {
    methods: {
        uploadFile() {
            document.getElementById('uploadIcon').click();
        }
    }
}
</script>
