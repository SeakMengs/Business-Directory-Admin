<template>
    <div class="search-wrapper search-cate">
        <input class="search" type="text" name="search" id="search" placeholder="Search" autocomplete="off">
        <div class="center search-bg">
            <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
                <path
                    d="M 21 3 C 11.621094 3 4 10.621094 4 20 C 4 29.378906 11.621094 37 21 37 C 24.710938 37 28.140625 35.804688 30.9375 33.78125 L 44.09375 46.90625 L 46.90625 44.09375 L 33.90625 31.0625 C 36.460938 28.085938 38 24.222656 38 20 C 38 10.621094 30.378906 3 21 3 Z M 21 5 C 29.296875 5 36 11.703125 36 20 C 36 28.296875 29.296875 35 21 35 C 12.703125 35 6 28.296875 6 20 C 6 11.703125 12.703125 5 21 5 Z" />
            </svg>
        </div>
    </div>
    <div class="total-result">
        <div class="sort-wrapper">
            <label for="sort-comp">Banned By:</label>
            <select name="sortSelect" id="sort-comp" class="sort-select">
                <option value="Most Report">AdminName1</option>
                <option value="Least Report">AdminName12</option>
            </select>
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
        <span>Total result: 305</span>
    </div>
    <div class="table-wrapper">
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Profile</th>
                <th>Company Name</th>
                <th>Category</th>
                <th>Total Report</th>
                <th>Ban Reason</th>
                <th>Banned By</th>
                <th>Action</th>
            </tr>
            <!-- data start here -->
            <tr>
                <td>
                    <input type="text" value="1" readonly>
                </td>
                <td>
                    <div class="i-normal-user-bg center">
                        <!-- default profile if user has never uploaded profile before -->
                        <i class="i-normal-user"></i>
                    </div>
                </td>
                <td>
                    <input type="text" value="Amazon" readonly>
                </td>
                <td>
                    <input type="text" value="Car Dealer" readonly>
                </td>
                <td>
                    <input type="number" value="81" readonly>
                </td>
                <td>
                    <!-- https://css-tricks.com/auto-growing-inputs-textareas/ -->
                    <span role="textbox" contenteditable>
                        They are fake company
                    </span>
                </td>
                <td>
                    <input type="text" value="Admin1" readonly>
                </td>
                <td>
                    <div class="cate-add-remove-wrapper">
                        <button class="add-cate-btn">Update</button>
                        <button class="reset-cate-btn">Unban</button>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</template>
