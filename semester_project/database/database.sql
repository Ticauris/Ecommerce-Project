CREATE DATABASE store_database
/**/
CREATE TABLE customer(
    ID                                  BIGSERIAL,
    customer_email                      VARCHAR(100)UNIQUE,
    customer_phone_number               VARCHAR(12),
    customer_password                   VARCHAR(200),
    CONSTRAINT customer_ID              PRIMARY KEY (ID),
    CONSTRAINT customer_unique_ID       UNIQUE (customer_email, customer_phone_number, customer_password)
);
/**/
CREATE TABLE address(
    ID                          BIGSERIAL,
    unit_num                    INTEGER,
    street_num                  INTEGER,
    address_line_1              VARCHAR(100),
    address_line_2              VARCHAR(100),
    city                        VARCHAR(100),
    state                       VARCHAR(100),
    zip_code                    INTEGER,
    CONSTRAINT address_ID       PRIMARY KEY(ID),
    CONSTRAINT address_unique   UNIQUE(unit_num, street_num, address_line_1, address_line_2, city, zip_code) 
);

CREATE TABLE specific_stores(
  ID                           BIGSERIAL,
  address_ID                   INTEGER REFERENCES address(ID),
  inventory                    INTEGER,
  hours                        VARCHAR(255) NOT NULL,
  shipping_options             VARCHAR(255) NOT NULL,
  CONSTRAINT store_ID          PRIMARY KEY (ID),
  CONSTRAINT store_unique_ID   UNIQUE (address_ID, inventory, hours, shipping_options)
);

CREATE TABLE brand_vendor (
  ID          BIGSERIAL,
  brand_name  VARCHAR(100) NOT NULL,
  CONSTRAINT brand_ID PRIMARY KEY(ID),
  CONSTRAINT unique_brand_name UNIQUE(brand_name)
);

CREATE TABLE payment_method(
    ID                          BIGSERIAL,
    customer_ID                 INTEGER REFERENCES customer(ID),
    /*maybe this value should be a varchar*/
    payment_name                VARCHAR(100),
    provide                     VARCHAR(50),
    card_num                    VARCHAR(16),
    card_exp_date               DATE,/*update to int, gives excess information*/
    default_payment             BOOLEAN
);

CREATE TABLE product_categories (
  ID                           BIGSERIAL,
  cat_name                     VARCHAR(100) NOT NULL,
  description_text             VARCHAR(1000),   
  CONSTRAINT cat_ID            PRIMARY KEY(ID),
  CONSTRAINT unique_cat_ID     UNIQUE(cat_name, description_text)
);

CREATE TABLE product_variation (
  ID                         BIGSERIAL,
  var_name                   VARCHAR(100) NOT NULL,
  var_description            VARCHAR(1000),
  var_image                  TEXT,
  price                      NUMERIC(10,2) NOT NULL,
  cat_ID           			     INTEGER NOT NULL REFERENCES product_categories(ID),
  brand_ID         			     INTEGER REFERENCES brand_vendor(ID),
  CONSTRAINT var_ID          PRIMARY KEY(ID),
  CONSTRAINT unique_var_ID   UNIQUE(var_name, var_description, price, cat_ID, brand_ID)
);


CREATE TABLE product(
    ID                          BIGSERIAL,
    quantity                    INTEGER,
    store_ID                    INTEGER REFERENCES specific_stores(ID),
    var_ID                      INTEGER REFERENCES product_variation(ID),
    CONSTRAINT product_ID       PRIMARY KEY (ID)                       
);

CREATE TABLE customer_cart(
    ID                          BIGSERIAL,
    create_at                   NOT NULL DEFAULT NOW(),
    product_ID                  INTEGER REFERENCES product(ID),
    customer_ID                 INTEGER REFERENCES customer(ID)
    CONSTRAINT cart_ID          PRIMARY KEY (ID)
);

CREATE TABLE shipping_options(
  ID                            BIGSERIAL,
  shipping_option               VARCHAR(50),
  CONSTRAINT shipping_ID        PRIMARY KEY(ID)
);

