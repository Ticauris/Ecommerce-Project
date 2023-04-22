import React, { useState } from "react";
import Login from "./LoginPage";

function Cart(props) { // Add props as a parameter
  const [items, setItems] = useState([]);

  const addItem = async (id) => {
    try {
      const response = await fetch(`/product/${id}`);
      const product = await response.json();
      setItems([...items, product]);
    } catch (error) {
      console.error(error);
    }
  };

  const removeItem = (item) => {
    setItems(items.filter((i) => i !== item));
  };

  const totalPrice = () => {
    return items.reduce((total, item) => total + item.price, 0);
  };

  const handleCheckout = () => {
    fetch("http://localhost:5000/orders", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        customer_ID: props.customerID, // Access the customerID prop here
        order_date: new Date().toISOString(),
        order_total: totalPrice(),
        address_ID: 1, // Replace with actual address ID
        store_ID: items[0].store_ID, // Use the store_ID of the first item in the items array
        shipping_ID: 1, // Replace with actual shipping ID
        cart_ID: 1, // Replace with actual cart ID
        items: items
      })
    })
      .then((response) => {
        if (response.ok) {
          console.log("Order created successfully");
          // Do something else after the order is created
        } else {
          throw new Error("Error creating order");
        }
      })
      .catch((error) => {
        console.error(error);
      });
  };
  

  return (
    <div>
      <h2>Cart</h2>
      {items.length === 0 ? (
        <p>Your cart is empty</p>
      ) : (
        <ul>
          {items.map((item, index) => (
            <li key={index}>
              {item.var_name} - ${item.price}{" "}
              <button onClick={() => removeItem(item)}>Remove</button>
            </li>
          ))}
        </ul>
      )}
      <p>Total: ${totalPrice()}</p>
      <button disabled={items.length === 0} onClick={handleCheckout}>
        Checkout
      </button>
    </div>
  );
}

export default Cart;


