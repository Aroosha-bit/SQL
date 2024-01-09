CREATE TABLE Users (
    UserID NUMBER PRIMARY KEY,
    Username VARCHAR2(50) UNIQUE NOT NULL,
    Password VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    LastLogin DATE,
    Role VARCHAR2(50) DEFAULT 'User'
);

CREATE TABLE HealthData (
    DataID NUMBER PRIMARY KEY,
    UserID NUMBER REFERENCES Users(UserID),
    EntryDate DATE NOT NULL,
    FoodIntake VARCHAR2(255),
    ExerciseRoutine VARCHAR2(255),
    MedicalHistory VARCHAR2(255),
    MoodAssessment VARCHAR2(50),
    SleepPattern VARCHAR2(50),
    CONSTRAINT chk_entry_date CHECK (EntryDate <= SYSDATE)
);

CREATE TABLE Goals (
    GoalID NUMBER PRIMARY KEY,
    UserID NUMBER REFERENCES Users(UserID),
    GoalType VARCHAR2(50) NOT NULL,
    TargetValue NUMBER,
    Deadline DATE,
    Completed BOOLEAN DEFAULT FALSE,
    CONSTRAINT chk_deadline CHECK (Deadline >= SYSDATE)
);

CREATE TABLE DoctorPatientMapping (
    DoctorID NUMBER REFERENCES Users(UserID),
    PatientID NUMBER REFERENCES Users(UserID),
    PRIMARY KEY (DoctorID, PatientID)
);
CREATE TABLE Reminders (
    ReminderID NUMBER PRIMARY KEY,
    UserID NUMBER REFERENCES Users(UserID),
    ReminderText VARCHAR2(255),
    ReminderDate DATE
);
CREATE TABLE ForumPosts (
    PostID NUMBER PRIMARY KEY,
    UserID NUMBER REFERENCES Users(UserID),
    PostText VARCHAR2(1000),
    PostDate DATE,
    ParentPostID NUMBER REFERENCES ForumPosts(PostID)
);

-- Trigger: Update user's last login timestamp
CREATE OR REPLACE TRIGGER update_last_login
BEFORE UPDATE ON Users
FOR EACH ROW
BEGIN
    :NEW.LastLogin := SYSDATE;
END;
-- Stored Procedure: Insert health data
CREATE OR REPLACE PROCEDURE insert_health_data(
    p_user_id NUMBER,
    p_entry_date DATE,
    p_food_intake VARCHAR2,
    p_exercise_routine VARCHAR2,
    p_medical_history VARCHAR2,
    p_mood_assessment VARCHAR2,
    p_sleep_pattern VARCHAR2
)
AS
BEGIN
    INSERT INTO HealthData (UserID, EntryDate, FoodIntake, ExerciseRoutine, MedicalHistory, MoodAssessment, SleepPattern)
    VALUES (p_user_id, p_entry_date, p_food_intake, p_exercise_routine, p_medical_history, p_mood_assessment, p_sleep_pattern);
    COMMIT;
END insert_health_data;

-- Stored Procedure: Set or update user goals
CREATE OR REPLACE PROCEDURE set_user_goal(
    p_user_id NUMBER,
    p_goal_type VARCHAR2,
    p_target_value NUMBER,
    p_deadline DATE
)
AS
BEGIN
    INSERT INTO Goals (UserID, GoalType, TargetValue, Deadline)
    VALUES (p_user_id, p_goal_type, p_target_value, p_deadline);
    COMMIT;
END set_user_goal;
-- Join: Retrieve health data with user details
SELECT Users.Username, HealthData.EntryDate, HealthData.FoodIntake
FROM Users
JOIN HealthData ON Users.UserID = HealthData.UserID;
--send reminders--
CREATE OR REPLACE PROCEDURE send_reminders
AS
    CURSOR reminder_cursor IS
    SELECT ReminderID, UserID, ReminderText
    FROM Reminders
    WHERE ReminderDate <= SYSDATE;


    v_user_id Reminders.UserID%TYPE;
    v_reminder_text Reminders.ReminderText%TYPE;
BEGIN
    OPEN reminder_cursor;
    LOOP
        FETCH reminder_cursor INTO v_user_id, v_reminder_text;
        EXIT WHEN reminder_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Sending reminder to User ID: ' || v_user_id);
        DBMS_OUTPUT.PUT_LINE('Reminder Text: ' || v_reminder_text);

    END LOOP;
    CLOSE reminder_cursor;
END send_reminders;

-- Join: Retrieve doctor's patients
SELECT Doctors.Username AS Doctor, Patients.Username AS Patient
FROM Users Doctors
JOIN DoctorPatientMapping ON Doctors.UserID = DoctorPatientMapping.DoctorID
JOIN Users Patients ON DoctorPatientMapping.PatientID = Patients.UserID;







