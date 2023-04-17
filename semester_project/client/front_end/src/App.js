import React from "react";
import Products from "./components/list_products";

function App() {
  return (
    <div>
      <header>
        <a href="/">fake amazon</a>
      </header>
      <main>
        <h1>Featured Items</h1>
        <Products/>
      </main>
    </div>
  );
}

export default App;
