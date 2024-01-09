-- Create a new type named "gender"
CREATE OR REPLACE TYPE gender2 AS OBJECT (
    value VARCHAR2(10),
    CONSTRUCTOR FUNCTION gender2(SELF IN OUT NOCOPY gender2, value VARCHAR2)
                               RETURN SELF AS RESULT
);
-- Create a new type body for the "gender" type
CREATE OR REPLACE TYPE BODY gender2 AS
    CONSTRUCTOR FUNCTION gender2(SELF IN OUT NOCOPY gender2, value VARCHAR2) 
                               RETURN SELF AS RESULT IS
    BEGIN
        IF value IN ('male', 'female') THEN
            SELF.value := value;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Invalid gender value. Please use "male" or "female".');
        END IF;
        RETURN;
    END;
End;
-- Create a table that uses the "gender" UDT
CREATE TABLE gender_tables2 (
    gender_data gender
);
-- Insert data into the "gender_table" using constructor function
INSERT INTO gender_tables2 (gender_data)
VALUES (gender2('&gender_data'));
-- Select data from the "gender_table" and access UDT attribute
SELECT g.gender_data.value AS gender2
FROM gender_tables2 g;