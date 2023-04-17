import React, { useState, useEffect } from "react";

function Products() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    fetch("http://localhost:5000/products")
      .then((response) => response.json())
      .then((data) => setProducts(data));
  }, []);

  return (
    <div>
      {products.map((product) => (
        <div key={product.id}>
          <img src={product.prod_image} alt={product.id} />=
          <p>{product.quantity}</p>
          <p>{product.store_id}</p>
          <p>{product.var_id}</p>
        </div>
      ))}
    </div>
  );
}

export default Products;
