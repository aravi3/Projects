import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props) {
    super(props);
    this.personalGreeting = this.personalGreeting.bind(this);
    this.sessionLinks = this.sessionLinks.bind(this);
  }

  sessionLinks() {
    return (
      <div>
        <Link to="/login">Login</Link>
        &nbsp;
        <Link to="/signup">Sign Up</Link>
      </div>
    );
  }

  personalGreeting() {
    return (
      <div>
        <h2>Hi, {this.props.currentUser.username}</h2>
        <button onClick={this.props.logout}>Log Out</button>
      </div>
    );
  }

  render() {
    if (this.props.currentUser) {
      return this.personalGreeting(this.props.currentUser, this.props.logout);
    }
    else {
      return this.sessionLinks();
    }
  }
}

export default Greeting;
