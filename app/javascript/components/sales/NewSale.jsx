import React, { Component } from 'react';

import { connect } from 'react-redux'
import * as saleActions from '../../store/actions/saleActions'
import * as customerActions from '../../store/actions/customerActions'

import CustomerForm from './../customers/CustomerForm';
import Modal from './../../UI/Modal/Modal'
import Bill from './Bill'

import { bindActionCreators } from 'redux'

class NewSale extends Component{

  constructor(props) {
    super(props)
    console.log(`Los Props`,props)
    this.handleText = this.handleText.bind(this);
    this.addLineItem = this.addLineItem.bind(this);
    this.removeLineItem = this.removeLineItem.bind(this);
    this.selectCustomer = this.selectCustomer.bind(this);
    this.closeModal = this.closeModal.bind(this);
    this.sendSell = this.sendSell.bind(this)
    this.handleKeyUp = this.handleKeyUp.bind(this);


  }

  componentDidMount() {
    this.props.saleActions.GetAllItems()
    this.props.customerActions.GetAllCustomers()
    // console.log('ESTAS son las acciones', this.props.saleActions)
    // console.log('ESTAS son las acciones', this.props.customerActions)

  }

  handleText(e){
    const {value, name } = e.target;
    if(name == 'search-products')
    {
      this.props.saleActions.searchItems(value);
    }
    if(name == "search-customers"){
      this.props.saleActions.searchCustomers(value);
    }
  }

  addLineItem(index, item){
    this.props.saleActions.addLineItem(item)
  }

  removeLineItem(index,line_item){
    this.props.saleActions.removeLineItem(line_item,index);
  }

  selectCustomer(customer){
    this.props.saleActions.selectCustomer(customer)
  }

  closeModal(){
    $('.close').click();
  }

  handleKeyUp(e){
    if(e.keyCode == 13){
      console.log('fire and open')
      this.props.customerActions.replaceCustomer(-1)
      $('#customer-modal').click();

    }
  }

  sendSell(sale){
    this.props.saleActions.createSale(sale)
    $('#bill-modal').click()
  }
  

  render(){
    let content;
    let line_items;
    let customers;

    if(this.props.loading){
      content = <h5>Cargando ...</h5>;
    }
    else{
      if(this.props.errorMessage == ""){
        content = <h2>Error al obtener los productos .</h2>;
      }
      else{ 
        content = this.props.items.map((item,index) => {
          return(
           <div className="col-md-3 mt-4" key={index}>
             <div className={"card " + ((item.id % 2) == 0 ? "bg-info" : "bg-success")   + " cursor-pointer"} onClick={() => this.addLineItem(index, item)} >
               <div className="card-body text-center">
                 <h6>{item.name}</h6>
               </div>
             </div>
           </div>
          );
        }); 
      }
    }

    line_items = this.props.sale.line_items.map((item,index) => {
      return (
        <tr key={index} onClick={() => this.removeLineItem(index, item)} className="cursor-pointer table-success">
          <td>{item.quantity}</td>
          <td>{item.detail}</td>
          <td>{item.unit_price}</td>
          <td>{item.total_price}</td>
        </tr>
      )
    });

    customers = this.props.customers.map((customer,index) => {
      return (
        <tr key={index} onClick={() => this.selectCustomer(customer, index)} className={"cursor-pointer " +((this.props.sale.customer && (customer.id == this.props.sale.customer.id)) ? "table-danger" : "") + ""} >
          <td>{customer.first_name}</td>
          <td>{customer.last_name}</td>
          <td>{customer.nit}</td>
        </tr>
      )
    });
    let line_components =  this.props.sale.line_items;


    return(
      <div>
          <div className="row">
            <div className="col-md-4">
              <table className="table">
                <thead className="thead-light">
                  <tr>
                    <th>Cantidad</th>
                    <th>Concepto</th>
                    <th>PU</th>
                    <th>TOTAL</th>
                  </tr>

                </thead>
                <tbody>
                  {line_items}
                  <tr className="table-active">
                    <th></th>
                    <th></th>
                    <th>TOTAL</th>
                    <th>{this.props.sale.total}</th>
                  </tr>
                </tbody>
              </table>
            </div>
            <div className="col-md-8">
             
              <div className="container tabs-pos">

                  <nav>
                    <div className="nav nav-tabs" id="nav-tab" role="tablist">
                      <a className="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Productos</a>
                      <a className="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Cliente</a>
                    </div>
                  </nav>
                  <div className="tab-content" id="nav-tabContent">
                    <div className="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                      <input type="text" name="search-products" placeholder="Buscar productos ..." className="form-control"  onChange={this.handleText}/>
                      <div className="row mt-4">
                        
                        {content}
                       
                      </div>
                      <br></br>
                      <br></br>
                      
                    </div>

                    <div className="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                      Aquí se tiene que crear los servicios
                      <br></br>
                      <br></br>
                      
                    </div>
                    <div className="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                      <input type="text" name="search-customers" placeholder="Buscar Cliente por NIT, CI, Nombre o Apellido" onChange={this.handleText} onKeyUp={this.handleKeyUp} className="form-control" />
                      <button hidden="hidden" id="customer-modal" className="btn btn-primary btn-rounded btn-lg m-b-30" data-toggle="modal" data-target="#new" >Nuevo Cliente</button>
                      <button hidden="hidden" id="bill-modal" className="btn btn-primary btn-rounded btn-lg m-b-30" data-toggle="modal" data-target="#bill" >Nuevo Cliente</button>

                      <Modal closeModal={this.closeModal} modalId="new" title='Nuevo Cliente' action="new">
                        <CustomerForm closeModal={this.closeModal} action='new' />
                      </Modal>
                      <br></br>
                      <table className="table">
                        <thead className="thead-light">
                          <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>NIT</th>
                          </tr>
                        </thead>
                        <tbody>
                          {customers}
                        </tbody>
                        
                      </table>
                      <br></br>
                      <br></br>
                      
                    </div>

                    <Modal closeModal={this.closeModal} modalId="bill" title='Resultado de la Transaccion' action="bill">
                      <Bill closeModal={this.closeModal} action='new' company={this.props.company} itemList={line_components} saleResult={this.props.saleResult} totalValue={this.props.sale.total} clientName={this.props.sale.customer.first_name + " " +this.props.sale.customer.last_name } />
                    </Modal>

                  </div>
                 
              </div>
              <div className="container">
                <div className="row">
                    <div className="col-md-6">
                      <h3>Total: {this.props.sale.total} Bs.</h3>                          
                    </div>
                    <div className="col-md-6">
                      { (this.props.canSell && Object.keys(this.props.sale.customer).length > 0) ? <button type="button" onClick={() => this.sendSell(this.props.sale)} className="btn btn-danger btn-rounded btn-lg" >Realizar Venta</button> : '' }                 
                    </div>                         
                </div>  
              </div>
            </div> 
          </div>
      </div>
    );
  }

}

function mapStateToProps(state, ownProps) {
  return {
      items: state.SaleReducer.items,
      customers: state.SaleReducer.customers,
      sale: state.SaleReducer.sale,
      canSell: state.SaleReducer.canSell,
      loading: state.SaleReducer.loading,
      saleResult: state.SaleReducer.saleResult
  }
}

function mapDispatchToProps(dispatch) {
  return {
      // actions: bindActionCreators(saleActions, dispatch)

      saleActions: bindActionCreators(saleActions, dispatch),
      customerActions: bindActionCreators(customerActions, dispatch)
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(NewSale);
