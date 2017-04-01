import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './index.css';

class Cart extends HTMLElement {
  attachedCallback() {
    ReactDOM.render(<App />, this.createShadowRoot());
  }
}
document.registerElement('microfrontends-cart', Cart);
