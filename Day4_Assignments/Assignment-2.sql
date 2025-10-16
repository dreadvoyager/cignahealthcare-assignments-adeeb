DECLARE
  emp_name VARCHAR(50);
  salary NUMBER;
  bonus NUMBER;
BEGIN 
  emp_name := 'Vinni';
  salary := 50000;
  IF salary > 50000 THEN
    bonus := 0.10*salary;
  ELSE
    bonus := 0.15*salary;
  END IF;
   DBMS_OUTPUT.PUT_LINE('Name : ' || emp_name);
   DBMS_OUTPUT.PUT_LINE('Salary : ' || salary);
   DBMS_OUTPUT.PUT_LINE('Bonus : ' || bonus);
END;
