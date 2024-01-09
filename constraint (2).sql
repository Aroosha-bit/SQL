CREATE TABLE supplier_1
( supplier_id numeric(10) not null,
 supplier_name varchar2(50) not null,
 contact_name varchar2(50)
);
CREATE TABLE products_1
(
product_id numeric(10) not null,
supplier_id numeric(10) not null
);
ALTER TABLE supplier_1
ADD CONSTRAINT supplier_pk1 PRIMARY KEY (supplier_id);
ALTER TABLE products_1
ADD CONSTRAINT fk_supplier1 FOREIGN KEY (supplier_id)
REFERENCES supplier_1(supplier_id);


