export const clientId = '2'
export const clientSecret = 'JlGuUJVxBRI7ZOow13Dx2cj88pFVRtfCtaZtKUwM'
export const loginUrl = 'oauth/token'
export const userUrl = 'api/user'
export const getHeader = function () {
  const headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + Vue.auth.getToken()
  }
  return headers
}