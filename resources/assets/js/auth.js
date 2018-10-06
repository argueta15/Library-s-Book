export const auth = {
	 data () {
      return {
        user: '',
		isAuth: null,
      }
    },
	created () {
		this.isAuth = this.$auth.isAuthenticated()
		this.$auth.setAuthenticatedUser(JSON.parse(localStorage.getItem('user')))
		this.user = this.$auth.getAuthenticatedUser()
	}
}