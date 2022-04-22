import {combineReducers} from 'redux'
import { ItemListReducer } from './itemReducers'
import { CustomerListReducer } from './customerReducers'
import { SaleReducer } from './saleReducers'


//One root reducer for the whole app. This is done so that the app will have one single reducer to manage lots of other resources.
// And also communication between the reducers will be easier to maintain.
 
const rootReducer = combineReducers({
    ItemListReducer,
    CustomerListReducer,
    SaleReducer
    // MyVideoList,
    // authentication
})

export default rootReducer;