import React from "react";
import { Button } from "react-bootstrap";

function AddToCartButton(props) {
  return (
    <Button onClick={props.onClick}>Add to Cart</Button>
  );
}

export default AddToCartButton;
