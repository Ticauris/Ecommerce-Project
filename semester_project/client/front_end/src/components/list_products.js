import React, { useState, useEffect } from "react";
import index 

function Products() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    fetch("http://localhost:5000/products")
      .then((response) => response.json())
      .then((data) => setProducts(data));
  }, []);

  return (
    <div className="products">
      {products.map((product) => (
        <div className="products" key={product.id}>
          <img src={product.prod_image} alt={product.id} />
          <p>{product.var_name}</p>
          <p>{product.price}</p>
        </div>
      ))}
    </div>
  );
}

export default Products;
