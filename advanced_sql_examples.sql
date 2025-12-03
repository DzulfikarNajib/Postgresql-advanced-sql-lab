-- Advanced SQL
-- Materi: JOIN, VIEW, Nested Query, Procedure, Trigger

-- 1. JOIN: Menampilkan employee beserta nama departemen
SELECT SSN, FName, LName, DName
FROM Employee JOIN Department ON DNum = DNumber
ORDER BY DNum;

-- 2. JOIN lebih kompleks: Employee yang bekerja pada proyek departemen sendiri
SELECT E.SSN, E.FName, E.LName, P.PName, D.DName
FROM Employee E
JOIN Works_On W ON E.SSN = W.ESSN
JOIN Project P ON W.PNum = P.PNumber AND E.DNum = P.DNum
JOIN Department D ON P.DNum = D.DNumber
ORDER BY P.PName;

-- 3. VIEW: Membuat view sederhana
CREATE VIEW v_nomor_nama AS
SELECT DNumber AS Nomor, DName AS Nama
FROM Department;

-- VIEW: Employee dengan total jam kerja > 120
CREATE VIEW v_employee_hours AS
SELECT E.SSN, E.FName || ' ' || E.LName AS Ename, D.DName
FROM Employee E
JOIN Works_On W ON E.SSN = W.ESSN
JOIN Department D ON E.DNum = D.DNumber
GROUP BY E.SSN, E.FName, E.LName, D.DName
HAVING SUM(W.Hours) > 120;

-- 4. Nested Query: Menampilkan proyek yang sedang dikerjakan
SELECT PName
FROM Project
WHERE PNumber IN (SELECT PNum FROM Works_On);

-- 5. Procedure: Menampilkan employee berdasarkan departemen
CREATE OR REPLACE PROCEDURE sp_employee(IN num INT)
LANGUAGE SQL
AS $$
  SELECT SSN, FName, LName, DNum
  FROM Employee
  WHERE DNum = num;
$$;

-- 6. Trigger: Mencatat perubahan salary ke EmployeeLog
CREATE TABLE EmployeeLog (
  EmployeeID CHAR(9),
  OldSalary DECIMAL(10,2),
  NewSalary DECIMAL(10,2),
  Timestamp TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_salary_update()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO EmployeeLog(EmployeeID, OldSalary, NewSalary, Timestamp)
  VALUES (OLD.SSN, OLD.Salary, NEW.Salary, CURRENT_TIMESTAMP);
  RETURN NEW;
END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER UpdateEmployeeLog
AFTER UPDATE ON Employee
FOR EACH ROW
WHEN (OLD.Salary IS DISTINCT FROM NEW.Salary)
EXECUTE FUNCTION log_salary_update();
