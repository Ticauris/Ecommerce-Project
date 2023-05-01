import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { Link } from "react-router-dom";
import { Col, Row, Badge, Button } from "react-bootstrap";
import AddToCartButton from "./AddToCartButton";
import "./list_products.css";

function ProductDetailScreen(props) {
  const { id } = useParams();
  const [product, setProduct] = useState({});
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  const handleAddToCart = (productId) => {
    props.addItem(productId);
  };

  useEffect(() => {
    setIsLoading(true);
    setError(null);

    fetch(`http://localhost:5000/products/${id}`)
      .then((response) => {
        if (!response.ok) {
          throw new Error("Failed to fetch product details");
        }
        return response.json();
      })
      .then((data) => {
        setProduct(data);
        setIsLoading(false);
      })
      .catch((error) => {
        setError(error);
        setIsLoading(false);
      });
  }, [id]);

  if (isLoading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>{error.message}</p>;
  }

  return (
    <div className="product-detail-screen">
      <h1>{product.var_name}</h1>
      <Link to={`/products/${product.id}`}>
        <img className="prod_image" src={product.prod_image} alt={product.id} />
      </Link>
      <p>${product.price}</p>
      <p>{product.var_description}</p>
      <Row>
        <Col className="my-2">
          {product.quantity > 0 ? (
            <Badge bg="success">In Stock</Badge>
          ) : (
            <Badge bg="danger">Unavailable</Badge>
          )}
        </Col>
      </Row>
      <AddToCartButton addItem={handleAddToCart} productId={product.id} />
      <Link to="/CustomerCart">
        <Button>View Cart</Button>
      </Link>
    </div>
  );
}

export default ProductDetailScreen;
