import React from "react";
import HomeScreen from "./components/list_products";
import { BrowserRouter, Routes, Route, Link } from "react-router-dom";
import ProductDetailScreen from "./components/ProductDetail";
function App() {
  return (
    <BrowserRouter>
      <div>
        <header>
          <Link to="/">fake amazon</Link>
        </header>
        <main>
          <Routes>
            <Route path="/" element={<HomeScreen />} />
            <Route path="/products/:id" element={<ProductDetailScreen />} /> 
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  );
}

export default App;


/* <Route path="/products/:id" element={<ProductDetailScreen />} /> */