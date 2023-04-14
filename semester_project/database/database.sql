CREATE SEQUENCE customer_id_seq;

CREATE TABLE customer(
    ID                                  SERIAL,
    customer_email                      VARCHAR(100)UNIQUE,
    customer_phone_number               VARCHAR(12),
    customer_password                   VARCHAR(200),
    CONSTRAINT customer_ID              PRIMARY KEY (ID),
    CONSTRAINT customer_unique_ID       UNIQUE (customer_email, customer_phone_number, customer_password)
);

CREATE SEQUENCE address_id_seq;

CREATE TABLE address(
    ID                          SERIAL,
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

CREATE SEQUENCE specific_stores_id_seq;

CREATE TABLE specific_stores(
  ID                            SERIAL,
  address_ID                   INTEGER REFERENCES address(ID),
  inventory                    INTEGER,
  hours                        VARCHAR(255) NOT NULL,
  shipping_options             VARCHAR(255) NOT NULL,
  CONSTRAINT store_ID          PRIMARY KEY (ID),
  CONSTRAINT store_unique_ID   UNIQUE (address_ID, inventory, hours, shipping_options)
);


CREATE SEQUENCE brand_vendor_id_seq;

CREATE TABLE brand_vendor (
  ID                        SERIAL,
  brand_name                VARCHAR(100) NOT NULL,
  CONSTRAINT                brand_ID PRIMARY KEY(ID),
  CONSTRAINT unique_brand_name UNIQUE(brand_name)
);

CREATE SEQUENCE payment_method_id_seq;

CREATE TABLE payment_method(
    ID                           SERIAL,
    customer_ID                 INTEGER REFERENCES customer(ID),
    payment_name                VARCHAR(100),
    provide                     VARCHAR(50),
    card_num                    VARCHAR(16),
    card_exp_date               INTEGER,
    default_payment             BOOLEAN
);

CREATE SEQUENCE product_categories_id_seq;

CREATE TABLE product_categories (
  ID                            SERIAL,
  cat_name                     VARCHAR(100) NOT NULL,
  description_text             VARCHAR(1000),   
  CONSTRAINT cat_ID            PRIMARY KEY(ID),
  CONSTRAINT unique_cat_ID     UNIQUE(cat_name, description_text)
);


CREATE SEQUENCE product_variation_id_seq;

CREATE TABLE product_variation (
  ID                          SERIAL,
  var_name                   VARCHAR(100) NOT NULL,
  var_description            VARCHAR(1000),
  var_image                  TEXT,
  price                      NUMERIC(10,2) NOT NULL,
  cat_ID           			     INTEGER NOT NULL REFERENCES product_categories(ID),
  brand_ID         			     INTEGER REFERENCES brand_vendor(ID),
  CONSTRAINT var_ID          PRIMARY KEY(ID),
  CONSTRAINT unique_var_ID   UNIQUE(var_name, var_description, price, cat_ID, brand_ID)
);

CREATE SEQUENCE product_id_seq;

CREATE TABLE product(
    ID                          SERIAL,
    quantity                    INTEGER,
    store_ID                    INTEGER REFERENCES specific_stores(ID),
    var_ID                      INTEGER REFERENCES product_variation(ID),
    prod_image                  TEXT,
    CONSTRAINT product_ID       PRIMARY KEY (ID)                       
);

CREATE SEQUENCE customer_cart_id_seq;

CREATE TABLE customer_cart(
    ID                          SERIAL,
    create_at                   INTEGER,
    product_ID                  INTEGER REFERENCES product(ID),
    customer_ID                 INTEGER REFERENCES customer(ID),
    CONSTRAINT cart_ID          PRIMARY KEY (ID)
);


CREATE SEQUENCE shipping_options_seq;

CREATE TABLE shipping_options(
  ID                             SERIAL,
  shipping_option               VARCHAR(50),
  CONSTRAINT shipping_ID        PRIMARY KEY(ID)
);

CREATE SEQUENCE customer_order_seq;

CREATE TABLE customer_order (
    ID                          SERIAL,
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

CREATE SEQUENCE customer_order_item_seq;

CREATE TABLE customer_order_item (
    ID                           SERIAL,
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
  (4, 75, '11AM-7PM', 'Standard');

-- Insert data into the brand_vendor table
INSERT INTO brand_vendor (brand_name) VALUES
  ('Apple'),
  ('Nike'),
  ('Adidas'),
  ('Sony'),
  ('LG'),
  ('Samsung'),
  ('Panasonic');

-- Insert data into the payment_method table
INSERT INTO payment_method (customer_ID, payment_name, provide, card_num, card_exp_date, default_payment) VALUES 
    (1, 'Visa', 'Visa Inc.', '1234567812345678', 1124, true),
    (1, 'Mastercard', 'Mastercard International', '8765432187654321', 0325, false),
    (2, 'American Express', 'American Express Company', '1111222233334444', 0626, true),
    (3, 'PayPal', 'PayPal Holdings, Inc.', 'abcde12345', null, true);


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
  (100, 1, 1, 'https://www.shutterstock.com/shutterstock/photos/2204508595/display_1500/stock-photo-bangkok-thailand-september-isolate-of-the-new-iphone-pro-deep-purple-the-new-color-2204508595.jpg'), /*iphone*/
  (75, 2, 2, 'https://www.shutterstock.com/shutterstock/photos/2167067927/display_1500/stock-photo-rostov-on-don-russia-april-samsung-galaxy-s-ultra-in-green-on-a-white-background-a-new-2167067927.jpg'),/*s23*/
  (50, 3, 3, 'https://www.shutterstock.com/shutterstock/photos/2071692311/display_1500/stock-photo-white-wireless-headphones-with-no-background-isolated-2071692311.jpg'), /*airpods*/
  (25, 4, 4, 'https://www.shutterstock.com/shutterstock/photos/1511073545/display_1500/stock-photo-ipoh-perak-malaysia-september-adidas-yeezy-inertia-model-the-adidas-yeezy-inertia-1511073545.jpg'),/*shoes*/
  (10, 1, 5, 'https://www.shutterstock.com/shutterstock/photos/410515291/display_1500/stock-photo--k-television-sky-or-monitor-landscape-isolated-on-white-background-410515291.jpg'),/*tv*/
  (5, 2, 6, 'https://www.shutterstock.com/shutterstock/photos/1757486213/display_1500/stock-photo-japan-june-presentation-of-a-new-product-from-sony-wireless-white-console-playstation-1757486213.jpg'),/*ps5*/
  (20, 3, 7, 'https://www.shutterstock.com/shutterstock/photos/1654752016/display_1500/stock-photo-cracow-poland-february-macbook-pro-a-new-version-os-for-mac-of-the-laptop-from-apple-1654752016.jpg');/*macbok*/
 
/*update store inventory*/
CREATE OR REPLACE FUNCTION update_store_inventory()
RETURNS TRIGGER AS $$
BEGIN
 IF NEW.store_ID IS NOT NULL THEN 
    UPDATE store
    SET inventory = inventory + NEW.quantity - OLD.quantity
    WHERE id = NEW.store_id;
  END IF;
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