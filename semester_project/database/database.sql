CREATE SEQUENCE address_ID_seq;
CREATE TABLE address(
    ID                          SERIAL,
    unit_num                    INTEGER,
    street_num                  INTEGER,
    address_line_1              VARCHAR(100),
    city                        VARCHAR(100),
    state                       VARCHAR(100),
    zip_code                    INTEGER,
    CONSTRAINT address_ID       PRIMARY KEY(ID),
    CONSTRAINT address_unique   UNIQUE(unit_num, street_num, address_line_1, city, zip_code) 
);
INSERT INTO address (unit_num, street_num, address_line_1, city, state, zip_code) VALUES 
(101, 1234, 'Main St', 'Los Angeles', 'CA', 90001),
(202, 5678, 'Broadway', 'New York', 'NY', 10001),
(303, 9101, 'State St', 'Chicago', 'IL', 60601),
(404, 1212, 'Pico Blvd', 'Santa Monica', 'CA', 90401),
(505, 9876, 'Main St', 'Denver', 'CO', 80202),
(606, 3456, 'Market St', 'Philadelphia', 'PA', 19107),
(707, 7890, 'Pike St', 'Seattle', 'WA', 98101),
(808, 4321, 'Broadway', 'Honolulu', 'HI', 96815),
(909, 2468, 'Main St', 'Kansas City', 'MO', 64108),
(1010, 3690, 'Peachtree St', 'Atlanta', 'GA', 30309),
(1111, 6543, 'Beacon St', 'Boston', 'MA', 02108),
(1212, 1357, 'Main St', 'Houston', 'TX', 77002),
(1313, 8642, 'Canal St', 'New Orleans', 'LA', 70130),
(1414, 5678, 'Main St', 'Salt Lake City', 'UT', 84101),
(1515, 3690, 'Michigan Ave', 'Detroit', 'MI', 48201),
(1616, 1357, 'Main St', 'San Antonio', 'TX', 78205),
(1717, 8642, 'Cherry St', 'Tulsa', 'OK', 74103),
(1818, 2468, 'Main St', 'Memphis', 'TN', 38103),
(1919, 6543, 'Peachtree St', 'Atlanta', 'GA', 30308),
(2020, 3690, 'Main St', 'Seattle', 'WA', 98104),
(2121, 1357, 'Market St', 'San Francisco', 'CA', 94103),
(2222, 8642, 'Broadway', 'New York', 'NY', 10003),
(2323, 5678, 'Main St', 'Kansas City', 'KS', 66101),
(2424, 3690, 'State St', 'Chicago', 'IL', 60602),
(2525, 1357, 'Main St', 'Columbus', 'OH', 43215),
(2626, 8642, 'Broad St', 'Richmond', 'VA', 23219),
(2727, 6543, 'Broadway', 'Los Angeles', 'CA', 90014),
(2828, 3690, 'Elm St', 'Dallas', 'TX', 75201),
(2929, 1357, 'Main St', 'Nashville', 'TN', 37219),
(3030, 8642, 'State St', 'Madison', 'WI', 53703), 
(3636, 3690, 'Main St', 'Minneapolis', 'MN', 55401),
 (3737, 1357, 'Broadway', 'Boulder', 'CO', 80302),
 (3838, 8642, 'Main St', 'Anchorage', 'AK', 99501),
  (3939, 5678, 'State St', 'Providence', 'RI', 02903),
  (4040, 3690, 'Main St', 'Charlotte', 'NC', 28202),
  (4141, 1357, 'Broadway', 'Portland', 'ME', 04101),
  (4242, 8642, 'Main St', 'Billings', 'MT', 59101),
  (4343, 5678, 'State St', 'Dover', 'DE', 19901),
  (4444, 3690, 'Main St', 'Phoenix', 'AZ', 85004),
  (4545, 1357, 'Broadway', 'San Diego', 'CA', 92101),
  (4646, 8642, 'Main St', 'Fargo', 'ND', 58102),
  (4747, 5678, 'State St', 'Hartford', 'CT', 06103),
  (4848, 3690, 'Main St', 'Las Vegas', 'NV', 89101),
  (4949, 1357, 'Broadway', 'Charleston', 'WV', 25301),
  (5050, 8642, 'Main St', 'Des Moines', 'IA', 50309),
  (5151, 5678, 'State St', 'Montgomery', 'AL', 36104),