CREATE TABLE customer_order (
    ID                          BIGSERIAL,
    customer_ID                 INTEGER REFERENCES customer(ID),
    order_date                  DATE,
    order_total                 NUMERIC(10, 2),
    address_ID                  INTEGER REFERENCES address(ID),
    store_ID                    INTEGER REFERENCES specific_stores(ID),
	  shipping_ID                 INTEGER REFERENCES shipping_options(ID),
    cart_ID                     INTEGER REFERENCES customer_cart(ID),
    CONSTRAINT order_ID         PRIMARY KEY (ID)  
    /*maybe add a order status value*/
);

CREATE TABLE customer_order_item (
    ID                          BIGSERIAL,
    order_ID                    INTEGER REFERENCES customer_order(ID),
    product_ID                  INTEGER REFERENCES product(ID),
    quantity                    INTEGER,
    price                       NUMERIC(10, 2),
    CONSTRAINT order_item_ID   PRIMARY KEY (ID)
);

-- Insert data into the customer table
INSERT INTO customer (customer_email, customer_phone_number, customer_password) VALUES
  ('john@example.com', '555-1234', 'password123'),
  ('jane@example.com', '555-5678', 'password456'),
  ('bob@example.com',   '555-5555', 'password789');

-- Insert data into the address table
INSERT INTO address (unit_num, street_num, address_line_1, city, state, zip_code) VALUES
  (101, 1234, 'Main St', 'Los Angeles', 'CA', 90001),
  (202, 5678, 'Broadway', 'New York', 'NY', 10001),
  (303, 9101, 'State St', 'Chicago', 'IL', 60601),
  (404, 1212, 'Pico Blvd', 'Santa Monica', 'CA', 90401);

-- Insert data into the specific_stores table
INSERT INTO specific_stores (address_ID, inventory, hours, shipping_options) VALUES
  (1, 100, '9AM-9PM', 'Standard, Expedited'),
  (2, 50, '10AM-8PM', 'Standard, In-store pickup'),
  (3, 200, '8AM-10PM', 'Standard, Overnight'),
  (4, 75, '11AM-7PM', 'Standard'), 
   (505, 2468, 'Park Ave', 'San Francisco', 'CA', 94101),
  (606, 369, 'Michigan Ave', 'Detroit', 'MI', 48201),
  (707, 555, 'Fifth Ave', 'New York', 'NY', 10001);

-- Insert data into the brand_vendor table
INSERT INTO brand_vendor (brand_name) VALUES
  ('Apple'),
  ('Samsung'),
  ('Nike'),
  ('Adidas'),
  ('Sony'),
  ('LG'),
  ('Samsung'),
  ('Panasonic');

-- Insert data into the payment_method table
INSERT INTO payment_method (customer_ID, payment_name, provide, card_num, card_exp_date, default_payment) VALUES
  (1, 'Visa', 'Visa Inc.', '1234567812345678', '2024-10-01', true),
  (2, 'Mastercard', 'Mastercard Worldwide', '9876543210987654', '2023-05-01', false),
  (3, 'American Express', 'American Express Company', '1111222233334444', '2025-12-01', false),
  (4, 'PayPal', 'PayPal Holdings Inc.', 'johndoe@example.com', NULL, true);

-- Insert data into the product_categories table
INSERT INTO product_categories (cat_name, description_text) VALUES
  ('Electronics', 'Electronic devices such as laptops, phones, and televisions.'),
  ('Clothing', 'A wide range of clothes for men, women, and children.'),
  ('Food', 'A variety of food items including fruits, vegetables, and meats.'),
  ('Home', 'Items used for home decoration and furniture.');

  -- Insert data into the product_variation table
