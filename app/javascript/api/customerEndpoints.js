import {HttpClient} from './httpClient' 
import { authHeader } from '../helpers'
import { selectCustomer} from '../store/actions/saleActions'
const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");
// This is the API. The backend root URL can be set from here.
const API = '/api/v1'

//Setting the todos URI
const CUSTOMERS_API = `${API}/customers`

// The CRUD Operations of the Todo Resource.
const config = { headers: {'Authorization': authHeader(),'Accept': 'application/json', 'Content-Type': 'application/json', 'X-CSRF-Token': csrf} }

//Create
const createCustomer = customer => {
    return HttpClient.post(`${CUSTOMERS_API}`, customer, config)
    .then(customerCreated => {
      selectCustomer(customerCreated)
      return customerCreated
    })
}

//Read
const getCustomer = (id) => {
    return HttpClient.get(`${CUSTOMERS_API}/${id}`, config)
}

const getAllCustomers = () => {
  return HttpClient.get(`${CUSTOMERS_API}`, config)
}

const searchCustomers = (text) => {
  return HttpClient.get(`${CUSTOMERS_API}?q[first_name_cont]=${text}`, config)

}

const searchCustomersOnSale = (text) => {
  return HttpClient.get(`${CUSTOMERS_API}?q[first_name_or_last_name_or_nit_or_number_id_cont]=${text}&limit=5`, config)

}

//Update
const updateCustomer = customer => {
    return HttpClient.put(`${CUSTOMERS_API}/${customer.id}`, customer, config)
}

//Delete
const removeCustomer = id => {
    return HttpClient.delete(`${CUSTOMERS_API}/${id}`, config)
}

//Encapsulating in a JSON object

// const TodoApi = {createTodo, getTodo, updateTodo, removeTodo}
const CustomerEndpoints = { getAllCustomers, searchCustomersOnSale, createCustomer, removeCustomer, getCustomer, updateCustomer, searchCustomers }
export {CustomerEndpoints}