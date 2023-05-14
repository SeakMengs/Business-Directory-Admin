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

app.mount('#app')
