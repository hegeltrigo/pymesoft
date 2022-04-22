import { ItemEndpoints } from "../../api/itemEndpoints";
import { CustomerEndpoints } from "../../api/customerEndpoints";
import { SalesEndpoints } from "../../api/saleEndpoints";

import { saleTypes} from '../types'



export const GetAllItems = () => {
  return (dispatch) => {
      dispatch(isLoadingItems())
      ItemEndpoints.getAllItems().then(res => {
          console.log("esto devolvio", res)
          return dispatch(GetAllItemsSuccess(res.data));
      }).catch((e) => {
        return dispatch(getAllItemsFailure(e));
      })
  }
}

const GetAllItemsSuccess = (items) => {return { type: saleTypes.GET_ALL_ITEMS_SUCCESS, items }}
const isLoadingItems = () =>{ return { type: saleTypes.IS_LOADING_GET_ALL_ITEMS, loading: true } }
const getAllItemsFailure = (errorMessage)=> { return { type: saleTypes.GET_ALL_ITEMS_ERROR, errorMessage } }


// Search  Items
export const searchItems = (text) => {
  return (dispatch) => {
    dispatch(isLoadingSearchItems())
    ItemEndpoints.searchItems(text).then(res => {
        return dispatch(searchItemsSuccess(res.data));
    }).catch((e) => {
      return dispatch(searchItemsError(e));
    })
  }
}

const searchItemsSuccess = (items) => {return { type: saleTypes.SEARCH_ITEMS_SUCCESS, items }}
const isLoadingSearchItems = () =>{ return { type: saleTypes.IS_LOADING_SEARCH_ITEMS, loading: true } }
const searchItemsError = (errorMessage)=> { return { type: saleTypes.SEARCH_ITEMS_ERROR, errorMessage } }
const updateSaleResult = (saleResult) => { return { type: saleTypes.UPDATE_SALE_RESULT, saleResult } }

// Search customers
export const searchCustomers = (text) => {
  return (dispatch) => {
    dispatch(isLoadingSearchCustomers())
    CustomerEndpoints.searchCustomersOnSale(text).then(res => {
        return dispatch(searchCustomersSuccess(res.data));
    }).catch((e) => {
      return dispatch(searchCustomersError(e));
    })
  }
}

const searchCustomersSuccess = (customers) => {return { type: saleTypes.SEARCH_CUSTOMERS_SUCCESS, customers }}
const isLoadingSearchCustomers = () =>{ return { type: saleTypes.IS_LOADING_SEARCH_CUSTOMERS, loading: true } }
const searchCustomersError = (errorMessage)=> { return { type: saleTypes.SEARCH_CUSTOMERS_ERROR, errorMessage } }


// Select Customer  
export const selectCustomer = (customer) => {
  return (dispatch) => {
    dispatch(selectCustomerSuccess(customer));
  }
}

const selectCustomerSuccess = (customer) => {return { type: saleTypes.SELECT_CUSTOMER_SUCCESS, customer }}


// add line item  
export const addLineItem = (line_item, index) => {
  return (dispatch) => {
    dispatch(addLineItemSuccess(line_item));
  }
}

const addLineItemSuccess = (line_item) => {return { type: saleTypes.ADD_LINE_ITEM_SUCCESS, line_item }}
const sendSellSucess = (line_item) => { return {type: saleTypes.RESET_SALE_STATE}  }

// remove line item  
export const removeLineItem = (line_item, index) => {
  return (dispatch) => {
    dispatch(removeLineItemSuccess(line_item,index));
  }
}

//create Sale
export const createSale = (sale) =>{
  return(dispatch) => {
    console.log('La venta a crear es: ', sale)
    SalesEndpoints.createSale(generateSaleObject(sale)).then(response => {
      console.log('Esto llego', response)
      dispatch(updateSaleResult(response.data))
    })
  }
}

export const FinishSale = () => {
  return(dispatch) => {
    dispatch(sendSellSucess())
  }
}


const generateSaleObject = (sale) => {
  let saleObject = {}
  saleObject.customer_id = sale.customer.id
  saleObject.discount = 0
  saleObject.tax = 0
  saleObject.amount = parseFloat(sale.total)
  saleObject.total_amount = saleObject.amount - saleObject.discount - saleObject.tax
  saleObject.remaining_amount = 0
  saleObject.line_items = sale.line_items

  return {sale:saleObject}
}

const removeLineItemSuccess = (line_item,index) => {return { type: saleTypes.REMOVE_LINE_ITEM_SUCCESS, line_item, index }}
