SELECT E.UIDCODE, S.STUDENTNAME
FROM ENROLLS E JOIN STUDENT S ON E.UIDCODE = S.UIDCODE
WHERE E.DEPTCODE = 'CmpS' AND E.COURSEID = 450 
INTERSECT
SELECT T.UIDCODE, S.STUDENTNAME
FROM TRANSCRIPT T JOIN STUDENT S ON T.UIDCODE = S.UIDCODE
WHERE T.COURSEID >= 300 AND COURSEID < 400;


SELECT DEPTCODE, COUNT(*) COUNTENROLLMENT
FROM ENROLLS 
GROUP BY  DEPTCODE
HAVING COUNT(*)  >= ALL
(SELECT COUNT(*)
FROM ENROLLS
GROUP BY DEPTCODE);

SELECT DEPTNAME
FROM SECTION S JOIN DEPARTMENT D ON S.DEPTCODE = D.DEPTCODE 
GROUP BY  S.COURSEID, S.DEPTCODE, D.DEPTNAME
HAVING COUNT(*)  > 3;


SELECT D.DEPTNAME, E.DEPTCODE, COUNT(*)  TOTAL
FROM ENROLLS E JOIN DEPARTMENT D ON E.DEPTCODE = D.DEPTCODE
GROUP BY E.DEPTCODE,  E.COURSEID, D.DEPTNAME;


SELECT S.UIDCODE, S.STUDENTNAME
FROM STUDENT S
WHERE (ACADEMICSTATUS = 'freshman' OR ACADEMICSTATUS = 'sophomore' OR ACADEMICSTATUS = 'junior' OR ACADEMICSTATUS = 'senior') AND S.UIDCODE IN
(SELECT E.UIDCODE
FROM ENROLLS E JOIN COURSE C ON E.COURSEID = C.COURSEID
GROUP BY E.UIDCODE, C.NUMCREDITS
HAVING COUNT(*) < 12);


(SELECT SECTION.FACULTYID#, NAME
FROM SECTION JOIN FACULTY ON SECTION.FACULTYID# = FACULTY.FACULTYID#)
INTERSECT
(SELECT CHAIRS_FACULTYID# AS FACULTYID#, NAME
FROM DEPARTMENT JOIN FACULTY ON DEPARTMENT.CHAIRS_FACULTYID# = FACULTY.FACULTYID#);


SELECT S.STUDENTNAME, S.UIDCODE, S.DEPTCODE
FROM STUDENT S, ENROLLS E
WHERE S.DEPTCODE != E.DEPTCODE AND S.UIDCODE = E.UIDCODE 
UNION
SELECT S.STUDENTNAME, S.UIDCODE, S.DEPTCODE
FROM STUDENT S, TRANSCRIPT T
WHERE S.DEPTCODE != T.DEPTCODE AND S.UIDCODE = T.UIDCODE;


SELECT DISTINCT DEPTCODE_COURSE, COURSEID_COURSE, C.TITLE
FROM REQUIRES JOIN COURSE C ON REQUIRES.DEPTCODE_COURSE = C.DEPTCODE AND REQUIRES.COURSEID_COURSE = C.COURSEID
WHERE DEPTCODE_COURSE = 'CmpS' AND COURSEID_COURSE >= 400 AND COURSEID_COURSE < 500 AND DEPTCODE_PREREQUISITE = 'CmpS' AND EXISTS
(SELECT DEPTCODE DEPTCODE_PREREQUISITE, COURSEID COURSEID_PREREQUISITE
FROM COURSE
WHERE DEPTCODE = 'CmpS' AND COURSEID >= 300 AND COURSEID < 400);


SELECT T.UIDCODE, S.STUDENTNAME
FROM TRANSCRIPT T JOIN STUDENT S ON T.UIDCODE = S.UIDCODE
INTERSECT
(SELECT E.UIDCODE, STUDENTNAME
FROM ENROLLS E JOIN STUDENT S ON E.UIDCODE = S.UIDCODE);


(SELECT E.DEPTCODE DCODE, E.COURSEID CNO, E.UIDCODE STUDENT
FROM ENROLLS E JOIN REQUIRES R ON E.DEPTCODE = R.DEPTCODE_COURSE AND E.COURSEID = R.COURSEID_COURSE)
MINUS
(SELECT  T. DEPTCODE, T.COURSEID CNO, T.UIDCODE STUDENT
FROM COURSE C, TRANSCRIPT T
WHERE T.DEPTCODE = C.DEPTCODE AND T.COURSEID = C.COURSEID);





