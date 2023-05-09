require('./bootstrap')

import { createApp } from 'vue'
import login from './components/Login'
import dashboard from './components/Dashboard'
import leftMenu from './components/Left-menu'
import overview from './components/dashboard-content/Overview'
import accountManagement from './components/dashboard-content/Account-management'

const app = createApp({})

// first argument is the name of the component, second argument is the component itself
app.component('login', login)
app.component('dashboard', dashboard)
app.component('left-menu', leftMenu)
app.component('overview', overview)
app.component('account-management', accountManagement)

app.mount('#app')
