import { itemTypes } from '../types'


const initialStateItems = {
  items: [],
  loading: true,
  errorMessage: ''
}

export const ItemListReducer = (state = initialStateItems, action) => {
    switch(action.type){

      case itemTypes.GET_ALL_ITEMS_SUCCESS:
        return {
          ...state,
          items: action.items,
          loading: false
        }

      case itemTypes.IS_LOADING_GET_ALL_ITEMS:
        return{
          ...state,
          loading: true
        }
      case itemTypes.GET_ALL_ITEMS_ERROR:
        return{
          ...state,
          loading: false,
          errorMessage: action.errorMessage
        }
      case itemTypes.SEARCH_ITEMS_SUCCESS:
        return {
          ...state,
          items: action.items,
          loading: false
        }
      case itemTypes.IS_LOADING_SEARCH_ITEMS:
        return{
          ...state,
          loading: true
        }
      case itemTypes.SEARCH_ITEMS_ERROR:
        return{
          ...state,
          loading: false,
          errorMessage: action.errorMessage
        }      
      default: 
        return state; 
    }
}