import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class AllFriends extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      friends: [],
      bestFriends: []
    }
    this.getBestFriends = this.getBestFriends.bind(this);
    this.getAllFriends  = this.getAllFriends.bind(this);
  }

  componentDidMount(){
    this.getAllFriends();

  }

  getBestFriends(){
    const url = '/friends/best_friends'
    etch(url)
     .then(response => {
       if (response.ok) {
          return response.json();
       }
       throw new Error("Network response was not ok.");
     })
     .then(response => this.setState({bestFriends: response}));
  }

  getAllFriends(){
    const url = '/friends/index'
    fetch(url)
     .then(response => {
       if (response.ok) {
          return response.json();
       }
       throw new Error("Network response was not ok.");
     })
     .then(response => this.setState({friends: response}));

  }

  render(){
    // console.log(this.state.friends);
    const {friends} = this.state;

    const allFriends = friends.map((friend, index) => (
      <div>
        <h3>{friend.first_name}: {friend.number}</h3>
      </div>
    ));
    return(
      <div className="container">
        <h1>{allFriends}</h1>
      </div>
    )
  }
}

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <AllFriends />,
    document.body.appendChild(document.createElement("div"))
  );
});
