import { ItemEndpoints } from "../../api/itemEndpoints";
import { itemTypes} from '../types'

export const GetAllItems = () => {
    return (dispatch) => {
        dispatch(isLoadingItems())
        ItemEndpoints.getAllItems().then(res => {
            console.log('entro en items')
            return dispatch(GetAllItemsSuccess(res.data));
        }).catch((e) => {
          return dispatch(getAllItemsFailure(e));
        })
    }
}

const GetAllItemsSuccess = (items) => {return { type: itemTypes.GET_ALL_ITEMS_SUCCESS, items }}
const isLoadingItems = () =>{ return { type: itemTypes.IS_LOADING_GET_ALL_ITEMS, loading: true } }
const getAllItemsFailure = (errorMessage)=> { return { type: itemTypes.GET_ALL_ITEMS_ERROR, errorMessage } }

// Search  
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

const searchItemsSuccess = (items) => {return { type: itemTypes.SEARCH_ITEMS_SUCCESS, items }}
const isLoadingSearchItems = () =>{ return { type: itemTypes.IS_LOADING_SEARCH_ITEMS, loading: true } }
const searchItemsError = (errorMessage)=> { return { type: itemTypes.SEARCH_ITEMS_ERROR, errorMessage } }
