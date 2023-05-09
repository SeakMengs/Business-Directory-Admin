require('./bootstrap')

import { createApp } from 'vue'
import login from './components/Login'
import dashboard from './components/Dashboard'
import leftMenu from './components/Left-menu'
import rightContent from './components/dashboard-content/Right-content'
import rightContent2 from './components/dashboard-content/Right-content2'

const app = createApp({})

// first argument is the name of the component, second argument is the component itself
app.component('login', login)
app.component('dashboard', dashboard)
app.component('left-menu', leftMenu)
app.component('right-content', rightContent)
app.component('right-content2', rightContent2)

app.mount('#app')
