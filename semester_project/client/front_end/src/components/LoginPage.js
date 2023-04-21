import React, { useState, useEffect } from "react";
import {Card, Form, Button } from "react-bootstrap";
import "./Login.css";

function Login({ handleLogin }) {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
  
    const handleLoginSubmit = () => {
      fetch("http://localhost:5000/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ customer_email: email, customer_password: password })
      })
        .then((response) => {
          if (response.ok) {
            return response.json();
          } else {
            throw new Error("Invalid credentials");
          }
        })
        .then((data) => {
          console.log("Login Successful");
          handleLogin(); // Update isLoggedIn to true
        })
        .catch((error) => {
          console.error(error);
        });
    };
  
    return (
        <Card.Body>
          <Card>
            <Card.Body>
              <h2>Login</h2>
              <Form>
                <Form.Group controlId="formBasicEmail">
                  <Form.Label>Email address</Form.Label>
                  <Form.Control type="email" placeholder="Enter email" value={email} onChange={(e) => setEmail(e.target.value)} />
                </Form.Group>
    
                <Form.Group controlId="formBasicPassword">
                  <Form.Label>Password</Form.Label>
                  <Form.Control type="password" placeholder="Password" value={password} onChange={(e) => setPassword(e.target.value)} />
                </Form.Group>
                <Button className="btn-primary" variant="primary" type="submit" onClick={handleLoginSubmit}>
                  Login
                </Button>
              </Form>
            </Card.Body>
          </Card>
        </Card.Body>
      );
    }
export default Login;


/*<button onClick={() => {
    fetch("http://localhost:5000/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ customer_email: email, customer_password: password })
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        } else {
          throw new Error("Invalid credentials");
        }
      })
      .then((data) => {
        console.log("Login Successful");
      })
      .catch((error) => {
        console.error(error);
      });
}}>Log In</button> */