// app/javascript/quotes/components/App.jsx
import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Dashboard from './components/customers/Dashboard';
import CustomerForm from './components/customers/CustomerForm';
import CustomersList from './components/customers/CustomersList';
import NewSale from './components/sales/NewSale';


class App extends Component{

  render(){
    return(
      <Router>
        <div>
          <Route exact path='/' render={()=><Dashboard company={this.props.company} invoice={this.props.invoice}/>} />
          <Route exact path='/customers/new' render={()=><CustomerForm/>}/>
          <Route exact path='/customers' render={()=><CustomersList/>}/>
          <Route exact path='/sales/new' render={()=><NewSale company={this.props.company}/>}/>

        </div>

      </Router>
    );
  }
}

export default App;