(5252, 3690, 'Broadway', 'Boise', 'ID', 83702),
(5353, 1357, 'Main St', 'Jackson', 'MS', 39201),
(5454, 8642, 'State St', 'Helena', 'MT', 59601),
(5555, 5678, 'Broadway', 'Juneau', 'AK', 99801),
(5656, 3690, 'Main St', 'Jefferson City', 'MO', 65101),
(5757, 1357, 'State St', 'Salem', 'OR', 97301),
(5858, 8642, 'Broadway', 'Augusta', 'ME', 04330),
(5959, 5678, 'Main St', 'Concord', 'NH', 03301),
(6060, 3690, 'State St', 'Springfield', 'IL', 62704),
(5151, 2468, 'State St', 'Boise', 'ID', 83702),
(5252, 6543, 'Broadway', 'Rochester', 'NY', 14607),
(5353, 3690, 'Main St', 'Albuquerque', 'NM', 87102),
(5454, 1357, 'Market St', 'San Jose', 'CA', 95113),
(5555, 8642, 'Broadway', 'Portland', 'OR', 97205),
(5656, 5678, 'State St', 'Salt Lake City', 'UT', 84102),
(5757, 3690, 'Main St', 'St. Louis', 'MO', 63101),
(5858, 1357, 'Broadway', 'Cleveland', 'OH', 44115),
(5959, 8642, 'Main St', 'Miami', 'FL', 33130),
(6060, 5678, 'State St', 'Oklahoma City', 'OK', 73102),
(5656, 3690, 'Market St', 'San Francisco', 'CA', 94114),
(5757, 1357, 'State St', 'Boise', 'ID', 83702),
(5858, 8642, 'Main St', 'Salem', 'OR', 97301),
(5959, 5678, 'Broadway', 'Burlington', 'VT', 05401),
(6060, 3690, 'Main St', 'Austin', 'TX', 78701),
(6161, 1357, 'State St', 'Little Rock', 'AR', 72201),
(6262, 8642, 'Broadway', 'New York', 'NY', 10036),
(6363, 5678, 'Main St', 'Baltimore', 'MD', 21201),
(6464, 3690, 'State St', 'Olympia', 'WA', 98501),
(6565, 1357, 'Broadway', 'Reno', 'NV', 89501);


