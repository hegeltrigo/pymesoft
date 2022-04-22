import { saleTypes } from '../types'


const initialStateSales = {
  items: [],
  customers: [],
  sale: {
          customer: {},
          line_items: [],
          total: parseFloat(0).toFixed(2)
        },
  loading: true,
  canSell: false,
  errorMessage: '',
  saleResult:{}
}

export const SaleReducer = (state = initialStateSales, action) => {
    let line_item;
    let tempLineItems;

    switch(action.type){
      
      case saleTypes.GET_ALL_ITEMS_SUCCESS:

        return {
          ...state,
          items: action.items,
          loading: false
        }

      case saleTypes.IS_LOADING_GET_ALL_ITEMS:
        return{
          ...state,
          loading: true
        }
      case saleTypes.GET_ALL_ITEMS_ERROR:
        return{
          ...state,
          loading: false,
          errorMessage: action.errorMessage
        }

      case saleTypes.SEARCH_ITEMS_SUCCESS:
        return {
          ...state,
          items: action.items,
          loading: false
        }
      case saleTypes.IS_LOADING_SEARCH_ITEMS:
        return{
          ...state,
          loading: true
        }
      case saleTypes.SEARCH_ITEMS_ERROR:
        return{
          ...state,
          loading: false,
          errorMessage: action.errorMessage
        }      
      /////////////////SEARCH/////////////////////////////  
      case saleTypes.SEARCH_CUSTOMERS_SUCCESS:
        return {
          ...state,
          customers: action.customers,
          sale: {
                  customer: (action.customers.length > 0) ? (action.customers.filter(customer => customer.id == state.sale.customer.id) ? state.sale.customer : {} ) : {},
                  line_items: state.sale.line_items,
                  total: state.sale.total
                },
          loading: false
        }
      case saleTypes.IS_LOADING_SEARCH_CUSTOMERS:
        return{
          ...state,
          loading: true
        }
      case saleTypes.SEARCH_CUSTOMERS_ERROR:
        return{
          ...state,
          loading: false,
          errorMessage: action.errorMessage
        } 
      /////////////SELECT CUSTOMER////////////////////////  
      case saleTypes.SELECT_CUSTOMER_SUCCESS:
        let tempCustomer = (state.sale.customer.id === action.customer.id) ? {} : action.customer
        return {
          ...state,
          sale: {customer: tempCustomer, line_items: state.sale.line_items, total: state.sale.total}
        }
      ////////////ADD LINE ITEM////////////////////////  
      case saleTypes.ADD_LINE_ITEM_SUCCESS:

        let item = action.line_item;
        line_item = {item_id: item.id, detail: item.name, quantity: 1, unit_price: parseFloat(item.price).toFixed(2), total_price: parseFloat(item.price).toFixed(2)}
        tempLineItems = state.sale.line_items;
    
        if(tempLineItems.find(x => x.item_id === item.id) == undefined){
          tempLineItems.push(line_item);
        }
        else{
          tempLineItems.find(x => x.item_id === item.id).quantity = parseInt(tempLineItems.find(x => x.item_id === item.id).quantity) + 1
          tempLineItems.find(x => x.item_id === item.id).total_price = parseFloat(tempLineItems.find(x => x.item_id === item.id).total_price) + parseFloat(tempLineItems.find(x => x.item_id === item.id).unit_price)
          tempLineItems.find(x => x.item_id === item.id).total_price = (tempLineItems.find(x => x.item_id === item.id).total_price).toFixed(2)
        }
        
        return {
          ...state,
          sale: {
                  customer: state.sale.customer,
                  line_items: tempLineItems,
                  total: (tempLineItems.reduce((prev, cur) => parseFloat(prev) + parseFloat(cur.total_price), 0)).toFixed(2)
                },
          canSell: ((tempLineItems.reduce((prev, cur) => parseFloat(prev) + parseFloat(cur.total_price), 0)).toFixed(2)) > 0     
        }  
      ////////////REMOVE LINE ITEM////////////////////////  
      case saleTypes.REMOVE_LINE_ITEM_SUCCESS:
      
        line_item = action.line_item;
        let index = action.index;
        tempLineItems = state.sale.line_items;
        if(parseInt(line_item.quantity) == 1){
          tempLineItems.splice(index, 1);
        }
        else{
          tempLineItems[index].quantity = parseInt(tempLineItems[index].quantity) - 1
          tempLineItems[index].total_price = parseFloat(tempLineItems[index].total_price) - parseFloat(tempLineItems[index].unit_price)
          tempLineItems[index].total_price = (tempLineItems[index].total_price).toFixed(2)
        }
        
        return {
          ...state,
          sale: {
                  customer: state.sale.customer,
                  line_items: tempLineItems,
                  total: (tempLineItems.reduce((prev, cur) => parseFloat(prev) + parseFloat(cur.total_price), 0)).toFixed(2)
                },
          canSell: ((tempLineItems.reduce((prev, cur) => parseFloat(prev) + parseFloat(cur.total_price), 0)).toFixed(2)) > 0     
        }
      ////////////RESET SALE STATE////////////////////////
      case saleTypes.RESET_SALE_STATE:
        console.log('El estado es: ', action.customers)
        initialStateSales.sale.line_items = []
        return initialStateSales
      
        case saleTypes.GET_ALL_CUSTOMERS_SUCCESS:
          return {
            ...state,
            customers: action.customers,
            loading: false
          }
        
        case saleTypes.UPDATE_SALE_RESULT:
          console.log('La accion',action);
          return {
            ...state,
            saleResult: action.saleResult,
            loading: false
          }

      default: 
        return state; 
    }
}