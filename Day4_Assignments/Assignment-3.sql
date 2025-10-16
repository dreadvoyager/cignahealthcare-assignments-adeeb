DECLARE 
     v_dept DEPARTMENTS%ROWTYPE;
BEGIN
   SELECT * INTO v_dept FROM DEPARTMENTS WHERE dept_no = 101;
   DBMS_OUTPUT.PUT_LINE('Department Name: ' || v_dept.dname || ', Location :  ' || v_dept.loc);
END;
