import {HttpClient} from './httpClient' 
import { authHeader } from '../helpers'

// This is the API. The backend root URL can be set from here.
const API = '/api/v1'

//Setting the todos URI
const ITEMS_API = `${API}/items`

// The CRUD Operations of the Todo Resource.


//Create
const createItem = item => {
    return HttpClient.post(`${ITEMS_API}`, item, { headers: authHeader() })
}

//Read
const getItem = (id) => {
    return HttpClient.get(`${ITEMS_API}/${id}`, { headers: authHeader() })
}

const getAllItems = () => {
  return HttpClient.get(`${ITEMS_API}`)
}

const searchItems = (text) => {
  return HttpClient.get(`${ITEMS_API}?q[name_cont]=${text}`)

}

//Update
const updateItem = item => {
    return HttpClient.put(`${ITEMS_API}/${video.id}`, item, { headers: authHeader() })
}

//Delete
const removeItem = id => {
    return HttpClient.delete(`${ITEMS_API}/${id}`, { headers: authHeader() })
}

//Encapsulating in a JSON object

// const TodoApi = {createTodo, getTodo, updateTodo, removeTodo}
const ItemEndpoints = { getAllItems, createItem, removeItem, getItem, updateItem, searchItems }
export {ItemEndpoints}