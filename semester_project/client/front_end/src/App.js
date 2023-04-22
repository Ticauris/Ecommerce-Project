import React, { useState } from "react";
import HomeScreen from "./components/list_products";
import Login from "./components/LoginPage";
import { BrowserRouter, Routes, Route, Link } from "react-router-dom";
import ProductDetailScreen from "./components/ProductDetail";
import Cart from "./components/CustomerCart";
import { Navbar, Container } from "react-bootstrap";
import { LinkContainer } from "react-router-bootstrap";

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [customerID, setCustomerID] = useState("");

  const handleLogin = () => {
    setIsLoggedIn(true);
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
              <Route path="/" element={<HomeScreen isLoggedIn={isLoggedIn} />} />
              <Route path="/products/:id"element={<ProductDetailScreen addItem={Cart.addItem} />}/>
              <Route path="/login" element={<Login handleLogin={handleLogin} />} />
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


/* <Route path="/products/:id" element={<ProductDetailScreen />} /> */
