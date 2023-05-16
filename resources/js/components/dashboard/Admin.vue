<template>
    <div class="db-content-wrapper">
        <div class="cate-section-1">
            <div class="cate-section-1-child">
                <div class="total-header">
                    <h1>Create ADMIN</h1>
                </div>
                <div class="cate-card">
                    <div class="add-cate-wrapper">
                        <form action="" class="add-cate-form">
                            <div class="cate-input-wrapper">
                                <h3>Admin Name:</h3>
                                <input class="cate-input-box" type="text" autocomplete="off">
                            </div>
                            <div class="cate-input-wrapper">
                                <h3>Password: </h3>
                                <input class="cate-input-box" type="password" autocomplete="off">
                            </div>
                            <div class="cate-input-wrapper">
                                <h3>Privilege:</h3>
                            </div>
                            <div class="privilege-wrapper">
                                <div class="cate-tick-wrapper">
                                    <input class="tick-input" type="checkbox" id="findAllUser">
                                    <label for="findAllUser">
                                        <h3>Find All User</h3>
                                    </label>
                                </div>
                                <div class="cate-tick-wrapper">
                                    <input class="tick-input" type="checkbox" id="addCategory">
                                    <label for="addCategory">
                                        <h3>Add Category</h3>
                                    </label>
                                </div>
                                <div class="cate-tick-wrapper">
                                    <input class="tick-input" type="checkbox" id="banUserAndCompany">
                                    <label for="banUserAndCompany">
                                        <h3>Ban User&Company</h3>
                                    </label>
                                </div>
                                <div class="cate-tick-wrapper">
                                    <input class="tick-input" type="checkbox" id="accessEverything">
                                    <label for="accessEverything">
                                        <h3>Access Everything</h3>
                                    </label>
                                </div>
                            </div>
                            <div class="cate-add-remove-wrapper">
                                <button type="submit" class="add-cate-btn">Create Admin</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- edit category section -->
            <div class="cate-section-1-child">
                <div class="total-header">
                    <h1>Main Website Status</h1>
                </div>
                <div class="cate-card">
                    <div class="add-cate-wrapper">
                        <div class="add-cate-form">
                            <div class="sort-wrapper">
                                <label for="sort-comp">Site Status:</label>
                                <select name="sortSelect" id="sort-user" class="sort-select">
                                    <option value="Normal">Normal</option>
                                    <option value="Maintenance">Maintenance</option>
                                </select>
                            </div>
                            <label for="sort-comp">Current Site Status: <h3 style="display: inline;">Normal</h3></label>
                            <div class="cate-add-remove-wrapper">
                                <button class="reset-cate-btn">Set Site Status</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cate-section-2">
            <div class="total-header all-cate-wrapper">
                <h1>Admin List</h1>
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
                <span>Total result: 305</span>
            </div>
            <div class="table-wrapper">
                <table class="table">
                    <tr>
                        <th>ID</th>
                        <th>Profile</th>
                        <th>Admin Username</th>
                        <th>Nickname</th>
                        <th>Find All User</th>
                        <th>Add Category</th>
                        <th>Ban User & Company</th>
                        <th>Access Everything</th>
                        <th>Action</th>
                        <th>Reset Default Password</th>
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
                            <input type="text" value="AdminLong">
                        </td>
                        <td>
                            <input type="text" value="Tom">
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <div class="cate-add-remove-wrapper">
                                <button class="add-cate-btn">Update</button>
                                <button class="remove-cate-btn">Remove Admin</button>
                            </div>
                        </td>
                        <td>
                            <button class="reset-cate-btn">Reset</button>
                        </td>
                    </tr>
                    <!--! to be deleted -->
                    <tr>
                        <td>
                            <input type="text" value="1" readonly>
                        </td>
                        <td>
                            <img style="border-radius: 100%;"
                                src="https://static01.nyt.com/images/2021/02/27/arts/tomjerry1/tomjerry1-mediumSquareAt3X.jpg"
                                alt="" width="64" height="64">
                        </td>
                        <td>
                            <input type="text" value="AdminLong">
                        </td>
                        <td>
                            <input type="text" value="Tom">
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <div class="cate-add-remove-wrapper">
                                <button class="add-cate-btn">Update</button>
                                <button class="remove-cate-btn">Remove Admin</button>
                            </div>
                        </td>
                        <td>
                            <button class="reset-cate-btn">Reset</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" value="1" readonly>
                        </td>
                        <td>
                            <img style="border-radius: 100%;"
                                src="https://static01.nyt.com/images/2021/02/27/arts/tomjerry1/tomjerry1-mediumSquareAt3X.jpg"
                                alt="" width="64" height="64">
                        </td>
                        <td>
                            <input type="text" value="AdminLong">
                        </td>
                        <td>
                            <input type="text" value="Tom">
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <div class="cate-add-remove-wrapper">
                                <button class="add-cate-btn">Update</button>
                                <button class="remove-cate-btn">Remove Admin</button>
                            </div>
                        </td>
                        <td>
                            <button class="reset-cate-btn">Reset</button>
                        </td>
                    </tr>
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
                            <input type="text" value="AdminLong">
                        </td>
                        <td>
                            <input type="text" value="Tom">
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <div class="cate-add-remove-wrapper">
                                <button class="add-cate-btn">Update</button>
                                <button class="remove-cate-btn">Remove Admin</button>
                            </div>
                        </td>
                        <td>
                            <button class="reset-cate-btn">Reset</button>
                        </td>
                    </tr>
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
                            <input type="text" value="AdminLong">
                        </td>
                        <td>
                            <input type="text" value="Tom">
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <select name="td-findAllUser" id="">
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select>
                        </td>
                        <td>
                            <div class="cate-add-remove-wrapper">
                                <button class="add-cate-btn">Update</button>
                                <button class="remove-cate-btn">Remove Admin</button>
                            </div>
                        </td>
                        <td>
                            <button class="reset-cate-btn">Reset</button>
                        </td>
                    </tr>
                    <!--! to be deleted -->
                    <!-- end of data -->
                </table>
            </div>
        </div>
    </div>
</template>
