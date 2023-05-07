require('./bootstrap')

import { createApp } from 'vue'
import login from './components/Login'
import dashboard from './components/Dashboard'

const app = createApp({})

// first argument is the name of the component, second argument is the component itself
app.component('login', login)
app.component('dashboard', dashboard)

app.mount('#app')