CREATE SEQUENCE customer_id_seq;
CREATE TABLE customer(
    ID                                  SERIAL,
    customer_email                      VARCHAR(100)UNIQUE,
    customer_phone_number               VARCHAR(12),
    customer_password                   VARCHAR(200),
    CONSTRAINT customer_ID              PRIMARY KEY (ID),
    CONSTRAINT customer_unique_ID       UNIQUE (customer_email, customer_phone_number, customer_password)
);
INSERT INTO customer (customer_email, customer_phone_number, customer_password)
VALUES 
    ('john@example.com', '555-1234', 'password123'),
    ('jane@example.com', '555-5678', 'secret321'),
    ('bob@example.com', '555-9012', 'letmein'),
    ('susan@example.com', '555-3456', 'qwerty'),
    ('mike@example.com', '555-7890', 'password1'),
    ('lisa@example.com', '555-2345', 'abc123'),
    ('jim@example.com', '555-6789', 'welcome1'),
    ('amy@example.com', '555-0123', 'pass1234'),
    ('tim@example.com', '555-4567', 'hello123'),
    ('karen@example.com', '555-8901', '123456'),
    ('steve@example.com', '555-2345', 'letmein123'),
    ('emily@example.com', '555-6789', 'password1234'),
    ('david@example.com', '555-0123', 'secret123'),
    ('laura@example.com', '555-4567', 'password!'),
    ('chris@example.com', '555-8901', 'qwerty123'),
    ('julie@example.com', '555-2345', 'password2'),
    ('alex@example.com', '555-6789', 'monkey123'),
    ('peter@example.com', '555-0123', '12345678'),
    ('sara@example.com', '555-4567', 'sunshine123'),
    ('jason@example.com', '555-8901', 'welcome123'),
    ('beth@example.com', '555-2345', 'password123!'),
    ('mark@example.com', '555-6789', 'letmein!'),
    ('mary@example.com', '555-0123', 'p@ssw0rd'),
    ('george@example.com', '555-4567', 'password12345'),
    ('kelly@example.com', '555-8901', 'football123'),
    ('phil@example.com', '555-2345', 'admin123'),
    ('tracy@example.com', '555-6789', 'changeme'),
    ('olivia@example.com', '555-0123', 'iloveyou'),
    ('jacob@example.com', '555-4567', 'qwertyuiop'),
    ('madison@example.com', '555-8901', 'password');

CREATE SEQUENCE specific_stores_id_seq;
CREATE TABLE specific_stores(
  ID                           BIGSERIAL,
  address_ID                   INTEGER REFERENCES address(ID),
  hours                        VARCHAR(255) NOT NULL,
  shipping_options             VARCHAR(255) NOT NULL,
  CONSTRAINT store_ID          PRIMARY KEY (ID),
  CONSTRAINT store_unique_ID   UNIQUE (address_ID, hours, shipping_options)
);

INSERT INTO specific_stores (address_ID, hours, shipping_options) VALUES
  (1, '9AM-9PM', 'Standard, Expedited'),
  (2, '10AM-8PM', 'Standard, In-store pickup'),
  (3, '8AM-10PM', 'Standard, Overnight'),
  (4, '11AM-7PM', 'Standard'),
  (5, '9AM-10PM', 'Standard, In-store pickup'),
  (6, '10AM-9PM', 'Standard, Expedited'),
  (7, '8AM-8PM', 'Standard, Overnight'),
  (8, '12PM-6PM', 'Standard'),
  (9, '9AM-6PM', 'Standard, In-store pickup'),
  (10, '11AM-8PM', 'Standard, Overnight'),
  (11, '8AM-9PM', 'Standard'),
  (12, '10AM-7PM', 'Standard, In-store pickup'),
  (13, '9AM-8PM', 'Standard, Overnight'),
  (14, '12PM-9PM', 'Standard'),
  (15, '11AM-10PM', 'Standard, In-store pickup'),
  (16, '8AM-7PM', 'Standard, Overnight'),
  (17, '9AM-11PM', 'Standard'),
  (18, '10AM-6PM', 'Standard, In-store pickup'),
  (19, '11AM-9PM', 'Standard, Overnight'),
  (20, '9AM-7PM', 'Standard'),
  (21, '8AM-10PM', 'Standard, In-store pickup'),
  (22, '12PM-8PM', 'Standard, Expedited'),
  (23, '9AM-12PM', 'Standard'),
  (24, '11AM-6PM', 'Standard, In-store pickup'),
  (25, '8AM-11PM', 'Standard, Overnight'),
  (26, '10AM-10PM', 'Standard'),
  (27, '9AM-5PM', 'Standard, In-store pickup'),
  (28, '12PM-7PM', 'Standard, Overnight'),
  (29, '10AM-5PM', 'Standard'),
  (30, '8AM-8PM', 'Standard, In-store pickup'),
  (31, '11AM-7PM', 'Standard, Overnight'),
  (32, '9AM-9PM', 'Standard'),
  (33, '10AM-6PM', 'Standard, In-store pickup'),
  (34, '8AM-11PM', 'Standard, Overnight'),
  (35, '12PM-10PM', 'Standard'),
  (36, '9AM-6PM', 'Standard, In-store pickup'),
  (37, '10AM-9PM', 'Standard, Overnight'),
  (38, '11AM-8PM', 'Standard'),
  (39, '8AM-6PM', 'Standard, In-store pickup'),
  (40, '9AM-10PM', 'Standard, Overnight'),
  (41, '9AM-10PM', 'Standard, Expedited, In-store pickup'),
