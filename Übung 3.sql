-- 3.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES ORDER BY LAST_NAME;
-- 4.
SELECT * FROM JOB_HISTORY WHERE EMPLOYEE_ID = 200;
-- 5.
SELECT EMPLOYEE_ID, SALARY, (SALARY*1.04) AS "Salary um 4% erhöht" FROM EMPLOYEES;
-- 6.
SELECT EMPLOYEE_ID, SALARY FROM EMPLOYEES WHERE SALARY < 4000;
-- 7.
SELECT EMPLOYEE_ID, SALARY FROM EMPLOYEES WHERE SALARY BETWEEN 2000 AND 4000;
-- 8.
SELECT * FROM JOBS ORDER BY MAX_SALARY DESC;
-- 9.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID = 108 OR EMPLOYEE_ID = 108;
-- 10.
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE 'G%';