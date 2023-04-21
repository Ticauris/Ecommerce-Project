import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import "./list_products.css";
import { Row, Col, Button, Card, Badge } from "react-bootstrap";
import Login from "./LoginPage";

function HomeScreen() {
  const [products, setProducts] = useState([]);
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    fetch("http://localhost:5000/products")
      .then((response) => response.json())
      .then((data) => setProducts(data));
  }, []);

  const handleLogin = () => {
    setIsLoggedIn(true);
  };

  return (
    <Card className="home-screen">
          <h1>Featured Items</h1>
          <div className="products">
            <Row>
              {products.map((product) => (
                <Col sm={6} md={4} lg={3} className="mb-1" key={product.id}>
                  <Card.Body className="product">
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
                    <Col className="my-2">
                      {product.quantity > 0 ? (
                        <Badge bg="success">In Stock</Badge>
                      ) : (
                        <Badge bg="danger">Unavailable</Badge>
                      )}
                    </Col>
                    <Button>Add to Cart</Button>
                  </Card.Body>
                </Col>
              ))}
            </Row>
          </div>
    </Card>
  );
}

export default HomeScreen;
