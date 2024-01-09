CREATE TABLE users001 (
    username VARCHAR2(50) PRIMARY KEY,
    password VARCHAR2(50) NOT NULL
);
INSERT INTO users001 (username, password) VALUES  ('Aroosha', '1234');
SELECT * FROM users001;