require('./bootstrap')
import router from './routes.js'
import Vuetify from 'vuetify'
import VeeValidate from 'vee-validate'
import Auth from './packages/auth/Auth.js'

Vue.use(Auth)
Vue.use(Vuetify)
Vue.use(VeeValidate)

axios.defaults.baseURL = 'http://localhost:8000/';
axios.interceptors.request.use(function(config){
    config.headers['Authorization'] = 'Bearer ' + Vue.auth.getToken();
    return config;
})

router.beforeEach(
	(to, from, next) => {
		if (to.matched.some(record => record.meta.forVisitors)){
			if (Vue.auth.isAuthenticated()){
				window.location = '/admin'
			} else next()
		} else if (to.matched.some(record => record.meta.forAuth)){
			if ( ! Vue.auth.isAuthenticated()){
				window.location = '/login'
			} else next()
		} else next()
	}
)

const app = new Vue({
    el: '#app',
    router
});
