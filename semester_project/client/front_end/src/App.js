import React from "react";
import ProductList from "./components/ProductList";

function App() {
  return (
    <div>
      <header>
        <a href = "/">fake amazon</a>
      </header>
      <main>
        <h1>Featured Items</h1>
         <ProductList/> 
      </main>
    </div>
  );
}

export default App;
