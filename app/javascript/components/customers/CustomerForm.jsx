import React, { Component } from 'react';
import { connect } from 'react-redux'
import * as customerActions from '../../store/actions/customerActions'
import { bindActionCreators } from 'redux'

class CustomerForm extends Component{
  constructor(props){
    super(props);

    this.state = {
      id: '',
      first_name:  '',
      last_name: '',
      // sex: '',
      nit: '',
      touched: {
        first_name: false,
        last_name: false
      }
    };

    this.submitForm = this.submitForm.bind(this);
    this.handleText = this.handleText.bind(this);
    this.validate = this.validate.bind(this);
    this.handleBlur = this.handleBlur.bind(this);

  }

  componentWillReceiveProps(nextProps) {
    if(nextProps.action == 'edit' && nextProps.item != undefined){
      this.setState({
          id: nextProps.item.id,
          first_name: nextProps.item.first_name,
          last_name: nextProps.item.last_name,
          // sex: nextProps.item.sex,
          nit: nextProps.item.nit
      });
    }
  }

  handleBlur = (field) => (evt) => {
    this.setState({
      touched: { ...this.state.touched, [field]: true },
    });
  }

  submitForm(e){
    e.preventDefault();
    // this.setState({ createLoading: true });

    if(this.props.action == "new"){
      this.props.actions.createCustomer(this.state)
      this.props.closeModal()
    }
    else{
      this.props.actions.updateCustomer(this.state);
      // this.props.closeModal();
    }
  }

  handleText(e){
    const {value, name } = e.target;
    this.setState({
      [name]: value
    });
  }

  validate(fields) {
    return {
      first_name: fields.first_name.length === 0,
      last_name: fields.last_name.length === 0,
      // sex: fields.sex.length === 0,
      nit: fields.nit.length === 0
    };
  }

  componentDidMount(){
    // const { current_customer, action, requiredItem } = this.props

    //  if(action == 'edit'){
    //   console.log('ABRIO')
    //   this.setState({
    //       id: current_customer.id,
    //       first_name: current_customer.first_name,
    //       last_name: current_customer.last_name,
    //       sex: current_customer.sex
    //   });
    // }

  }

  componentWillUpdate(){
    // console.log('AQUI ES COMPONENT WILL UPDATE')
  }

  componentDidUpdate(){

    if(this.props.close == true)
    {
      this.props.closeModal();

    } 
    
  }

  
  render(){
    const { current_customer, customers, action, createLoading, requiredItem, fireRedirect } = this.props

    //  if(action == 'edit'){
    //   this.setState({
    //       id: current_customer.id,
    //       first_name: current_customer.first_name,
    //       last_name: current_customer.last_name,
    //       sex: current_customer.sex
    //   });
    // }
    // console.log('Esto es props ', this.props.customers)

    const errors = this.validate(this.state);
    const isEnabled = !Object.keys(errors).some(x => errors[x]);

    const shouldMarkError = (field) => {
      const hasError = errors[field];
      const shouldShow = this.state.touched[field];
      return hasError ? shouldShow : false;
    };

    return(
      <div>
        <form className="form-horizontal" role="form">

          <div className="row">
            <div className="col-md-6">
              <div className={ shouldMarkError('first_name') ? "form-group has-error" : "form-group" } >
                  <label className="col-md-2 col-form-label">Nombre</label>
                  <div className="col-md-12">
                      <input type="text" className="form-control " name="first_name" value={this.state.first_name} placeholder="Nombre ..."  onChange={this.handleText} onBlur={this.handleBlur('first_name')} />
                  </div>
              </div>
            </div>
            <div className="col-md-6">
              <div className={ shouldMarkError('last_name') ? "form-group has-error" : "form-group" }>
                  <label className="col-md-2 col-form-label">Apellido</label>
                  <div className="col-md-12">
                      <input type="text" className="form-control" name="last_name" value={this.state.last_name} placeholder="Apellido ..." onChange={this.handleText} onBlur={this.handleBlur('last_name')} />
                  </div>
              </div>
            </div>

            
          </div>

          <div className="row">
            <div className="col-md-6">
              <div className={ shouldMarkError('nit') ? "form-group has-error" : "form-group" } >
                  <label className="col-md-2 col-form-label">NIT</label>
                  <div className="col-md-12">
                      <input type="text" className="form-control " name="nit" value={this.state.nit} placeholder="NIT ..."  onChange={this.handleText} onBlur={this.handleBlur('nit')} />
                  </div>
              </div>
            </div>
            {/* <div className="col-md-4">
              <div className={ shouldMarkError('sex') ? "form-group has-error" : "form-group" }>
                  <label className="col-md-2 col-form-label">Sexo</label>
                  <div className="col-md-12">
                      <select className="form-control" name="sex" value={this.state.sex} onChange={this.handleText}>
                          <option value="" disabled selected>Seleccione el sexo</option>
                          <option  value="Masculino">Masculino</option>
                          <option  value="Femenino">Femenino</option>
                      </select>

                  </div>
              </div>
            </div> */}
          </div>  

          <div className="modal-footer">
            <button type="submit" className="btn btn-success" onClick={this.submitForm} disabled={!isEnabled}>Guardar</button>
            {createLoading &&
                   <img src="data:image/gif;base64,R0lGODlhEAAQAPIAAP///wAAAMLCwkJCQgAAAGJiYoKCgpKSkiH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCgAAACwAAAAAEAAQAAADMwi63P4wyklrE2MIOggZnAdOmGYJRbExwroUmcG2LmDEwnHQLVsYOd2mBzkYDAdKa+dIAAAh+QQJCgAAACwAAAAAEAAQAAADNAi63P5OjCEgG4QMu7DmikRxQlFUYDEZIGBMRVsaqHwctXXf7WEYB4Ag1xjihkMZsiUkKhIAIfkECQoAAAAsAAAAABAAEAAAAzYIujIjK8pByJDMlFYvBoVjHA70GU7xSUJhmKtwHPAKzLO9HMaoKwJZ7Rf8AYPDDzKpZBqfvwQAIfkECQoAAAAsAAAAABAAEAAAAzMIumIlK8oyhpHsnFZfhYumCYUhDAQxRIdhHBGqRoKw0R8DYlJd8z0fMDgsGo/IpHI5TAAAIfkECQoAAAAsAAAAABAAEAAAAzIIunInK0rnZBTwGPNMgQwmdsNgXGJUlIWEuR5oWUIpz8pAEAMe6TwfwyYsGo/IpFKSAAAh+QQJCgAAACwAAAAAEAAQAAADMwi6IMKQORfjdOe82p4wGccc4CEuQradylesojEMBgsUc2G7sDX3lQGBMLAJibufbSlKAAAh+QQJCgAAACwAAAAAEAAQAAADMgi63P7wCRHZnFVdmgHu2nFwlWCI3WGc3TSWhUFGxTAUkGCbtgENBMJAEJsxgMLWzpEAACH5BAkKAAAALAAAAAAQABAAAAMyCLrc/jDKSatlQtScKdceCAjDII7HcQ4EMTCpyrCuUBjCYRgHVtqlAiB1YhiCnlsRkAAAOwAAAAAAAAAAAA==" />
              }
          </div>

        </form>

      </div>
    );
  }

}

function mapStateToProps(state, ownProps) {
  return {
    customers: state.CustomerListReducer.customers,
    createLoading: state.CustomerListReducer.createLoading,
    close: state.CustomerListReducer.close
  }
}

function mapDispatchToProps(dispatch) {
  return {
      actions: bindActionCreators(customerActions, dispatch)
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(CustomerForm);

