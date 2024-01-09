CREATE TABLE STUDENT1 (
StudentID NUMBER(20),
StudentName VARCHAR(25)
);
SELECT * FROM STUDENT1;
INSERT into STUDENT1 (StudentID, StudentName) values ('&StudentID' , '&StudentName');

CREATE TABLE FACULTY1 (
FacultyID NUMBER(20),
FacultyName VARCHAR(25)
);
SELECT * FROM FACULTY1;
INSERT into FACULTY1 (FacultyID, FacultyName) values ('&FacultyID' , '&FacultyID');

CREATE TABLE COURSE1(
CourseID NUMBER(20),
CourseName VARCHAR(25)
);
SELECT * FROM COURSE1;
INSERT into COURSE1(CourseID, CourseName) values ('&CourseID' , '&CourseName');

CREATE TABLE QUALIFIED1 (
FacultyID NUMBER(20),
CourseID VARCHAR(25),
DateQualified DATE 
);
SELECT * FROM QUALIFIED1;
INSERT into QUALIFIED1(FacultyID, CourseID ,DateQualified) values ('&FacultyID' , '&CourseID', '&DateQualified');

CREATE TABLE SECTION (
SectionNo NUMBER(20),
Semester  VARCHAR(25),
CourseID NUMBER(20)
);

CREATE TABLE REGISTRATION (
StudentID NUMBER(20),
SectionNo  VARCHAR(25),
Semester VARCHAR(30)
);