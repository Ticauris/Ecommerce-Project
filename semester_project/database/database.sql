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
    /*want to use a is default but unsure how to implement it*/
);

CREATE TABLE product_categories (
  ID                           BIGSERIAL,
  cat_name                     VARCHAR(100) NOT NULL,
  description_text             VARCHAR(1000),   
  CONSTRAINT cat_ID            PRIMARY KEY(ID),
  CONSTRAINT unique_cat_ID     UNIQUE(cat_name, description_text)
);

CREATE TABLE product_variation (
  ID               BIGSERIAL,
  var_name         VARCHAR(100) NOT NULL,
  var_description  VARCHAR(1000),
  price            NUMERIC(10,2) NOT NULL,
  cat_ID           			 INTEGER NOT NULL REFERENCES product_categories(ID),
  brand_ID         			 INTEGER REFERENCES brand_vendor(ID),
  CONSTRAINT var_ID          PRIMARY KEY(ID),
  CONSTRAINT unique_var_ID   UNIQUE(var_name, var_description, price, cat_ID, brand_ID)
);


CREATE TABLE product(
    ID                          BIGSERIAL,
    sku_number                  INTEGER, /*delete*/ 
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
































































