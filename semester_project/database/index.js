const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./database");

//middleware
app.use(cors());
app.use(express.json());

app.post("/customer", async (req, res) => {
  try {
    const { customer_email, customer_phone_number, customer_password } =
      req.body;
    const new_customer = await pool.query(
      "INSERT INTO customer(customer_email, customer_phone_number, customer_password) VALUES($1, $2, $3) RETURNING *",
      [customer_email, customer_phone_number, customer_password]
    );
    console.log(req.body);
    res.json(new_customer.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating customer." });
  }
});

app.get("/customer", async (req, res) => {
  try {
    const customer = await pool.query("SELECT * FROM customer");
    res.json(customer.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error retrieving products." });
  }
});

app.delete("/customer/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_customer = await pool.query(
      "DELETE FROM customer WHERE customer_id = $1",
      [id]
    );
    res.json("Customer was deleted.");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting customer." });
  }
});

app.post("/address", async (req, res) => {
  try {
    const {
      unit_num,
      street_num,
      address_line_1,
      address_line_2,
      city,
      state,
      zip_code,
    } = req.body;
    const new_address = await pool.query(
      "INSERT INTO address(unit_num, street_num, address_line_1, address_line_2, city, state, zip_code) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *",
      [
        unit_num,
        street_num,
        address_line_1,
        address_line_2,
        city,
        state,
        zip_code,
      ]
    );
    console.log(req.body);
    res.json(new_address.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating customer address." });
  }
});

app.get("/address", async (res) => {
  try {
    const address = await pool.query("SELECT * FROM address");
    res.json(address.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error retrieving address." });
  }
});

app.delete("/address/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_address = await pool.query(
      "DELETE FROM address WHERE address_id = $1",
      [id]
    );
    res.json("Address was deleted.");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting customer address." });
  }
});

app.post("/specific_stores", async (req, res) => {
  try {
    const { address_ID, inventory, hours, shipping_options } = req.body;
    const new_store = await pool.query(
      "INSERT INTO specific_stores(address_ID, inventory, hours, shipping_options) VALUES($1, $2, $3, $4) RETURNING *",
      [address_ID, inventory, hours, shipping_options]
    );
    console.log(req.body);
    res.json(new_store.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating store." });
  }
});

app.get("/specific_stores", async (req, res) => {
  try {
    const stores = await pool.query("SELECT * FROM specific_stores");
    res.json(stores.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error retrieving stores." });
  }
});

app.delete("/specific_stores/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_store = await pool.query(
      "DELETE FROM specific_stores WHERE store_id = $1",
      [id]
    );
    res.json("Store was deleted.");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting store." });
  }
});

app.post("/brand_vendor", async (req, res) => {
  try {
    const { brand_name } = req.body;
    const new_brand = await pool.query(
      "INSERT INTO brand_vendor(brand_name) VALUES($1) RETURNING *",
      [brand_name]
    );
    console.log(req.body);
    res.json(new_brand.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating brand." });
  }
});

app.get("/brand_vendor", async (req, res) => {
  try {
    const brands = await pool.query("SELECT * FROM brand_vendor");
    res.json(brands.rows);
  } catch (error) {
    console.error(err.message);
    res.status(400).json({ message: "Error retrieving brands." });
  }
});

app.delete("/brand_vendor/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_brand = await pool.query(
      "DELETE FROM brand_vendor WHERE brand_id = $1 RETURNING *",
      [id]
    );
    if (delete_brand.rows.length === 0) {
      return res
        .status(404)
        .json({ message: `Brand with ID ${id} not found.` });
    }
    res.json({
      message: "Brand deleted successfully.",
      brand: delete_brand.rows[0],
    });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting brand." });
  }
});

app.post("/payment_method", async (req, res) => {
  try {
    const {
      customer_ID,
      payment_name,
      provide,
      card_num,
      card_exp_date,
      default_payment,
    } = req.body;
    const new_payment = await pool.query(
      "INSERT INTO payment_method(customer_ID, payment_name, provide, card_num, card_exp_date, default_payment) VALUES($1, $2, $3, $4, $5, $6) RETURNING *",
      [
        customer_ID,
        payment_name,
        provide,
        card_num,
        card_exp_date,
        default_payment,
      ]
    );
    console.log(req.body);
    res.json(new_payment.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating payment." });
  }
});

app.get("/payment_method", async (req, res) => {
  try {
    const payments = pool.query("SELECT * FROM payment_method");
    res.json(payments.rows[0]);
  } catch (error) {
    console.error(err.message);
    res.status(500).json({ message: "Error retrieving payment method." });
  }
});

app.delete("/payment_method/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const deletePayment = await pool.query(
      "DELETE FROM payment_method WHERE payment_ID = $1",
      [id]
    );
    if (deletePayment.rowCount === 0) {
      return res.status(404).json({ message: "Payment not found." });
    }
    res.json({ message: "Payment successfully deleted." });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting payment." });
  }
});

