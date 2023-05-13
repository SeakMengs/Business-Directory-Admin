<template>
    <div class="db-content-wrapper">
        <div class="cate-section-1">
            <div class="cate-section-1-child">
                <div class="total-header">
                    <h1>Add A Category</h1>
                </div>
                <div class="cate-card">
                    <div class="flex">
                        <div class="add-cate-form">
                            <div class="flex">
                                <h3>Category Name:</h3>
                                <input type="text" placeholder="Ex: Accountants - General">
                            </div>
                            <div @click="uploadFile" class="upload-box">
                                <input class="hidden" type="file" name="" id="uploadIcon">
                                <span>Drag the icon in or Click in this area</span>
                            </div>
                            <div class="center">
                                <button class="add-cate-btn">Add Category</button>
                            </div>
                        </div>
                        <div class="cate-line"></div>
                        <div class="preview-wrapper">
                            <h3>Preview</h3>
                            <div class="preview-upload">
                                <div class="flex flex-col">
                                    <span>64px</span>
                                    <img width="64" height="64" src="https://img.icons8.com/ios/50/diversity.png"
                                        alt="diversity" />
                                </div>
                                <div class="flex flex-col">
                                    <span>32px</span>
                                    <img width="32" height="32" src="https://img.icons8.com/ios/50/diversity.png"
                                        alt="diversity" />
                                </div>
                                <div class="flex flex-col">
                                    <span>16px</span>
                                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png"
                                        alt="diversity" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cate-section-2">
            <div class="total-header">
                <h1>All Category | 102</h1>
            </div>
            <div class="cate-list">
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsdsaajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsadasdasjdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandssadasajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjanasdaddsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsadasdasjdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsadsaasdasjdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsadasdasdasjdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdasdasdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsaasdassdajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjaasdasndsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsasdasdasjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdasdasdasdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <span>dnsajkndsjandsasdsdddddddddddsadasajdnasj</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    setup() {
        return {
        }
    },
    methods: {
        uploadFile() {
            document.getElementById('uploadIcon').click();
        }
    }
}
</script>
