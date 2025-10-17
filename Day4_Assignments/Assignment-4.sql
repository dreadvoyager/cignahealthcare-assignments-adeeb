DECLARE
    TYPE average_score IS TABLE OF NUMBER
    INDEX BY VARCHAR2(50);
    
    avg_stud_score average_score;
    v_student_name VARCHAR(50);
    v_student_count NUMBER := 0;
    Totalmarks NUMBER := 0;
    AvgMarks NUMBER;
BEGIN
    avg_stud_score('Krishi') := 87;
    avg_stud_score('Hemant') := 76
    avg_stud_score('Lata') := 93;
    avg_stud_score('Maya') := 87;
    avg_stud_score('Aryan') := 88;

    v_student_name := avg_stud_score.FIRST;
        
        WHILE v_student_name IS NOT NULL LOOP
            DBMS_OUTPUT.PUT_LINE('Name: ' || RPAD(v_student_name, 15) || '|Mark: ' || avg_stud_score(v_student_name));
            
            TotalMarks := TotalMarks + avg_stud_score(v_student_name);
            v_student_count := v_student_count + 1;
            
            v_student_name := avg_stud_score.NEXT(v_student_name);
        END LOOP;
        
        If v_student_count > 0 THEN
            AvgMarks := TotalMarks / v_student_count;
        
        DBMS_OUTPUT.PUT_LINE('Total marks sum ' || TotalMarks);
        DBMS_OUTPUT.PUT_LINE('Average marks  ' || Round(AvgMarks,2));
    END IF;
    END;
