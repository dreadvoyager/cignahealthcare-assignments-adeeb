--Create Tables--

CREATE TABLE Dept(
  Deptno NUMBER PRIMARY KEY,
  Dname VARCHAR(50),
  Loc VARCHAR(50)
  );

CREATE TABLE Emps(
  Empno NUMBER PRIMARY KEY,
  Ename VARCHAR(50),
  Job VARCHAR(50),
  Sal NUMBER,
  Deptno NUMBER,
  CONSTRAINT fk_dept FOREIGN KEY (Deptno) REFERENCES Dept(Deptno) ON DELETE CASCADE
  );
  
  
--Insert Data--

INSERT INTO Dept(Deptno, Dname, Loc) VALUES (101, 'Operations', 'Gurugram');
INSERT INTO Dept(Deptno, Dname, Loc) VALUES (102, 'Sales', 'Delhi');
INSERT INTO Dept(Deptno, Dname, Loc) VALUES (103, 'Engineering', 'Hyderabad');
INSERT INTO Dept(Deptno, Dname, Loc) VALUES (104, 'Cloud', 'Bengaluru');
INSERT INTO Dept(Deptno, Dname, Loc) VALUES (105, 'DevOps', 'Pune');

SELECT * FROM Dept;

INSERT INTO Emps(Empno, Ename, Job, Sal, Deptno) VALUES (1, 'Harsha', 'App Developer', '50000',103);
INSERT INTO Emps(Empno, Ename, Job, Sal, Deptno) VALUES (2, 'Vinisha', 'Cloud Developer', '30000',104);
INSERT INTO Emps(Empno, Ename, Job, Sal, Deptno) VALUES (3, 'Somesh', 'Analyst', '20000',101);
INSERT INTO Emps(Empno, Ename, Job, Sal, Deptno) VALUES (4, 'Kajal', 'DevOps Engineer', '60000',105);
INSERT INTO Emps(Empno, Ename, Job, Sal, Deptno) VALUES (5, 'Payal', 'Sales Analyst', '10000',102);

SELECT * FROM Emps;


--Queries--
SELECT e.Ename, d.Dname FROM Emps e
INNER JOIN Dept d
ON e.Deptno = d.Deptno;

SELECT e.Ename, e.Job, d.Loc FROM Emps e
INNER JOIN Dept d
ON e.Deptno = d.Deptno;

SELECT e.Ename FROM Emps e
INNER JOIN Dept d
ON e.Deptno = d.Deptno
WHERE d.Dname = 'Sales';

SELECT e.Ename, d.Dname, d.Loc FROM Emps e
RIGHT JOIN Dept d
ON e.Deptno = d.Deptno;

SELECT * FROM Emps e
LEFT JOIN Dept d
ON e.Deptno = d.Deptno;

SELECT d.Dname, SUM(Sal) as Total_Salary FROM Emps e
RIGHT JOIN Dept d
ON e.Deptno = d.Deptno
GROUP BY d.Dname;

SELECT d.Dname, count(e.Empno) FROM Emps e
RIGHT JOIN Dept d
ON e.Deptno = d.Deptno
GROUP BY d.Dname
HAVING count(e.Empno)>3 ;

SELECT e.Empno, e.Ename FROM Emps e
INNER JOIN Dept d
ON e.Deptno = d.Deptno
WHERE d.Loc IN (SELECT Loc FROM Dept WHERE Dname = 'Sales');

SELECT e.Ename, d.Dname, MAX(Sal) as Highest_Salary FROM Emps e
INNER JOIN Dept d
ON e.Deptno = d.Deptno
GROUP BY d.Dname, e.Ename;

SELECT e.Empno, e.Ename, e.Sal, e.Deptno, d.Dname FROM Emps e
INNER JOIN Dept d
ON e.Deptno=d.Deptno 
WHERE e.Sal > (SELECT AVG(e1.Sal) FROM Emps e1
WHERE e1.Deptno=e.Deptno)