(42, '8AM-9PM', 'Standard, Overnight'),
(43, '10AM-7PM', 'Standard, Express overnight'),
(44, '9AM-8PM', 'Standard, In-store pickup'),
(45, '11AM-8PM', 'Standard, Overnight'),
(46, '9AM-9PM', 'Standard, Expedited'),
(47, '8AM-10PM', 'Standard, Express overnight'),
(48, '10AM-7PM', 'Standard, In-store pickup'),
(49, '9AM-8PM', 'Standard, Overnight'),
(50, '11AM-8PM', 'Standard, Expedited');

CREATE SEQUENCE payment_method_id_seq;
CREATE TABLE payment_method(
    ID                          BIGSERIAL,
    customer_ID                 INTEGER REFERENCES customer(ID),
    payment_name                VARCHAR(100),
    provide                     VARCHAR(50),
    card_num                    VARCHAR(30),
    card_exp_date               INTEGER,
    default_payment             BOOLEAN,
    CONSTRAINT payment_ID       PRIMARY KEY (ID),
    CONSTRAINT payment_unique   UNIQUE (customer_ID, card_num)
);

INSERT INTO payment_method (customer_ID, payment_name, provide, card_num, card_exp_date, default_payment) 
VALUES 
    (1, 'Visa', 'Visa', '1234567890123456', 2503, TRUE),
    (1, 'Mastercard', 'Mastercard', '2345678901234567', 2504, FALSE),
    (1, 'American Express', 'American Express', '345678901234567', 2505, FALSE),
    (2, 'Visa', 'Visa', '4567890123456789', 2408, TRUE),
    (2, 'Mastercard', 'Mastercard', '5678901234567890', 2412, FALSE),
    (3, 'Visa', 'Visa', '7890123456789012', 2409, TRUE),
    (3, 'Discover', 'Discover', '8901234567890123', 2405, FALSE),
    (4, 'Visa', 'Visa', '3456789012345678', 2306, TRUE),
    (5, 'Mastercard', 'Mastercard', '4567890123456789', 2310, TRUE),
    (6, 'American Express', 'American Express', '567890123456789', 2308, FALSE),
    (7, 'Visa', 'Visa', '1234567890123456', 2202, TRUE),
    (8, 'Mastercard', 'Mastercard', '2345678901234567', 2205, TRUE),
    (9, 'Visa', 'Visa', '3456789012345678', 2206, FALSE),
    (10, 'Discover', 'Discover', '4567890123456789', 2109, TRUE),
    (11, 'Mastercard', 'Mastercard', '5678901234567890', 2108, TRUE),
    (12, 'Visa', 'Visa', '7890123456789012', 2107, FALSE),
    (13, 'American Express', 'American Express', '345678901234567', 2006, TRUE),
    (14, 'Visa', 'Visa', '4567890123456789', 2004, FALSE),
    (15, 'Mastercard', 'Mastercard', '5678901234567890', 2003, TRUE),
    (16, 'Visa', 'Visa', '1234567890123456', 1905, TRUE),
    (17, 'Discover', 'Discover', '2345678901234567', 1904, TRUE),
    (18, 'American Express', 'American Express', '345678901234567', 1902, FALSE),
    (19, 'Mastercard', 'Mastercard', '4567890123456789', 1809, TRUE),
    (20, 'Visa', 'Visa', '5678901234567890', 1808, FALSE),
    (21, 'Visa', 'Visa', '1234567890123456', 1707, TRUE),
    (22, 'Mastercard', 'Mastercard', '2345678901234567', 1706, TRUE),
    (23, 'American Express', 'American Express', '345678901234567', 1705, FALSE),
    (24, 'Visa', 'Visa', '4567890123456789', 1608, TRUE),
	(25, 'Mastercard', 'Mastercard', '1234567812345678', 1125, true),
