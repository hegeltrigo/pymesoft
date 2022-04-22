import {HttpClient} from './httpClient' 
import { authHeader } from '../helpers'
const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");
const URL = '/sales'

// The CRUD Operations of the Todo Resource.
const config = { headers: {'Authorization': authHeader(),'Accept': 'application/json', 'Content-Type': 'application/json', 'X-CSRF-Token': csrf} }


//Create
const createSale = sale => {
  return HttpClient.post(`${URL}`, sale, config)
  .then(saleCreated => {
    return saleCreated
  })
}


const SalesEndpoints = {createSale}
export {SalesEndpoints}