INSERT INTO product_variation (var_name, var_description, price, cat_ID, brand_ID) VALUES
  ('iPhone 13 Pro Max', 'The latest iPhone from Apple', 1099.99, 1, 1),
  ('Galaxy S21 Ultra', 'The latest Galaxy phone from Samsung', 999.99, 1, 2),
  ('AirPods Pro', 'Wireless earbuds from Apple', 249.99, 1, 1),
  ('Ultra Boost 21', 'Running shoes from Adidas', 149.99, 2, 4),
  ('55" OLED TV', 'OLED TV from LG', 1599.99, 1, 6),
  ('PS5', 'The latest PlayStation console from Sony', 499.99, 1, 5),
  ('MacBook Pro M1', 'The latest MacBook from Apple', 1299.99, 1, 1),
  ('Nike Air Force 1', 'Classic Nike shoes', 89.99, 2, 3);
--Insert data into product table
INSERT INTO product (quantity, store_ID, var_ID, prod_image)
VALUES
  (100, 1, 1, 'https://example.com/iphone.jpg'),
  (75, 2, 2, 'https://example.com/galaxy.jpg'),
  (50, 3, 3, 'https://example.com/airpods.jpg'),
  (25, 4, 4, 'https://example.com/shoes.jpg'),
  (10, 1, 5, 'https://example.com/tv.jpg'),
  (5, 2, 6, 'https://example.com/ps5.jpg'),
  (20, 3, 7, 'https://example.com/macbook.jpg'),
  (30, 4, 8, NULL),
  (15, 1, 1, 'https://example.com/iphone.jpg'),
  (40, 2, 2, 'https://example.com/galaxy.jpg'),
  (60, 3, 3, 'https://example.com/airpods.jpg'),
  (80, 4, 4, 'https://example.com/shoes.jpg'),
  (90, 1, 5, 'https://example.com/tv.jpg'),
  (100, 2, 6, 'https://example.com/ps5.jpg'),
  (150, 3, 7, 'https://example.com/macbook.jpg'),
  (200, 4, 8, NULL),
  (30, 1, 1, 'https://example.com/iphone.jpg'),
  (25, 2, 2, 'https://example.com/galaxy.jpg'),
  (50, 3, 3, 'https://example.com/airpods.jpg');
 
/*update store inventory*/
CREATE OR REPLACE FUNCTION update_store_inventory()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE store
  if(NEW.store_ID NOT NULL) THEN 
    UPDATE store
    SET inventory = inventory + NEW.quantity - OLD.quantity
    WHERE id = NEW.store_id;
  END IF
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_store_inventory_trigger
AFTER UPDATE ON product
FOR EACH ROW
EXECUTE FUNCTION update_store_inventory();

/*get purchase history*/
CREATE OR REPLACE FUNCTION get_customer_purchase_history(customer_id INTEGER)
RETURNS TABLE (
  order_id INTEGER,
  order_date TIMESTAMP,
  total_cost NUMERIC
) AS $$
BEGIN
  RETURN QUERY
    SELECT order_id, order_date, total_cost
    FROM customer_order
    WHERE customer_id = get_customer_purchase_history.customer_id
    ORDER BY order_date DESC;
END;
$$ LANGUAGE plpgsql;

/*update the order total*/
CREATE OR REPLACE FUNCTION update_order_total() RETURNS TRIGGER AS $$
BEGIN
  UPDATE customer_order
  SET order_total = (
    SELECT SUM(price * quantity)
    FROM customer_order_item
    WHERE order_ID = NEW.order_ID
  )
  WHERE ID = NEW.order_ID;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_order_total_trigger
AFTER INSERT ON customer_order_item
FOR EACH ROW
EXECUTE FUNCTION update_order_total();


/*top 5 stores*/
SELECT s.ID as store_id, SUM(coi.quantity * pv.price) as total_sales
FROM specific_stores s
INNER JOIN product p ON s.ID = p.store_ID
INNER JOIN product_variation pv ON p.var_ID = pv.ID
INNER JOIN customer_order_item coi ON p.ID = coi.product_ID
GROUP BY s.ID
ORDER BY total_sales DESC
LIMIT 5;