(25, 'Visa', 'Visa', '8765432187654321', 0524, false),
(25, 'American Express', 'Amex', '1111222233334444', 0127, false),
(29, 'PayPal', 'PayPal', 'paypal@customer.com', null, false),
(29, 'Apple Pay', 'Apple', 'applepay@customer.com', null, false),
(28, 'Visa', 'Visa', '4321123456789012', 0922, true),
(28, 'Mastercard', 'Mastercard', '9876543210987654', 0526, false),
(26, 'Discover', 'Discover', '6011123456789012', 1023, false),
(27, 'American Express', 'Amex', '4444333322221111', 0726, true),
(27, 'PayPal', 'PayPal', 'paypal@customer.com', null, false);

CREATE SEQUENCE brand_vendor_id_seq;
CREATE TABLE brand_vendor (
  ID                                BIGSERIAL,
  brand_name                        VARCHAR(100) NOT NULL,
  CONSTRAINT brand_ID               PRIMARY KEY(ID),
  CONSTRAINT unique_brand_name      UNIQUE(brand_name)
);

INSERT INTO brand_vendor (brand_name) VALUES
  ('Kellogg''s'), ('General Mills'), ('Nestle'), ('Kraft Heinz'), ('Conagra Brands'),
  ('Nike'), ('Adidas'), ('Levi''s'), ('GAP'), ('H&M'),
  ('Apple'), ('Samsung'), ('Sony'), ('LG'), ('Panasonic'),
  ('Procter & Gamble'), ('Unilever'), ('Clorox'), ('Colgate-Palmolive'), ('SC Johnson');

CREATE SEQUENCE product_categories_id_seq;
CREATE TABLE product_categories (
  ID                                  SERIAL,
  cat_name                            VARCHAR(100) NOT NULL,
  description_text                    VARCHAR(1000),   
  CONSTRAINT cat_ID                   PRIMARY KEY(ID),
  CONSTRAINT unique_cat_ID            UNIQUE(cat_name, description_text)
);

INSERT INTO product_categories (cat_name, description_text) VALUES
  ('Food', 'Edible products intended for consumption'),
  ('Clothing', 'Apparel items intended to be worn on the body'),
  ('Electronics', 'Devices that use electricity and perform various functions'),
  ('Cleaning', 'Products used for cleaning and maintaining hygiene');

CREATE SEQUENCE product_variation_id_seq;
CREATE TABLE product_variation (
  ID                            BIGSERIAL,
  var_name                      VARCHAR(100),
  var_description               VARCHAR(1000),
  price                         NUMERIC(10,2),
  cat_ID           			        INTEGER NOT NULL REFERENCES product_categories(ID),
  brand_ID         			        INTEGER REFERENCES brand_vendor(ID),
  CONSTRAINT var_ID             PRIMARY KEY(ID),
  CONSTRAINT unique_var_ID      UNIQUE(var_name, var_description, price, cat_ID, brand_ID)
);

