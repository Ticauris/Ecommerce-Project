import React from "react";
import HomeScreen from "./components/list_products";
import Login from "./components/LoginPage";
import { BrowserRouter, Routes, Route, Link } from "react-router-dom";
import ProductDetailScreen from "./components/ProductDetail";
import { Navbar, Container } from "react-bootstrap";
import { LinkContainer } from "react-router-bootstrap";

function App() {
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
              <Route path="/" element={<HomeScreen />} />
              <Route path="/products/:id" element={<ProductDetailScreen />} />
              <Route path="/login" element={<Login />} />
            </Routes>
            <div className="text-center">
              <Link to="/login">Log in</Link>
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
