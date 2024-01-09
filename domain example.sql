-- Create the Object Type without the body
CREATE OR REPLACE TYPE gender_type AS OBJECT (
    gender_value VARCHAR2(10)
);
-- Create a table using the gender_type
CREATE TABLE Your_Table (
    id NUMBER,
    gender gender_type
);
-- Add a check constraint to the table to enforce the gender values
ALTER TABLE Your_Table
ADD CONSTRAINT check_gender_value CHECK (gender.gender_value IN ('male', 'female'));
-- Insert 'male' into the gender column
INSERT INTO Your_Table (id, gender) VALUES (1, gender_type('male'));
-- Insert 'female' into the gender column
INSERT INTO Your_Table (id, gender) VALUES (2, gender_type('female'));
-- Attempting to insert an invalid gender value will result in an error
INSERT INTO Your_Table (id, gender) VALUES (3, gender_type('other'));
