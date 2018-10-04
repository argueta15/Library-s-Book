require('./bootstrap')
import Router from './routes.js'
import Vuetify from 'vuetify'
import VeeValidate from 'vee-validate'
import Auth from './packages/auth/Auth.js'

Vue.use(Auth)
Vue.use(Vuetify)
Vue.use(VeeValidate)

axios.defaults.baseURL = 'http://localhost:8081/';
axios.interceptors.request.use(function(config){
    config.headers['Authorization'] = 'Bearer ' + Vue.auth.getToken();
    return config;
})
// Add a response interceptor
/*axios.interceptors.response.use(function (response) {
		return response;
	}, function (error) {
	if(error.response.status == 422)
		return error;
	if(error.response.status == 404)
		swal(error.response.status.toString(), error.response.data, "error")
	else if(error.response.status == 500)
		swal(error.response.status.toString(), 'We are experiencing a problem in our servers!', "error")
});
*/
Router.beforeEach(
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
    router: Router
});
