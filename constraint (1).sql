CREATE TABLE Supplier_2(
supplier_id numeric(10) not null,
supplier_name varchar2(50) not null,
contact_name varchar2(50) DEFAULT ('Aroosha'),
CONSTRAINT supplier_unique UNIQUE(supplier_id)
);
