import React, {Component} from 'react';
import CustomerForm from './CustomerForm';


class Modal extends Component{

  constructor(props){
    super(props);
  }

  render(){
    return(

      <div className="modal fade" id={this.props.modalId} tabIndex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div className="modal-dialog modal-lg" role="document">
          <div className="modal-content">
            <div className="modal-header">
              <h5 className="modal-title" id="exampleModalLabel">{this.props.title}</h5>
              <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div className="modal-body">
              <CustomerForm closeModal={this.props.closeModal} action={this.props.action} item={this.props.data}/>
            </div>

          </div>
        </div>
      </div>

    );
  }
}

export default Modal;
