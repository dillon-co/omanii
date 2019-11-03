import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import 'react-phone-number-input/style.css'
import PhoneInput from 'react-phone-number-input'
import { isValidPhoneNumber } from 'react-phone-number-input'



class FriendForm extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      userLoggedIn: false,
      newFriends: [],
      // newFriends: [],
      // newFriends: [{first_name:'jane',number:'123456678'}],
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.addFriendsButton = this.addFriendsButton.bind(this);
    this.checkUserLoggedIn = this.checkUserLoggedIn.bind(this);
    this.saveNewFriends = this.saveNewFriends.bind(this);
  }



  checkUserLoggedIn(){
    // const url = 'api/v1/user_is_logged_in';
    const url = '/api/v1/users/user_is_logged_in'
    fetch(url)
     .then(response => {
       if (response.ok) {
        //  console.log(response.json())
         return response.json();
       }
       throw new Error("Network response was not ok.");
     })
     .then(response => this.setState({userLoggedIn: response}))
    //  console.log(isLoggedIn)
  }

  componentDidMount() {
    this.checkUserLoggedIn()
  }

  // componentDidUpdate() {
  //   this.checkUserLoggedIn()
  // }

  handleSubmit(event){
     event.preventDefault();
    //  console.log(this.refs.name.value)
    const {newFriends} = this.state
    const name=this.refs.name.value
    const phone=this.state.value
    if (isValidPhoneNumber(phone) === true){
      this.setState({newFriends:[...newFriends,{first_name:name, number:phone}]})
      this.refs.name.value=''
      this.refs.phone.value=''
    }else{
      alert("Please enter a valid phone number")
    }
    // console.log(this.state);
  }


  handleChange(event){
    this.checkUserLoggedIn()
    const target = event.target
    const value = target.value
    const name = target.name
    this.setState({[name]:value})
  }

  saveNewFriends(){
    const url = 'friends/create'
    const body = JSON.stringify(this.state.newFriends)
    const token = document.querySelector('meta[name="csrf-token"]').content;
    fetch(url,{
      method:"POST",
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json",
        'Accept': 'application/html'
      },
      // redirect: "profile",
      body: body
    })
      .then(response => {
          if (response.ok) {
            // console.log(response.json())
            // return response.json();
            window.location.assign('/profile')
          }
          throw new Error("Network response was not ok.");
      })
    }



  addFriendsButton(){
    // let redirectLink;
    // window.sessionStorage.setItem('new_friends', JSON.stringify(this.state.newFriends))
    // if (this.state.userLoggedIn){
    //   redirectLink = '/profile?new_friends='+JSON.stringify(this.state.newFriends)
    // }else {
    //   redirectLink = '/users/sign_up'
    // }
    return(
      <div className='col-md-6'>
        <button className='btn btn-outline-warning' onClick={()=>{this.saveNewFriends()}} href='/profile'>
          Save
        </button>
        {/* <a href={redirectLink} className='btn btn-outline-warning' >
        </a> */}
      </div>
      <div className='col-md-6 title'>
         <h5>(Add a few more) </h5>
      </div>
    )
  }

  noButton(){
    return(
      <div></div>
    )
  }



  render(){
    const friendsList = this.state.newFriends.length > 0
    const {newFriends} = this.state
    // this.checkUserLoggedIn();
    let addFriendsButton;

    if (friendsList){
      addFriendsButton = this.addFriendsButton()
    }
    // else {
    //   addFriendsButton = this.noButton()
    // }

    const allFriends = newFriends.map((friend, index) => (
      <div>
        <h3>{friend.first_name}: {friend.number}</h3>
      </div>
    ));

    const phoneInput = (
      <div className='col-sm-4'>
        {/* <input className='' type='tel' pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required ref='phone' placeholder='Phone Number'></input> */}
        <PhoneInput
          placeholder="Enter phone number"
          country="US"
          ref='phone'
          className='input home-input'
          value={ this.state.value }
          onChange={ value => this.setState({ value }) } />
      </div>
    );

    const nameInput = (
      <div className='col-sm-4 home-input'>
        <input className='' type='text' ref='name' placeholder='Friends First Name'></input>

      </div>
    );


    return(
      <>
      <div className='container'>
        <div >
          <div className='formGroup'>
            <form onSubmit={this.handleSubmit}>
            <div className='row'>
              {nameInput}
              {phoneInput}
              <button type="submit" className="btn btn-primary" id='addFriend'>Add friend</button>
            </div>
            </form>
          </div>
          <br/>
          {addFriendsButton}
          <br/>
          {allFriends}
        </div>

        {/* TODO Add a button to submit all friends as a users new friends  */}
      </div>
    </>
    )
  }
}
document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <FriendForm />,
    document.body.appendChild(document.createElement("div"))
  );
});
