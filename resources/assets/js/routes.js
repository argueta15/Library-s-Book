import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const router = new VueRouter({
	routes: [
		{
			path: "/",
			component: require('./pages/Home.vue'),
			meta: {
				forVisitors: true
			}
		},
		{
			path: "/login",
			component: require('./pages/Login.vue'),
			meta: {
				forVisitors: true
			}
		},
		{
			path: "/admin",
			component: require('./pages/Admin.vue'),
			meta: {
				forVisitors: false
			}
		}
	],
	mode: 'history',
	linkActiveClass: 'active'
})

export default router
