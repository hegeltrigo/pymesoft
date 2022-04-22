import { customerTypes } from '../types'


const initialStateCustomers = {
  customers: [],
  loading: false,
  errorMessage: '',
  createLoading: false,
  requiredItem: -1,
  close: false
}

export const CustomerListReducer = (state = initialStateCustomers, action) => {
    switch(action.type){
      ///////////////GET ALL CUSTOMERS//////////////////////////////////
      case customerTypes.GET_ALL_CUSTOMERS_SUCCESS:
        return {
          ...state,
          customers: action.customers,
          loading: false
        }

      case customerTypes.IS_LOADING_GET_ALL_CUSTOMERS:
        return{
          ...state,
          loading: true
        }
      case customerTypes.GET_ALL_CUSTOMERS_ERROR:
        return{
          ...state,
          loading: false,
          errorMessage: action.errorMessage
        }
      /////////////////CREATE//////////////////////////////////
      case customerTypes.CREATE_CUSTOMER_SUCCESS:
        
        return {
          ...state,
          customers: [...state.customers, action.customer],
          createLoading: false,
          close: true
        }

      case customerTypes.IS_LOADING_CREATE_CUSTOMER:
        return{
          ...state,
          createLoading: true,
          close: false
        }
      case customerTypes.CREATE_CUSTOMER_ERROR:
        return{
          ...state,
          createLoading: false,
          errorMessage: action.errorMessage,
          close: false
        }
      //////////////////UPDATE///////////////////////////  
      case customerTypes.UPDATE_CUSTOMER_SUCCESS:
        
        return {
          ...state,
          customers: [...state.customers.slice(0, state.requiredItem),action.customer,...state.customers.slice(state.requiredItem + 1)],
          createLoading: false,
          close: true
        }

      case customerTypes.IS_LOADING_UPDATE_CUSTOMER:
        return{
          ...state,
          createLoading: true
        }
      case customerTypes.UPDATE_CUSTOMER_ERROR:
        return{
          ...state,
          createLoading: false,
          errorMessage: action.errorMessage
        }
      //////////////////REPLACE///////////////////////////  
      case customerTypes.REPLACE_CUSTOMER:
        console.log('Llame al Replace Customer')  
        return{
          ...state,
          requiredItem: action.requiredItem,
          close: false
        }           
      //////////////////REMOVE/////////////////////////////  
      case customerTypes.REMOVE_CUSTOMER_SUCCESS:
        return{
          ...state,
          customers: [...state.customers.slice(0, action.index),...state.customers.slice(action.index + 1)]
        }
      case customerTypes.REMOVE_CUSTOMER_REQUEST:
        
        return{
          ...state
        }
      case customerTypes.REMOVE_CUSTOMER_FAILURE:
        
        return{
          ...state
        }
      /////////////////SEARCH/////////////////////////////  
      case customerTypes.SEARCH_CUSTOMERS_SUCCESS:
        return {
          ...state,
          customers: action.customers,
          loading: false
        }
      case customerTypes.IS_LOADING_SEARCH_CUSTOMERS:
        return{
          ...state,
          loading: true
        }
      case customerTypes.SEARCH_CUSTOMERS_ERROR:
        return{
          ...state,
          loading: false,
          errorMessage: action.errorMessage
        }
        
      case customerTypes.SELECT_CUSTOMER:
        return {
          ...state,
          sale: {customer: action.customer, line_items: state.sale.line_items, total: state.sale.total}
        }
      
      default: 
        return state; 
    }
}