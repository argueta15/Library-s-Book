export const clientId = '2'
export const clientSecret = 'x6LBdovvhiLaVi7pxdnkF3gvCSavE5AnB5EhveK0'
export const loginUrl = 'oauth/token'
export const userUrl = 'api/user'
export const getHeader = function () {
  const headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + Vue.auth.getToken()
  }
  return headers
}