import React, { useState } from "react";
//import { Button, Card, Col, Row,  } from "react-bootstrap";
import ProductDetail from "./ProductDetail";
import AddToCartButton from "./AddToCartButton";

function Cart(props) {
  // Add props as a parameter
  const [items, setItems] = useState([]);
  const [address, setAddress] = useState(null); // Add state variable for address
  const [unitNum, setUnitNum] = useState("");
  const [streetNum, setStreetNum] = useState("");
  const [addressLine1, setAddressLine1] = useState("");
  const [city, setCity] = useState("");
  const [state, setState] = useState("");
  const [zipCode, setZipCode] = useState("");

  const addItem = async (productID) => {
    try {
      const response = await fetch(`/cart_product/${productID}`);
      const product = await response.json();
      console.log(response)
      setItems([...items, product]); //... updates items state to include new products
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

  const handleCheckout = async () => {
    try {
      // Create a new address
      const response = await fetch("http://localhost:5000/address", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          unit_num: unitNum,
          street_num: streetNum,
          address_line_1: addressLine1,
          city: city,
          state: state,
          zip_code: zipCode,
        }),
      });

      const newAddress = await response.json();
      setAddress(newAddress); // Set the newly created address

      const orderResponse = fetch("http://localhost:5000/orders", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          customer_ID: props.customerID,
          order_date: new Date().toISOString(),
          order_total: totalPrice(),
          address_ID: newAddress.id, // Use the newly created address ID
          store_ID: items[0].store_ID,
          shipping_ID: 1,
          items: items,
        }),
      });
      if (orderResponse.ok) {
        console.log("Order created successfully");
        // Do something else after the order is created
      } else {
        throw new Error("Error creating order");
      }
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <div>
      <h2>Cart</h2>
      <div>
        <label htmlFor="unitNum">Unit Number:</label>
        <input
          type="text"
          id="unitNum"
          value={unitNum}
          onChange={(e) => setUnitNum(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="streetNum">Street Number:</label>
        <input
          type="text"
          id="streetNum"
          value={streetNum}
          onChange={(e) => setStreetNum(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="addressLine1">Address Line 1:</label>
        <input
          type="text"
          id="addressLine1"
          value={addressLine1}
          onChange={(e) => setAddressLine1(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="city">City:</label>
        <input
          type="text"
          id="city"
          value={city}
          onChange={(e) => setCity(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="state">State:</label>
        <input
          type="text"
          id="state"
          value={state}
          onChange={(e) => setState(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="zipCode">Zip Code:</label>
        <input
          type="text"
          id="zipCode"
          value={zipCode}
          onChange={(e) => setZipCode(e.target.value)}
        />
      </div>
      <h3>Items:</h3>
      <ul>
        {items.map((item) => (
          <li key={item.id}>
            <ProductDetail product={item} />
            <button onClick={() => removeItem(item)}>Remove</button>
          </li>
        ))}
      </ul>
      <h3>Total Price: ${totalPrice()}</h3>
      {items.length > 0 && address && (
        <div>
          <h3>Shipping Address:</h3>
          <p>
            {address.unit_num} {address.street_num}, {address.address_line_1}
          </p>
          <p>
            {address.city}, {address.state} {address.zip_code}
          </p>
        </div>
      )}
      {items.length > 0 && !address && (
        <div>
          <p>Please enter your shipping address:</p>
          <button onClick={handleCheckout}>Checkout</button>
        </div>
      )}
      <AddToCartButton addItem={addItem} />
    </div>
  );
}
export default Cart;