INSERT INTO product_variation (var_name, var_description, price, cat_ID, brand_ID)
VALUES
  ('Frosted Flakes Cereal', '14oz box of frosted corn flakes', 3.99, 1, 1),
  ('Cheerios Cereal', '12oz box of whole grain oat cereal', 4.99, 1, 2),
  ('KitKat Bar', '1.5oz milk chocolate wafer candy bar', 0.99, 1, 3),
  ('Kraft Mac and Cheese', '7.25oz box of classic macaroni and cheese', 1.99, 1, 4),
  ('Prego Spaghetti Sauce', '24oz jar of traditional pasta sauce', 2.99, 1, 5),
  ('Nike Air Max Sneakers', 'Men''s black and white running shoes', 119.99, 2, 6),
  ('Adidas Superstar Sneakers', 'Women''s white and black leather shoes', 99.99, 2, 7),
  ('Levi''s 501 Jeans', 'Men''s blue denim straight leg jeans', 69.99, 2, 8),
  ('Gap T-Shirt', 'Women''s pink crew neck cotton t-shirt', 19.99, 2, 9),
  ('H&M Hoodie', 'Men''s gray cotton pullover hoodie', 29.99, 2, 10),
  ('Apple iPhone 13', '6.1-inch screen with A15 Bionic chip', 799.99, 3, 11),
  ('Samsung Galaxy S21', '6.2-inch screen with Snapdragon 888 processor', 899.99, 3, 12),
  ('Sony Playstation 5', 'Gaming console with 4K HDR and 825GB SSD', 499.99, 3, 13),
  ('LG OLED TV', '55-inch 4K smart TV with webOS', 1399.99, 3, 14),
  ('Panasonic Lumix Camera', '20.1MP digital camera with Leica lens', 799.99, 3, 15),
  ('Tide Laundry Detergent', '100oz bottle of liquid detergent', 11.99, 4, 16),
  ('Windex Glass Cleaner', '23oz spray bottle of ammonia-free cleaner', 3.99, 4, 17),
  ('Lysol Disinfecting Spray', '12.5oz can of disinfectant spray', 5.99, 4, 18),
  ('Clorox Bleach', '121oz bottle of concentrated bleach', 4.99, 4, 19),
  ('Colgate Total Toothpaste', '6oz tube of cavity protection toothpaste', 2.99, 4, 20),
  ('Fruit Loops Cereal', '12.2oz box of fruit flavored cereal', 3.99, 1, 1),
  ('Lucky Charms Cereal', '11.5oz box of frosted oat cereal with marshmallows', 4.99, 1, 2),
  ('Reese''s Peanut Butter Cups', '1.5oz milk chocolate and peanut butter candy', 0.99, 1, 3);

CREATE SEQUENCE product_id_seq;
CREATE TABLE product(
ID SERIAL,
quantity INTEGER,
store_ID INTEGER REFERENCES specific_stores(ID),
var_ID INTEGER REFERENCES product_variation(ID),
prod_image TEXT,
CONSTRAINT product_ID PRIMARY KEY (ID)
);

