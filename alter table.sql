CREATE TABLE products_1
(
product_id numeric(10) not null,
supplier_id numeric(10) not null
);
ALTER TABLE products_1 ADD(supplier_name VARCHAR(255));

ALTER TABLE products_1 MODIFY(product_id int);

DROP TABLE products_1;
ALTER TABLE products_1 DROP COLUMN products_id;

ALTER TABLE products_1
RENAME COLUMN product_id TO p_id;

ALTER TABLE products_1 RENAME TO products_2;