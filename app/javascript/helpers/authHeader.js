export const authHeader = () => {
  // return authorization header with jwt token
  // let user = JSON.parse(localStorage.getItem('user'));

  if (gon.token) {
      return `Bearer ${gon.token}`;
    
  } else {
      return '';
  }
}