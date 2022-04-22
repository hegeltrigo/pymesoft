import { UserEndpoints } from "../../api/userEndpoints";
import { userTypes } from '../types'

export const login = (user) => {
  return (dispatch) => {
      dispatch(loginRequest())
      UserEndpoints.login(user.email, user.password).then(res => {
          let data = res.data;
          data["token"] = res.headers.authorization
          localStorage.setItem('user', JSON.stringify(data));
          return dispatch(loginSuccess(res));
      }).catch((e) => {
        return dispatch(loginFailure(e));
      })
  }
}

const loginRequest = () => { return { type: userTypes.LOGIN_REQUEST }}
const loginSuccess = (response) => { return { type: userTypes.LOGIN_SUCCESS, response } }
const loginFailure = (errorMessage)=> { return { type: userTypes.LOGIN_FAILURE, errorMessage } }

export const logout = () => {

  return (dispatch) => {
      UserEndpoints.logout().then(res => {
      console.log('ESTO RESPONDIO EL SERVIDOR CON LOGOUT: ', res)
      localStorage.removeItem('user');
      return dispatch(logoutSuccess());
    }).catch((e) => {
      console.log(e);
    })
  }
}

const logoutSuccess = () => { return { type: userTypes.LOGOUT } }




