import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as QRCode from 'qrcode.react'
import * as saleActions from '../../store/actions/saleActions'

const ref =  React.createRef()
class Bill extends React.Component {

  constructor(props){
    super(props)
  }
  
  FinishSale(props){
    this.props.actions.FinishSale()
    this.props.saleActions.GetAllItems()
    this.props.closeModal();
  }
  render(){
    let items_list = this.props.itemList.map((item,index) =>{
      return (
        <tr scope="row" key={index}>
          <td>{item.item_id}</td>
          <td> {item.detail} </td>
          <td> {item.quantity} </td>
          <td> x {item.unit_price} </td>
          <td>{item.total_price}</td>
        </tr>
      )
    })

    const divTableStyle = {
      display: 'flex',
      justifyContent: 'center',
      alignItems: 'center',
      flexDirection: 'column',
      paddingTop: '80px'
    }

    const options = {

  };
    
    return (
      <div>
        <div ref={ref} className="container">
          <div className="row">
            <div>
            <div className="invoice__header">
              <div className="invoice__header-description">
                <div style={{textAlign: "center", marginLeft:'6vw'}} className="invoice__header-company">
                  {this.props.company.company_name}
                </div>
                <span style={{overflowWrap: "break-word"}} className="invoice__header-description" >{this.props.company.address}</span>
                <span>{this.props.company.city}, {this.props.company.country}</span>
                <span>{this.props.company.phone_number}</span>
              </div>

              <div className="invoice__header-details">
                <ul>
                  <li>Nit: &nbsp;&nbsp;{this.props.company.nit} </li>
                  <li>Nro Factura: &nbsp;&nbsp; {this.props.saleResult.invoice != undefined ? this.props.saleResult.invoice.number : ''}</li>
                  <li>Nro Autorizacion: &nbsp;{this.props.saleResult.authorization_number || ''}</li>
                </ul>
              </div>
            </div>
            </div>
            <div style={{width: '100%', 'text-align': 'center'}}>
              <img src={this.props.company.company_logo_url} alt='Logo' style={{width: '200px'}}/>
            </div>
            <div className="col-12" style={divTableStyle}>
            <h1>FACTURA</h1>
            <div className="invoice__customer">
              <div className="invoice__customer-date">
                <div style={{marginRight:"150px"}}>
                  Lugar y Fecha: {this.props.company.city}, {this.props.company.country}, {new Date().toLocaleDateString()}
                </div>
                <div>
                  NIT/CI: {this.props.saleResult.invoice != undefined ? this.props.saleResult.invoice.customer_nit : '' }
                </div>
              </div>
              <div style={{paddingLeft: "3px"}}>
                Señor(es):  {this.props.clientName}
              </div>
            </div>
            </div>
            <div className="col-12">
              <table className="table">
                <thead style={{backgroundColor: 'black', color:'white'}}>
                  <tr>
                    <th scope="col" >Codigo</th>
                    <th scope="col" >Descripcion</th>
                    <th scope="col" >Cantidad</th>
                    <th scope="col" >Precio unitario</th>
                    <th scope="col" >Subtotal</th>
                  </tr>
                </thead>
                <tbody>
                {items_list}
                </tbody>
              </table>
            </div>

            <div style={{width: "100%", display: "flex"}}>
              <table style={{width: "100%", marginBottom: "10px"}}>
                <tbody style={{height: "30px", border: "1px solid black", borderRadius: "6px"}}>
                  <tr>
                    <th>Son</th>
                    <td>{this.props.saleResult.total_amount_words || ''} Bolivianos</td>
                    <th style={{backgroundColor: "black", color: "white", textAlign: "center",}}>Total Bs</th>
                    <td>{this.props.saleResult.invoice != undefined ? this.props.saleResult.invoice.amount : '' }</td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div style={{display: "flex", justifyContent: "center", alignItems: "center", width: "100%"}}>
              <div style={{ marginRight: "43%"}}>
                <div style={{ border: "1px solid", borderRadius: "5px", width: "283px", height: "28px", padding: "5px"}}>
                  <b> Codigo de control </b> {this.props.saleResult.invoice != undefined ? this.props.saleResult.invoice.control_code : ''}
                </div>
                <div style={{ marginTop: "6px", border: "1px solid", borderRadius: "5px", height: "28px", padding: "5px"}}>
                  <b> Fecha limite emision </b> {new Date().toLocaleDateString()}
                </div>
              </div>
              <QRCode value={this.props.saleResult.qr_code_text || ''} />
            </div>
          </div>
        </div>

        <div className="modal-footer">
            <button type="submit" className="btn btn-success" onClick={() => this.FinishSale()}>Finalizar</button>
            <a className="btn btn-success" target="_blank" href={ this.props.saleResult.invoice != undefined ?  '/invoices/generate_invoice/'+this.props.saleResult.invoice.id+'.pdf' : ''} > Exportar a Pdf</a>
        </div>
      </div>

      
  )
  }

  
}

function mapDispatchToProps(dispatch) {
  return {
      saleActions: bindActionCreators(saleActions, dispatch),
      actions: bindActionCreators(saleActions, dispatch)
  }
}


export default connect(null ,mapDispatchToProps)(Bill);