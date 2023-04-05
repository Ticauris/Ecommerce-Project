const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./database");

//middleware 
app.use(cors());
app.use(express.json());

//create functions
app.post("/customers", async(req, res)=> {
    try {
        const {customer_email, customer_phone_number, customer_password} = req.body;
        const new_customer = await pool.query(
            "INSERT INTO customer(customer_email, customer_phone_number, customer_password) VALUES($1, $2, $3) RETURNING *",
             [customer_email, customer_phone_number, customer_password]);
          console.log(req.body)
          res.json(new_customer.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating customer."})
    }
});

app.post("/address", async(req, res)=> {
    try {
        const {unit_num, street_num, address_line_1, address_line_2, city, zip_code} = req.body;
        const new_address = await pool.query(
            "INSERT INTO address(unit_num, street_num, address_line_1, address_line_2, city, zip_code) VALUES($1, $2, $3, $4, $5, $6) RETURNING *",
             [unit_num, street_num, address_line_1, address_line_2, city, zip_code]);
          console.log(req.body)
          res.json(new_address.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating customer."})
    }
});

app.post("/stores", async(req, res)=> {
    try {
        const {address_ID, inventory, hours, shipping_options} = req.body;
        const new_store = await pool.query(
            "INSERT INTO specific_stores(address_ID, inventory, hours, shipping_options) VALUES($1, $2, $3, $4) RETURNING *",
             [address_ID, inventory, hours, shipping_options]);
          console.log(req.body)
          res.json(new_store.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating store."})
    }
});

app.post("/brands", async(req, res)=> {
    try {
        const {brand_name} = req.body;
        const new_brand = await pool.query(
            "INSERT INTO brand_vendor(brand_name) VALUES($1) RETURNING *",
             [brand_name]);
          console.log(req.body)
          res.json(new_brand.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating brand."})
    }
});

app.post("/payment_method", async(req, res)=> {
    try {
        const {customer_ID, payment_name, provide, card_num, card_exp_date, default_payment} = req.body;
        const new_payment = await pool.query(
            "INSERT INTO payment_method(customer_ID, payment_name, provide, card_num, card_exp_date, default_payment) VALUES($1, $2, $3, $4, $5, $6) RETURNING *",
             [customer_ID, payment_name, provide, card_num, card_exp_date, default_payment]);
          console.log(req.body)
          res.json(new_payment.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating payment."})
    }
});

app.post("/product_categories", async(req, res)=> {
    try {
        const {cat_name, description_text} = req.body;
        const new_product_categories = await pool.query(
            "INSERT INTO product_categories(cat_name, description_text) VALUES($1, $2) RETURNING *",
             [cat_name, description_text]);
          console.log(req.body)
          res.json(new_product_categories.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating product category."})
    }
});


app.post("/product_variation", async(req, res)=> {
    try {
        const {var_name, var_description, price, cat_ID, brand_ID} = req.body;
        const new_product_variation = await pool.query(
            "INSERT INTO product_variation(var_name, var_description, price, cat_ID, brand_ID) VALUES($1, $2, $3, $4, $5) RETURNING *",
             [var_name, var_description, price, cat_ID, brand_ID]);
          console.log(req.body)
          res.json(new_product_variation.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating product variation."})
    }
});

app.post("/product", async(req, res)=> {
    try {
        const {sku_number, quantity, store_ID, var_ID} = req.body;
        const new_product = await pool.query(
            "INSERT INTO product(sku_number, quantity, store_ID, var_ID) VALUES($1, $2, $3, $4) RETURNING *",
             [sku_number, quantity, store_ID, var_ID]);
          console.log(req.body)
          res.json(new_product.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating product."})
    }
});

app.post("/customer_cart", async(req, res)=> {
    try {
        const {create_at, product_ID, customer_ID} = req.body;
        const new_cart = await pool.query(
            "INSERT INTO customer_cart(create_at, product_ID, customer_ID) VALUES($1, $2, $3) RETURNING *",
             [create_at, product_ID, customer_ID]);
          console.log(req.body)
          res.json(new_cart.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating cart."})
    }
});

app.post("/shipping_options", async(req, res)=> {
    try {
        const {shipping_options} = req.body;
        const new_shipping_option = await pool.query(
            "INSERT INTO shipping_options(shipping_option) VALUES($1) RETURNING *",
             [shipping_options]);
          console.log(req.body)
          res.json(new_shipping_option.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating shipping option."})
    }
});


app.post("/customer_order", async(req, res)=> {
    try {
        const {customer_ID, order_date, order_total, address_ID, store_ID, shipping_ID, cart_ID} = req.body;
        const new_customer_order = await pool.query(
            "INSERT INTO customer_order(customer_ID, order_date, order_total, address_ID, store_ID, shipping_ID, cart_ID) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *",
             [customer_ID, order_date, order_total, address_ID, store_ID, shipping_ID, cart_ID]);
          console.log(req.body)
          res.json(new_customer_order.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating order."})
    }
});

app.post("/customer_order_item", async(req, res)=> {
    try {
        const {order_ID, product_ID, quantity, price} = req.body;
        const new_customer_order_item = await pool.query(
            "INSERT INTO customer_order_item(order_ID, product_ID, quantity, price) VALUES($1, $2, $3, $4) RETURNING *",
             [order_ID, product_ID, quantity, price]);
          console.log(req.body)
          res.json(new_customer_order_item.rows[0])
    } catch (err) {
        console.error(err.message);
        res.status(500).json({message: "Error creating order item."})
    }
});



app.listen(5000, ()=>{
    console.log("server started on 5000");
});

