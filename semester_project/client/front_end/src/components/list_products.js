import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import "./list_products.css";

function HomeScreen() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    fetch("http://localhost:5000/products")
      .then((response) => response.json())
      .then((data) => setProducts(data));
  }, []);

  return (
    <div className="home-screen">
      <h1>Featured Items</h1>
      <div className="products">
        {products.map((product) => (
          <div className="product" key={product.id}>
            <Link to={`/products/${product.id}`}>
              <img
                className="prod_image"
                src={product.prod_image}
                alt={product.id}
              />
            </Link>
            <p>
              <strong>{product.var_name}</strong>
            </p>
            <p>${product.price}</p>
            <button>Add to Cart</button>
          </div>
        ))}
      </div>
    </div>
  );
}

export default HomeScreen;
