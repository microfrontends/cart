import React, { Component } from 'react';

export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
  }

  componentDidMount() {
    window.addEventListener('addToCart', (event) => {
      this.setState({ products: [...this.state.products, event.detail] });
    }, false);
  }

  render () {
    return (
      <sidebar>
        <h2>Cart</h2>
        { this.renderProducts() }
      </sidebar>
    );
  }

  renderProducts () {
    if (this.state.products.length === 0) {
      return <p>Your cart is empty</p>;
    }
    return <ul>{ this.state.products.map(this.renderProduct) }</ul>;
  }

  renderProduct (product, index) {
    return <li key={index}>{ product.product } - ${ product.price }</li>;
  }
}
