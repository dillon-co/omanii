// import React from 'react'
// import ReactDOM from 'react-dom'
// import PropTypes from 'prop-types'
// import ReactModal from 'react-modal'
//
// // ReactModal.setAppElement('');
//
// class FriendModal extends React.Component {
//   constructor () {
//     super();
//     this.state = {
//       friends: [],
//       showModal: false
//     };
//
//     this.handleOpenModal = this.handleOpenModal.bind(this);
//     this.handleCloseModal = this.handleCloseModal.bind(this);
//     this.getAllFriends = this.getAllFriends.bind(this);
//   }
//
//   getAllFriends(){
//     const url = '/friends/index'
//     fetch(url)
//      .then(response => {
//        if (response.ok) {
//           return response.json();
//        }
//        throw new Error("Network response was not ok.");
//      })
//      .then(response => this.setState({friends: response}));
//
//   }
//
//   handleOpenModal () {
//     this.setState({ showModal: true });
//   }
//
//   handleCloseModal () {
//     this.setState({ showModal: false });
//   }
//
//   render () {
//     return (
//       <div>
//         <button onClick={this.handleOpenModal} className='btn btn-primary btn-outline'>Show Friends</button>
//         <ReactModal
//            isOpen={this.state.showModal}
//            contentLabel="Minimal Modal Example"
//         >
//           <button onClick={this.handleCloseModal} className='btn-primary'>Hide</button>
//           <div>{this.state.friends}</div>
//         </ReactModal>
//       </div>
//     );
//   }
// }
// document.addEventListener("DOMContentLoaded", () => {
//   ReactDOM.render(
//     <FriendModal />,
//     document.body.appendChild(document.createElement("div"))
//   );
// });
