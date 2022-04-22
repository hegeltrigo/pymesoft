import React, { PropTypes } from 'react';  
import { connect } from 'react-redux';  
import { push } from 'react-router-redux';

export default function (ComposedComponent) { 
   
  class Authenticate extends React.Component {

    componentDidMount() {
      this._checkAndRedirect();
    }

    componentDidUpdate() {
      this._checkAndRedirect();
    }

    _checkAndRedirect() {
      const { authentication, redirect } = this.props;

      if (!authentication) {
        redirect();
      }
    }

    render() {
      const { loggedIn } = this.props.authentication.loggedIn

      return (
        <div>
          { loggedIn ? <ComposedComponent {...this.props} /> : null }
        </div>
      );
    }
  }

  const mapStateToProps = ({ authentication }) => ({ authentication })
  
  const mapDispatchToProps = dispatch => bindActionCreators({
    redirect: () => push('/users/sign_in')
  }, dispatch)
  
  return connect(mapStateToProps, mapDispatchToProps)(Authenticate);
}
