import React, { useState } from "react";
import HomeScreen from "./components/list_products";
import Login from "./components/LoginPage";
import { BrowserRouter, Routes, Route, Link } from "react-router-dom";
import ProductDetailScreen from "./components/ProductDetail";
import Cart from "./components/CustomerCart";
import { Navbar, Container } from "react-bootstrap";
import { LinkContainer } from "react-router-bootstrap";
import AddToCartButton from "./components/AddToCartButton";


function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [customerID, setCustomerID] = useState("");

  const handleLogin = () => {
    setIsLoggedIn(true);
  };

  const [items, setItems] = useState([]);

  const addItem = async (productID) => {
    try {
      const response = await fetch(`/cart_product/${productID}`);
      const product = await response.json();
      setItems([items, product]);
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <BrowserRouter>
      <div className="d-flex flex-column site-container">
        <header>
          <Navbar bg="dark" variant="dark">
            <Container>
              <LinkContainer to="/">
                <Navbar.Brand>fake amazon</Navbar.Brand>
              </LinkContainer>
            </Container>
          </Navbar>
        </header>
        <main>
          <Container>
            <Routes>
              <Route
                path="/"
                element={<HomeScreen isLoggedIn={isLoggedIn} />}
              />
              <Route
                path="/products/:id"
                element={<ProductDetailScreen addItem={AddToCartButton} />}
              />
              <Route
                path="/login"
                element={<Login handleLogin={handleLogin} />}
              />
              <Route path="/cart" element={<Cart customerID={customerID} />} />
            </Routes>
            <div className="text-center">
              {isLoggedIn ? (
                <Link to="/cart">View Cart</Link>
              ) : (
                <Link to="/login">Log in</Link>
              )}
            </div>
          </Container>
        </main>
        <footer>
          <div className="text-center">All rights reserved</div>
        </footer>
      </div>
    </BrowserRouter>
  );
}

export default App;
