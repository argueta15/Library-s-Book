export const clientId = '2'
export const clientSecret = 'A9thM9xzniBAvC3uear9v68CcqZo2qiS98LlV1EQ'
export const loginUrl = 'oauth/token'
export const userUrl = 'api/user'
export const getHeader = function () {
  const headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + Vue.auth.getToken()
  }
  return headers
}