import React, { useState, useRef } from 'react';
import './Menu.scss';
import { Link } from 'react-router-dom';
import { CSSTransition } from 'react-transition-group';

const Menu = () => {
  const [visible, setVisible] = useState(false);
  const menuEl = useRef(null);

  const handleClick = () => {
    setVisible(visible => !visible);
    menuEl.current.classList.toggle('is-menu-open');
  }

  return (
    <div className="menu" onClick={handleClick}>
      <MenuIcon visible={visible} ref={menuEl} />
      <DropdownItems visible={visible}  />
    </div>
  )
}

const DropdownItems = ({visible, setVisible}) => {
  if (!visible) return null;

  return (
    <div className="elements">
      <div><Link to="/sign_in">Se connecter</Link></div>
      <div><Link to="/log_out">Se deconnecter</Link></div>
    </div>
  )
}

const MenuIcon = ({visible}) => {
  const burgerMenu = <i class={ !visible ? "visible fas fa-bars" : "invisible fas fa-bars"}></i>;
  const cross = (
      <i class="fas fa-times"></i>
  );

  return <div className="MenuIcon">
    {visible ? cross :  burgerMenu}
    </div>
}

export default Menu;