app.post("/product_categories", async (req, res) => {
  try {
    const { cat_name, description_text } = req.body;
    const new_product_categories = await pool.query(
      "INSERT INTO product_categories(cat_name, description_text) VALUES($1, $2) RETURNING *",
      [cat_name, description_text]
    );
    console.log(req.body);
    res.json(new_product_categories.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating product category." });
  }
});

app.get("/product_categories", async (req, res) => {
  try {
    const product_categories = await pool.query(
      "SELECT * FROM product_categories"
    );
    res.json(product_categories.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error retrieving product categories." });
  }
});

app.delete("/product_categories/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const deleteProductCategory = await pool.query(
      "DELETE FROM product_categories WHERE cat_ID = $1",
      [id]
    );
    if (deleteProductCategory.rowCount === 0) {
      return res.status(404).json({ message: "Product category not found." });
    }
    res.json({ message: "Product category successfully deleted." });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting product category." });
  }
});

app.post("/product_variation", async (req, res) => {
  try {
    const { var_name, var_description, price, cat_ID, brand_ID } = req.body;
    const new_product_variation = await pool.query(
      "INSERT INTO product_variation(var_name, var_description, price, cat_ID, brand_ID) VALUES($1, $2, $3, $4, $5) RETURNING *",
      [var_name, var_description, price, cat_ID, brand_ID]
    );
    console.log(req.body);
    res.json(new_product_variation.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating product variation." });
  }
});

app.get("/product_variations", async (req, res) => {
  try {
    const product_variation = pool.query("SELECT * FROM product_variation");
    res.json(product_variation.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error retrieving variation." });
  }
});

app.delete("/product_variation/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_product_variation = await pool.query(
      "DELETE FROM product_variation WHERE var_ID = $1 RETURNING *",
      [id]
    );
    if (delete_product_variation.rows.length === 0) {
      return res.status(404).json({ message: "Product variation not found." });
    }
    res.json(delete_product_variation.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting product variation." });
  }
});

app.post("/product", async (req, res) => {
  try {
    const { quantity, store_ID, var_ID, prod_image } = req.body;
    const new_product = await pool.query(
      "INSERT INTO product(quantity, store_ID, var_ID, prod_image) VALUES($1, $2, $3, $4) RETURNING *",
      [quantity, store_ID, var_ID, prod_image]
    );
    console.log(req.body);
    res.json(new_product.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating product." });
  }
});

app.get("/products", async (req, res) => {
  try {
    const products = await pool.query("SELECT product.*, product_variation.var_name FROM product INNER JOIN product_variation ON product.var_id = product_variation.ID")
    res.setHeader("Content-Type", "application/json"); // set header to return JSON data
    res.json(products.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error retrieving products." });
  }
});

app.delete("/product/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_product = await pool.query(
      "DELETE FROM product WHERE ID = $1",
      [id]
    );
    res.json("Product deleted successfully");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting product." });
  }
});

app.post("/customer_cart", async (req, res) => {
  try {
    const { create_at, product_ID, customer_ID } = req.body;
    const new_cart = await pool.query(
      "INSERT INTO customer_cart(create_at, product_ID, customer_ID) VALUES($1, $2, $3) RETURNING *",
      [create_at, product_ID, customer_ID]
    );
    console.log(req.body);
    res.json(new_cart.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating cart." });
  }
});

app.delete("/customer_cart/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_cart = await pool.query(
      "DELETE FROM customer_cart WHERE cart_id = $1",
      [id]
    );
    res.json("Cart deleted successfully");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting cart." });
  }
});

app.post("/shipping_options", async (req, res) => {
  try {
    const { shipping_options } = req.body;
    const new_shipping_option = await pool.query(
      "INSERT INTO shipping_options(shipping_option) VALUES($1) RETURNING *",
      [shipping_options]
    );
    console.log(req.body);
    res.json(new_shipping_option.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating shipping option." });
  }
});

app.delete("/shipping_options/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_shipping_option = await pool.query(
      "DELETE FROM shipping_options WHERE option_id = $1",
      [id]
    );
    res.json("Shipping option deleted successfully");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting shipping option." });
  }
});

app.post("/customer_order", async (req, res) => {
  try {
    const {
      customer_ID,
      order_date,
      order_total,
      address_ID,
      store_ID,
      shipping_ID,
      cart_ID,
    } = req.body;
    const new_customer_order = await pool.query(
      "INSERT INTO customer_order(customer_ID, order_date, order_total, address_ID, store_ID, shipping_ID, cart_ID) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *",
      [
        customer_ID,
        order_date,
        order_total,
        address_ID,
        store_ID,
        shipping_ID,
        cart_ID,
      ]
    );
    console.log(req.body);
    res.json(new_customer_order.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating order." });
  }
});

app.delete("/customer_order/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_customer_order = await pool.query(
      "DELETE FROM customer_order WHERE order_ID = $1",
      [id]
    );
    res.json("Customer order deleted successfully.");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting customer order." });
  }
});

app.post("/customer_order_item", async (req, res) => {
  try {
    const { order_ID, product_ID, quantity, price } = req.body;
    const new_customer_order_item = await pool.query(
      "INSERT INTO customer_order_item(order_ID, product_ID, quantity, price) VALUES($1, $2, $3, $4) RETURNING *",
      [order_ID, product_ID, quantity, price]
    );
    console.log(req.body);
    res.json(new_customer_order_item.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error creating order item." });
  }
});

app.delete("/customer_order_item/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const delete_customer_order_item = await pool.query(
      "DELETE FROM customer_order_item WHERE order_item_ID = $1",
      [id]
    );
    res.json("Customer order item deleted successfully.");
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: "Error deleting customer order item." });
  }
});

app.listen(5000, () => {
  console.log("server started on 5000");
});
