require('./bootstrap')

import { createApp } from 'vue'
import login from './components/Login'
import dashboard from './components/dashboard/Dashboard'
import leftMenu from './components/dashboard/Left-menu'
import navbar from './components/dashboard/Navbar'
import overview from './components/dashboard/Overview'
import accountManagement from './components/dashboard/Account-management'

const app = createApp({})

// first argument is the name of the component, second argument is the component itself
app.component('login', login)
app.component('dashboard', dashboard)
app.component('left-menu', leftMenu)
app.component('navbar', navbar)
app.component('overview', overview)
app.component('account-management', accountManagement)

app.mount('#app')
