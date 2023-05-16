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
                                <input class="cate-input-box" type="text" placeholder="Ex: Accountants - General"
                                    autocomplete="off">
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
                                <input class="cate-input-box" type="text" placeholder="Ex: Accountants - General"
                                    autocomplete="off">
                            </div>
                            <div class="cate-tick-wrapper">
                                <input class="tick-input" @click="() => this.isUpdateIcon = !this.isUpdateIcon" type="checkbox"
                                    id="isUpdateIcon">
                                <label for="isUpdateIcon">
                                    <h3>Update Icon</h3>
                                </label>
                            </div>
                            <!-- if user check update icon, show it -->
                            <div v-if="this.isUpdateIcon === true" @click="uploadFile" class="upload-box">
                                <input class="hidden" type="file" name="" id="uploadIcon">
                                <span>Drag the icon in or Click in this area</span>
                            </div>
                            <div class="cate-add-remove-wrapper">
                                <button class="add-cate-btn">Edit Category</button>
                                <button class="remove-cate-btn">Remove Category</button>
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
            <div class="total-header all-cate-wrapper">
                <h1>Categories</h1>
                <div class="search-wrapper search-cate">
                    <input class="search" type="text" name="search" id="search" placeholder="Search" autocomplete="off">
                    <div class="center search-bg">
                        <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
                            <path
                                d="M 21 3 C 11.621094 3 4 10.621094 4 20 C 4 29.378906 11.621094 37 21 37 C 24.710938 37 28.140625 35.804688 30.9375 33.78125 L 44.09375 46.90625 L 46.90625 44.09375 L 33.90625 31.0625 C 36.460938 28.085938 38 24.222656 38 20 C 38 10.621094 30.378906 3 21 3 Z M 21 5 C 29.296875 5 36 11.703125 36 20 C 36 28.296875 29.296875 35 21 35 C 12.703125 35 6 28.296875 6 20 C 6 11.703125 12.703125 5 21 5 Z" />
                        </svg>
                    </div>
                </div>
            </div>
            <div class="total-result">
                <div class="sort-wrapper">
                    <label for="sort-comp">Show By:</label>
                    <select name="sortSelect" id="sort-comp" class="sort-select">
                        <option value="Most Report">Recent</option>
                        <option value="Least Report">Old</option>
                    </select>
                </div>
            </div>
            <div class="total-result">
                <span  >Total result: 305</span>
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
