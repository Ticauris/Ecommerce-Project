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
          <p>{product.var_name}</p>
          <img src={product.prod_image} alt={product.id} />
          ''
        </div>
      ))}
    </div>
  );
}

export default Products;
