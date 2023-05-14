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
                                <input class="cate-input-box" type="text" placeholder="Ex: Accountants - General">
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
                                    <option v-for="category in this.allCategory" :key="category.id" :value="category.name">
                                    </option>
                                </datalist>
                            </div>
                            <div class="cate-input-wrapper">
                                <h3>Change to :</h3>
                                <input class="cate-input-box" type="text" placeholder="Ex: Accountants - General">
                            </div>
                            <div class="cate-input-wrapper">
                                <input @click="() => this.isUpdateIcon = !this.isUpdateIcon" type="checkbox"
                                    id="isUpdateIcon" checked>
                                <label for="isUpdateIcon">
                                    <h3>Update Icon</h3>
                                </label>
                            </div>
                            <!-- if user check update icon, show it -->
                            <div v-if="this.isUpdateIcon === true" @click="uploadFile" class="upload-box">
                                <input class="hidden" type="file" name="" id="uploadIcon">
                                <span>Drag the icon in or Click in this area</span>
                            </div>
                            <div class="center">
                                <button class="add-cate-btn">Edit Category</button>
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
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajknadasdadsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsasdsjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsjdasdsadandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsdajandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajknddasdassjandsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajkndsjandasdasdsajdnasj</span>
                </div>
                <div class="category-wrapper">
                    <img width="16" height="16" src="https://img.icons8.com/ios/50/diversity.png" alt="diversity" />
                    <span title="id: 1023">dnsajknddadasjandsajdnasj</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import { ref } from 'vue';

export default {
    setup() {
        const isUpdateIcon = ref(false);
        const allCategory = [
            {
                name: 'General Accountants',
                icon: 'https://img.icons8.com/ios/50/diversity.png',
                id: '1'
            },
            {
                name: 'Auto Repair',
                icon: 'https://img.icons8.com/ios/50/diversity.png',
                id: '2'
            },
            {
                name: 'Car Dealers',
                icon: 'https://img.icons8.com/ios/50/diversity.png',
                id: '3'
            },
        ]

        return {
            allCategory,
            isUpdateIcon
        }
    },
    methods: {
        uploadFile() {
            document.getElementById('uploadIcon').click();
        }
    }
}
</script>
