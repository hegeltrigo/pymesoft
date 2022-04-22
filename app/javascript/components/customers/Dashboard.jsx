import React, { Component } from 'react';
import { authHeader } from '../../helpers'
import { HttpClient } from '../../api/httpClient'
class Dashboard extends Component{
  

  componentDidMount(){
    // Here we validate the session
    console.log('Me acabo de montar')
    HttpClient.get('/users/validate_session', {}, { headers: authHeader() })
    .then(res => {
      console.log('La respuesta: ', res.data)
      if (res.status == 401){
        console.log('Soy 401')
        window.location.redirect('/users/sign_out')
      }
    }).catch(error => {
      window.location.replace('/users/sign_in')
    })
  }

  render(){

    return(
      <div className="row">
        <div className="col-md-12">
          <h1 style={{textAlign:'center', marginTop:'6vh'}}>Bienvenido a Tiluu</h1>
        </div>
        

          { (this.props.company && this.props.invoice) ? '' : <div className="col-md-12" style={{textAlign:'center'}}>
            <span style={{fontSize:'26px', marginRight:'15vw'}}>Antes de empezar</span>
            <div>
              <ol style={{fontSize:'19px',listStyle:'none', textAlign:'left', width:'32%', margin:'0 auto'}}>
                { (this.props.company != undefined) ? '' : <li ><a href="/company_details">Registremos algunos detalles de la organización</a></li>}
                { (this.props.invoice != undefined) ? '' : <li><a href="/invoice_dosages/new">Registremos algunos detalles de facturación </a></li>}
              </ol>
            </div>
          </div>}
      </div>
    );
  }

}

export default Dashboard;
