DROP TABLE rentals;
DROP TABLE customers;
DROP TABLE stock_items;

CREATE TABLE customers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE stock_items(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  category VARCHAR(255),
  size VARCHAR(255)
);

CREATE TABLE rentals(
  id SERIAL8 PRIMARY KEY,
  customer_id INT8 REFERENCES customers(id),
  stock_item_id INT8 REFERENCES stock_items(id)
);
