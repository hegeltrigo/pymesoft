import { CustomerEndpoints } from "../../api/customerEndpoints";
import { customerTypes, saleTypes} from '../types'

export const GetAllCustomers = () => {
  return (dispatch) => {
    dispatch(isLoadingCustomers())
    CustomerEndpoints.getAllCustomers().then(res => {
      console.log('Clientes: ', res.data)
        return dispatch(GetAllCustomersSuccess(res.data));
    }).catch((e) => {
      return dispatch(getAllCustomersError(e));
    })
  }
}

const GetAllCustomersSuccess = (customers) => {return { type: saleTypes.GET_ALL_CUSTOMERS_SUCCESS, customers }}
const isLoadingCustomers = () =>{ return { type: customerTypes.IS_LOADING_GET_ALL_CUSTOMERS, loading: true } }
const getAllCustomersError = (errorMessage)=> { return { type: customerTypes.GET_ALL_CUSTOMERS_ERROR, errorMessage } }

//create customer
export const createCustomer = (customer) => {
  return (dispatch) => {
    dispatch(isLoadingCreateCustomer())
    CustomerEndpoints.createCustomer(customer).then(res => {
        dispatch(selectCustomerSuccess(res.data))
        dispatch(searchCustomersForSalesSuccess([res.data]))
        return dispatch(createCustomerSuccess(res.data));
    }).catch((e) => {
      return dispatch(createCustomerError(e));
    })
  }
}

const createCustomerSuccess = (customer) => {return { type: customerTypes.CREATE_CUSTOMER_SUCCESS, customer }}
const isLoadingCreateCustomer = () =>{ return { type: customerTypes.IS_LOADING_CREATE_CUSTOMER, loading: true } }
const createCustomerError = (errorMessage)=> { return { type: customerTypes.CREATE_CUSTOMER_ERROR, errorMessage } }


//update customer
export const updateCustomer = customer => {
  return (dispatch) => {
    dispatch(isLoadingUpdateCustomer())
    CustomerEndpoints.updateCustomer(customer).then(res => {
        return dispatch(updateCustomerSuccess(res.data));
    }).catch((e) => {
      return dispatch(updateCustomerError(e));
    })
  }
}

const updateCustomerSuccess = (customer) => {return { type: customerTypes.UPDATE_CUSTOMER_SUCCESS, customer }}
const isLoadingUpdateCustomer = () =>{ return { type: customerTypes.IS_LOADING_UPDATE_CUSTOMER, createLoading: true } }
const updateCustomerError = (errorMessage)=> { return { type: customerTypes.UPDATE_CUSTOMER_ERROR, errorMessage } }


export const replaceCustomer = index => {return { type: customerTypes.REPLACE_CUSTOMER, requiredItem: index }}


export const removeCustomer = (index,id) => {

  return (dispatch) => {
    dispatch(removeCustomerRequest())
    CustomerEndpoints.removeCustomer(id).then(res => {
        return dispatch(removeCustomerSuccess(res, index));
    }).catch((e) => {
      return dispatch(removeCustomerFailure(e));
    })
  }
}

const removeCustomerRequest = () => { return { type: customerTypes.REMOVE_CUSTOMER_REQUEST }}
const removeCustomerSuccess = (response, index) => { return { type: customerTypes.REMOVE_CUSTOMER_SUCCESS, response, index }}
const removeCustomerFailure = (errorMessage) => { return { type: customerTypes.REMOVE_CUSTOMER_FAILURE, errorMessage }}


// Search  
export const searchCustomers = (text) => {
  return (dispatch) => {
    dispatch(isLoadingSearchCustomers())
    CustomerEndpoints.searchCustomers(text).then(res => {
        return dispatch(searchCustomersSuccess(res.data));
    }).catch((e) => {
      return dispatch(searchCustomersError(e));
    })
  }
}

const searchCustomersSuccess = (customers) => {return { type: customerTypes.SEARCH_CUSTOMERS_SUCCESS, customers }}
const searchCustomersForSalesSuccess = (customers) => {return { type: saleTypes.SEARCH_CUSTOMERS_SUCCESS, customers }}
const isLoadingSearchCustomers = () =>{ return { type: customerTypes.IS_LOADING_SEARCH_CUSTOMERS, loading: true } }
const searchCustomersError = (errorMessage)=> { return { type: customerTypes.SEARCH_CUSTOMERS_ERROR, errorMessage } }


// Select Customer  
export const selectCustomer = (customer) => {
  return (dispatch) => {
    // dispatch(isLoadingSelectCustomer())
    dispatch(selectCustomerSuccess(customer));
    
  }
}

const selectCustomerSuccess = (customer) => {return { type: saleTypes.SELECT_CUSTOMER_SUCCESS, customer }}
// const isLoadingSearchCustomers = () =>{ return { type: customerTypes.IS_LOADING_SEARCH_CUSTOMERS, loading: true } }
