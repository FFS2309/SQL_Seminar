-- 64.
ALTER TABLE EMPLOYEES ADD URLAUBSTAGE NUMBER;
-- 65.
CREATE TABLE PROJEKTE
(
    Projektnummer NUMBER,
    Bezeichnung   VARCHAR(255)
);

CREATE TABLE PROJEKTMITARBEIT
(
    Projektnummer NUMBER,
    EMPLOYEE_ID   NUMBER
);

INSERT ALL
    INTO PROJEKTE (Projektnummer, Bezeichnung) VALUES (1, 'SQL Datenbank aufsetzen')
    INTO PROJEKTE (Projektnummer, Bezeichnung) VALUES (2, 'SQL Abfragen erstellen')
    SELECT 1 FROM DUAL;

INSERT ALL
    INTO PROJEKTMITARBEIT(Projektnummer, EMPLOYEE_ID) VALUES (1, 100)
    INTO PROJEKTMITARBEIT VALUES (1, 101)
    INTO PROJEKTMITARBEIT VALUES (1, 102)
    INTO PROJEKTMITARBEIT VALUES (2, 103)
    INTO PROJEKTMITARBEIT VALUES (2, 104)
    INTO PROJEKTMITARBEIT VALUES (2, 102)
    INTO PROJEKTMITARBEIT VALUES (2, 101)
    SELECT 1 FROM DUAL;
-- 66.
CREATE TABLE DEPARTMENT_LOCATIONS AS (
    SELECT DEPARTMENT_ID, LOCATION_ID
    FROM DEPARTMENTS
);