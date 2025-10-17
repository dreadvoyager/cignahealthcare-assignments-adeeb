DECLARE
    TYPE country_capital_table IS TABLE OF VARCHAR2(50)
    INDEX BY VARCHAR2(50);
    
    country_capitals country_capital_table;
    v_country VARCHAR2(50);
    
BEGIN
        country_capitals('India') := 'New Delhi';
        country_capitals('France') := ' Paris';
        country_capitals('Japan') := 'Tokyo';
        country_capitals(' Australia') := 'Canberra';
        country_capitals('Brazil') := 'Brasilia';
        country_capitals('Canada') := 'Ottawa';
        country_capitals('Germany') := 'Berlin';
        
        v_country := '&country';
        IF country_capitals.EXISTS(v_country) THEN
            DBMS_Output.PUT_LINE('The Capital of ' || v_country || ' is ' || country_capitals(v_country));
        ELSE
            DBMS_OUTPUT.PUT_LINE('Country Not Found');
        END IF;
END;