INSERT INTO product (quantity, store_ID, var_ID, prod_image)
VALUES
(10, 1, 1, 'https://www.shutterstock.com/shutterstock/photos/630528716/display_1500/stock-photo-alameda-ca-april-box-of-kellogg-s-brand-frosted-flakes-cereal-original-flavor-630528716.jpg'),
(5, 1, 2, 'https://www.shutterstock.com/shutterstock/photos/312230756/display_1500/stock-photo-spencer-wisconsin-september-box-of-cheerios-cereal-cheerios-is-manufactured-by-312230756.jpg'),
(20, 2, 6, 'https://www.shutterstock.com/shutterstock/photos/1412330987/display_1500/stock-photo-vienna-austria-august-nike-air-max-mesh-white-bue-and-red-sneaker-on-white-1412330987.jpg'),
(15, 2, 7, 'https://www.shutterstock.com/shutterstock/photos/2278627351/display_1500/stock-photo-kent-uk-adidas-originals-superstar-white-and-black-stripes-trainers-shoes-hip-hop-2278627351.jpg'),
(8, 3, 11, 'https://www.shutterstock.com/shutterstock/photos/2094529528/display_1500/stock-photo-new-york-usa-december-front-and-rear-view-of-sierra-blue-color-iphone-max-pro-with-2094529528.jpg'),
(3, 3, 12, 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6468/6468291cv18d.jpg;maxHeight=640;maxWidth=550'),
(1, 4, 16, 'https://www.shutterstock.com/shutterstock/photos/2207256281/display_1500/stock-photo-al-ahsa-saudi-arabia-september-famous-brand-for-powder-laundry-detergent-known-as-tide-2207256281.jpg'),
(2, 4, 17, 'https://www.shutterstock.com/shutterstock/photos/1911232684/display_1500/stock-photo-new-jersey-usa-february-a-spray-bottle-of-windex-window-cleaner-1911232684.jpg'),
(4, 5, 19, 'https://www.shutterstock.com/shutterstock/photos/1669514815/display_1500/stock-photo-fort-myers-fl-usa-clorox-disinfecting-wipes-kills-bacteria-and-viruses-the-clorox-1669514815.jpg'),
(7, 5, 20, 'https://www.shutterstock.com/shutterstock/photos/1946117638/display_1500/stock-photo-moscow-russia-march-packaging-of-colgate-triple-action-extra-whitening-toothpaste-with-1946117638.jpg'),
(6, 1, 3, 'https://www.shutterstock.com/shutterstock/photos/772017133/display_1500/stock-photo-london-uk-december-kit-kat-chocolate-bar-on-white-background-bars-kit-kat-is-produced-772017133.jpg'),
(12, 1, 4, 'https://www.shutterstock.com/shutterstock/photos/1808948896/display_1500/stock-photo-a-box-of-kraft-macaroni-and-cheese-isolated-on-white-for-illustrative-editorial-1808948896.jpg'),
(2, 2, 8, 'https://www.shutterstock.com/shutterstock/photos/2153591613/display_1500/stock-photo-blue-folded-denim-jeans-isolated-on-white-background-2153591613.jpg'),
(5, 2, 9, 'https://www.shutterstock.com/shutterstock/photos/1408369454/display_1500/stock-photo-men-s-white-blank-t-shirt-template-from-two-sides-natural-shape-on-invisible-mannequin-for-your-1408369454.jpg'),
(4, 3, 14, 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6501/6501940_rd.jpg;maxHeight=2000;maxWidth=2000'),
(9, 3, 15, 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/7588/7588027_sd.jpg;maxHeight=2000;maxWidth=2000'),
(10, 4, 18, 'https://www.shutterstock.com/shutterstock/photos/1700101804/display_1500/stock-photo-millburn-new-jersey-usa-april-a-can-of-lysol-disinfectant-spray-on-a-white-background-1700101804.jpg'),
(15, 5, 1, 'https://www.shutterstock.com/shutterstock/photos/210103132/display_1500/stock-photo-spencer-wisconsin-aug-box-of-kellogg-s-fruit-loops-cereal-kellogg-s-is-an-american-210103132.jpg'),
(20, 5, 2, 'https://www.shutterstock.com/shutterstock/photos/761383612/display_1500/stock-photo-winneconne-wi-november-a-box-of-lucky-charms-with-three-new-rainbow-marshmallows-on-an-761383612.jpg');



CREATE SEQUENCE customer_cart_id_seq;
CREATE TABLE customer_cart(
    ID                          SERIAL,
    create_at                   INTEGER,
    product_ID                  INTEGER REFERENCES product(ID),
    customer_ID                 INTEGER REFERENCES customer(ID),
    CONSTRAINT cart_ID          PRIMARY KEY (ID)
);

CREATE SEQUENCE customer_order_seq;
CREATE TABLE customer_order (
    ID                          SERIAL,
    customer_ID                 INTEGER REFERENCES customer(ID),
    order_date                  DATE,
    order_total                 NUMERIC(10, 2),
    address_ID                  INTEGER REFERENCES address(ID),
    store_ID                    INTEGER REFERENCES specific_stores(ID),
    cart_ID                     INTEGER REFERENCES customer_cart(ID),
    CONSTRAINT order_ID         PRIMARY KEY (ID)  
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


