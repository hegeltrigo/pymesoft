import React, {Component} from 'react';
import Auxiliar from './../../hoc/Auxiliar';


const Modal = (props) => (
  <Auxiliar>
    
    <div className="modal fade" id={props.modalId} tabIndex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div className="modal-dialog modal-lg" role="document">
        <div className="modal-content">
          <div className="modal-header">
            <h5 className="modal-title" id="exampleModalLabel">{props.title}</h5>
            <button type="button" className="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div className="modal-body">
            {props.children}
          </div>

        </div>
      </div>
    </div>

  </Auxiliar>
 
)


export default Modal;
