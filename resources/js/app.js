require('./bootstrap')

import { createApp } from 'vue'
import login from './components/Login'
import dashboard from './components/dashboard/Dashboard'
import leftMenu from './components/dashboard/Left-menu'
import navbar from './components/dashboard/Navbar'
import overview from './components/dashboard/Overview'
import findUser from './components/dashboard/Find-user'
import findCompanyUser from './components/dashboard/Find-company-user'
import category from './components/dashboard/Category'
import company from './components/dashboard/Company'
import admin from './components/dashboard/Admin'
import adminProfile from './components/dashboard/Admin-profile'
import bannedUser from './components/dashboard/admin-profile/Banned-user'
import bannedCompany from './components/dashboard/admin-profile/Banned-company'
import editProfile from './components/dashboard/admin-profile/Edit-profile'
import banList from './components/dashboard/Ban-list'
import banListCompany from './components/dashboard/ban-list/Ban-list-company'
import banListUser from './components/dashboard/ban-list/Ban-list-user'
import loading from './components/Loading'

const app = createApp({})

// first argument is the name of the component, second argument is the component itself
app.component('login', login)
app.component('dashboard', dashboard)
app.component('left-menu', leftMenu)
app.component('navbar', navbar)
app.component('overview', overview)
app.component('find-user', findUser)
app.component('find-company-user', findCompanyUser)
app.component('category', category)
app.component('company', company)
app.component('admin', admin)
app.component('admin-profile', adminProfile)
app.component('banned-user', bannedUser)
app.component('banned-company', bannedCompany)
app.component('edit-profile', editProfile)
app.component('ban-list', banList)
app.component('ban-list-company', banListCompany)
app.component('ban-list-user', banListUser)
app.component('loading', loading)

app.mount('#app')
