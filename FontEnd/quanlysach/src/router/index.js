import { createRouter, createWebHistory } from "vue-router";

import Home from '../components/Home.vue';
import DetailNXB from '../components/DetailNXB.vue'
import Login from '../components/Login.vue'
import Register from '../components/Register.vue'
import User from '../components/User.vue'


const routes = [
    {path: '/',  component: Login},
    {path: '/home', component: Home},
    {path: '/detail', component: DetailNXB},
    {path: '/register', component: Register},
    {path: '/user', component: User},

]


const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router