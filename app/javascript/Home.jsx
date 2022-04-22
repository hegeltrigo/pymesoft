import React, { Component } from 'react';

import ReactDOM from 'react-dom';
import App from './App';
import {BrowserRouter} from 'react-router-dom';
import {Provider} from 'react-redux'
// import * as serviceWorker from './serviceWorker';

import { configureStore } from './store/configureStore'
// import * as VideosActions from './store/actions/videosActions'


// Create a Store from the Configuration, we can pass a Initial State here

const store = configureStore()

// At first dispatch a Get Todos Actions, So we'll recieve the Todos 
// fetched from the server at the start of the app

// store.dispatch(VideosActions.GetAllVideos());

class Home extends Component{

  componentDidMount(){
  }

  render(){
    return(
      <Provider store={store}>
        <BrowserRouter>
          <App company={this.props.company} invoice={this.props.invoice}/>
        </BrowserRouter>
      </Provider>
    );
  }
}

export default Home;

