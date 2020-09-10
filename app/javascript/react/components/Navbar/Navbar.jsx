import React from 'react';

import Menu from '../Menu/Menu'
import { Link } from 'react-router-dom';

import logo from '../../assets/images/logo.png';

import './Navbar.css';

const Navbar = () => {
  return(
    <div class="navbar">
      <Link to="/"><img className="logo" src={logo} /></Link>
      <Menu />
    </div>
  )
}

export default Navbar;