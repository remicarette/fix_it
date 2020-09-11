// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import App from '../react/App';

import { Provider } from 'react-redux';
import { createStore, combineReducers } from 'redux';

import clickedReducer from '../react/reducers/clickedReducer';

const reducers = combineReducers({
  clicked: clickedReducer
});


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={createStore(reducers)}>
      <App />
    </Provider>,
    document.body.appendChild(document.createElement('div')),
  )
})
