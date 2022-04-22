import { HttpClient } from './httpClient' 
import { authHeader } from '../helpers'

// This is the API. The backend root URL can be set from here.
const API = 'http://localhost:3001/api/v1'

//Setting the todos URI
const USERS_API = `${API}/users`

  let user = JSON.parse(localStorage.getItem('user'));

// Authentication
const login = (email, password) => {
  return HttpClient.post(`${USERS_API}/sign_in`,{
    user: {
      email: email,
      password: password
    }
  })
}

const logout = () => {
  return HttpClient.delete(`${USERS_API}/sign_out`, {headers: authHeader()})
}

const UserEndpoints = { login, logout }

export { UserEndpoints }