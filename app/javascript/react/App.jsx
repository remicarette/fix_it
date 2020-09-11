import React from 'react';

import { BrowserRouter as Router, Switch, Route, Link, Redirect } from 'react-router-dom';
import HomePage from './pages/HomePage';
import SignInPage from './pages/SignInPage';
import SignUpPage from './pages/SignUpPage';
import LogOutPage from './pages/LogOutPage';
import JobbersIndexPage from './pages/JobbersIndexPage';
import JobbersShowPage from './pages/JobbersShowPage';
import Navbar from './components/Navbar/Navbar';


const ProtectedRoute = ({ Co}) => {
  return(
    <div>

    </div>
  )
}



const App = () => {

  return(
    <Router>
      <Navbar />
      hello
      <Switch>
        <Route path="/" exact><HomePage /></Route>
        <Route path="/sign_in" exact><SignInPage /></Route>
        <Route path="/sign_up" exact><SignUpPage /></Route>
        <Route path="/log_out" exact><LogOutPage /></Route>
        <Route path="/jobbers" exact><JobbersIndexPage /></Route>
        <Route path="/jobbers/:id" exact><JobbersShowPage></JobbersShowPage></Route>
      </Switch>
    </Router>
  )
}




// const ProtectedRoute = ({ component: Component, isAuth: isAuth, ...rest }) => {
//   return (
//     isAuth ? <Route {...rest} component={Component} ></Route> : <Redirect to={{ pathname: '/' }} />
//   )
// }



export default App;

// React Routes

// sign_in
// sign_up
// log_out
// jobbers       => authenticated routes
// jobbers/:id   => authenticated routes

// Api Routes

// CRUD on api/v1/jobbers
// CRUD on api/v1/users


  // namespace :admin do
  //   resources :users
  //   resources :bookings
  //   resources :equipements
  //   resources :messages
  //   resources :reviews
  //   resources :skills

  //   root to: "users#index"
  // end

  // namespace :pro do
  //   resources :bookings, only: [:index, :show, :update]
  //   patch 'bookings/:id/reset', to:'bookings#reset', as: "booking_reset"
  //   delete 'bookings/:id/delete_message', to:'messages#destroy_all', as: "destroy_messages"
  // end

  // devise_for :users

  // root to: 'pages#home'

  // resources :user, only: [] do
  //   resources :messages, only: :create
  //   resources :bookings, only: :create
  // end

  // # INDEX PRO => "/profiles"
  // # SHOW PRO => "/profiles/:id"

  // resources :profiles, only: [ :index, :show ] do

  //   # CREATE BOOKING => "/profiles/:id"
  //   resource :bookings, only: :create
  // end

  // # SHOW BOOKINGS => "/bookings/:id"

  // resources :bookings, only: :show do

  //   # CREATE REVIEW => /bookings/:id/reviews
  //   resources :reviews, only: :create
  // end

  // # CANCEL BOOKING => /bookings/:id/cancel
  // patch 'bookings/:id/cancel', to: 'bookings#cancel', as: :cancel_booking

  // # UPDATE BOOKING => /bookings/:id/edit
  // resource :bookings, only: :update
