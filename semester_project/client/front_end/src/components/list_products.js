import React, { useState, useEffect } from "react";

function ProductList() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    async function fetchProducts() {
      const response = await fetch("/product");
      const data = await response.json();
      setProducts(data);
    }
    fetchProducts();
  }, []);

  return (
    <div>
      {products.map((product) => (
        <div key={"product.product_id"}>
          <h3>{product.quantity}</h3>
          <p>{product.store_ID}</p>
          <p>{product.var_ID}</p>
          <p>{product.prod_image}</p>
        </div>
      ))}
    </div>
  );
}

export default ProductList;

