import React, { Component } from 'react';
import Modal from './../../UI/Modal/Modal';
import CustomerForm from './CustomerForm';
import { connect } from 'react-redux'
import * as customerActions from '../../store/actions/customerActions'
import { bindActionCreators } from 'redux'


class CustomersList extends Component{
  
  constructor(){
    super();
    
    this.replaceModalItem = this.replaceModalItem.bind(this);
    this.deleteItem = this.deleteItem.bind(this);
    this.closeModal = this.closeModal.bind(this);
  }

  componentDidMount(){
    this.props.actions.GetAllCustomers()
  }

  replaceModalItem(index) {
    this.props.actions.replaceCustomer(index)
  }

  deleteItem(index) {
    let tempCustomers = this.props.customers;
    let tempItem = tempCustomers[index];
    this.props.actions.removeCustomer(index,tempItem.id)
  }

  closeModal(){
    $('.close').click();
  }

  render(){
    const { requiredItem,customers, loading } = this.props;
    let data = customers[requiredItem];
    // let data;
    // if(requiredItem == -1){
    //   data = {id: '',
    //     first_name:  '',
    //     last_name: '',
    //     sex: '',
    //     nit: ''}
    // }
    // else{
    //   data= customers[requiredItem]
    // }
    if(loading){
      return <p>Esta cargando ...</p>;
    }
    else{
      if(customers.length > 0){
        const clientes = customers.map((customer,index) => {
              return(
                <div className="col-md-3 mt-4" key={index}>
                  <div className="card" >

                    <div className="card-body text-center">
                      <div className="thumb-xl member-thumb center-page">
                          <img src={customer.image} className="rounded-circle img-thumbnail" alt="profile-image" />
                      </div>
                      <h5>{customer.first_name }</h5>
                      {customer.last_name}
                      {/* <p>sexo: {customer.sex}</p> */}

                    </div>
                    <div className="card-footer text-center">
                      <button className="btn btn-sm btn-icon btn-primary" data-toggle="modal" data-target="#edit" onClick={() => this.replaceModalItem(index)}><i className="fa fa-edit"></i></button>{" "}
                      <button className="btn btn-sm btn-icon btn-danger" onClick={() => { if (window.confirm('¿Estás seguro de eliminar el cliente?')) this.deleteItem(index) } }> <i className="fa fa-remove"></i> </button>
                    </div>

                  </div>
                </div>
              );
            })
        return(
          <div>
              <div className="row">
                  <div className="col-sm-12">
                      <h4 className="header-title m-t-0 m-b-20">Clientes</h4>
                  </div>                 
              </div>              
              <button className="btn btn-primary btn-rounded btn-lg m-b-30" data-toggle="modal" data-target="#new" onClick={() => this.replaceModalItem(-1)}>Nuevo Cliente</button>

              <Modal closeModal={this.closeModal} modalId="new" title='Nuevo Cliente' action="new">
                <CustomerForm closeModal={this.closeModal} action='new' />
              </Modal>
           
              <div className="container">

                <div className="row mt-4">
                  {clientes}
                </div>

              </div>
              {/* <Modal closeModal={this.closeModal} modalId="edit" title='Editar Cliente' data={modalData} action="edit" /> */}
              <Modal closeModal={this.closeModal} modalId="edit" title='Editar Cliente' action="edit">
                <CustomerForm closeModal={this.closeModal} action='edit' item={data}/>
              </Modal>
          </div>
        );
      }
      else{
        return(
          <div>
            {/* <button className="btn btn-sm btn-primary" data-toggle="modal" data-target="#newMod">Nuevo</button> */}

            <div className="container">
              <div className="row mt-4">
                <p>No existen clientes</p>
              </div>
            </div>

            {/* <Modal closeModal={this.closeModal} modalId="newMod" title='Nuevo Cliente' action="new" /> */}

          </div>

        );
      }
    }
  }
}

function mapStateToProps(state, ownProps) {
  return {
      customers: state.CustomerListReducer.customers,
      loading: state.CustomerListReducer.loading,
      errorMessage: state.CustomerListReducer.errorMessage,
      requiredItem: state.CustomerListReducer.requiredItem
  }
}

function mapDispatchToProps(dispatch) {
  return {
      actions: bindActionCreators(customerActions, dispatch)
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(CustomersList);