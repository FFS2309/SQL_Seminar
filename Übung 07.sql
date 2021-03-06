-- 37.
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID FROM EMPLOYEES);
-- 38.
SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);
-- 39.
SELECT * FROM EMPLOYEES WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Bill' AND LAST_NAME = 'Gates');
-- 40.
--      a)
SELECT AVG(SALARY), DEPARTMENT_NAME FROM EMPLOYEES e, DEPARTMENTS d WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID GROUP BY d.DEPARTMENT_NAME;
--      b)
SELECT AVG(SALARY) FROM EMPLOYEES;
--      c)
SELECT * FROM (SELECT AVG(SALARY) average, DEPARTMENT_NAME name FROM EMPLOYEES e, DEPARTMENTS d WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID GROUP BY d.DEPARTMENT_NAME) WHERE average > (SELECT AVG(SALARY) FROM EMPLOYEES);
-- 41.
SELECT DEPARTMENT_NAME, SUM(SALARY)*100/(SELECT SUM(SALARY) FROM EMPLOYEES) Anteil FROM EMPLOYEES, DEPARTMENTS WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID GROUP BY DEPARTMENT_NAME;
--SELECT SUM(Anteil) FROM (SELECT DEPARTMENT_NAME, SUM(SALARY)*100/(SELECT SUM(SALARY) FROM EMPLOYEES) Anteil FROM EMPLOYEES, DEPARTMENTS WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID GROUP BY DEPARTMENT_NAME);
-- 42.
SELECT CITY FROM EMPLOYEES e, DEPARTMENTS d, LOCATIONS l WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND l.LOCATION_ID = d.LOCATION_ID HAVING AVG(SALARY) > (SELECT AVG(SALARY) FROM EMPLOYEES) GROUP BY l.CITY;
--SELECT CITY FROM LOCATIONS where LOCATION_ID IN (SELECT DISTINCT d.LOCATION_ID FROM DEPARTMENTS d WHERE d.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID salsum FROM EMPLOYEES GROUP BY DEPARTMENT_ID))
-- 43.
--      a)
SELECT JOB_ID, MIN(e.SALARY) FROM EMPLOYEES e GROUP BY JOB_ID;
--      b)
SELECT JOB_ID, FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE (JOB_ID, SALARY) IN (SELECT JOB_ID, MIN(e.SALARY) FROM EMPLOYEES e GROUP BY JOB_ID);
-- 44. (Wofür brauche ich dafür EXISTS?)
SELECT COUNTRY_NAME FROM COUNTRIES c WHERE c.COUNTRY_ID NOT IN (SELECT DISTINCT l.COUNTRY_ID FROM DEPARTMENTS d, LOCATIONS l WHERE d.LOCATION_ID = l.LOCATION_ID);
-- 45.
--      a)
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES e GROUP BY e.JOB_ID;
--      b)
SELECT JOB_ID FROM EMPLOYEES e GROUP BY JOB_ID HAVING AVG(SALARY) = 2780;
--      c)
SELECT MIN(AVG(SALARY)) FROM EMPLOYEES e GROUP BY e.JOB_ID;
--      b+c)
SELECT JOB_ID FROM EMPLOYEES e GROUP BY JOB_ID HAVING AVG(SALARY) = (SELECT MIN(AVG(SALARY)) FROM EMPLOYEES e GROUP BY e.JOB_ID);
--      d)
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEES e GROUP BY JOB_ID HAVING AVG(SALARY) = (SELECT MIN(AVG(SALARY)) FROM EMPLOYEES e GROUP BY e.JOB_ID));
