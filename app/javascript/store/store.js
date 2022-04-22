import { createStore } from 'redux';

const reducer = (state, action) => {
  console.log(state);
  if(action.type == "ADD_TO_CUSTOMER_LIST"){
    return {
      ...state,
      customers: [...state.customers, action.customer]
    }
  }
  if(action.type == "LOAD_CUSTOMER_LIST"){
    return {
      ...state,
      customers: action.customers
    }
  }

  if(action.type == "REPLACE_CUSTOMER_INDEX"){
    return {
      ...state,
      requiredItem: action.requiredItem
    }
  }

  if(action.type == "EDIT_CUSTOMER"){
    const requiredItem = state.requiredItem;
    let tempCustomers = state.customers;
    tempCustomers[requiredItem] = action.customer;

    return {
      ...state,
      customers: tempCustomers
    }
  }
  if(action.type == "DELETE_CUSTOMER"){
    let mytempCustomers = state.customers;
    mytempCustomers.splice(action.index, 1);
    return{
      ...state,
      customers: mytempCustomers
    }
  }

  return state;
};


export default createStore(reducer, { customers: [], requiredItem: 0 });
