SET SERVEROUTPUT ON;
DECLARE
    v_casevar NUMBER NOT NULL := 1;
BEGIN
    GOTO g_label_1;
    
    <<g_label_2>>
    CASE v_casevar
        WHEN 0 THEN
            dbms_output.put_line('Case 0');
        WHEN 1 THEN
            dbms_output.put_line('Case 1');
        WHEN 2 THEN
            dbms_output.put_line('Case 2');
        ELSE
            dbms_output.put_line('Nothing');
    END CASE;
    
    GOTO g_label_end;
    
    <<g_label_1>>
    dbms_output.put_line('GOTO Label 1');
    
    GOTO g_label_2;
    
    <<g_label_end>>
    NULL;
END;

DECLARE
    t_loop_var NUMBER NOT NULL := 0;
BEGIN
    LOOP
        t_loop_var := t_loop_var + 1;
        IF t_loop_var > 5 THEN
            EXIT;
        END IF;
        dbms_output.put_line(t_loop_var);
    END LOOP;
END;

DECLARE
    t_loop_var_2 NUMBER NOT NULL := 10;
BEGIN
    <<loop_A>> LOOP
    IF t_loop_var_2 = 0 THEN
        EXIT;
    END IF;
        dbms_output.put_line(t_loop_var_2);
        t_loop_var_2 := t_loop_var_2 - 1;
    END LOOP loop_A;
END;

DECLARE
    t_loop_var_2 NUMBER NOT NULL := 10;
BEGIN
    <<loop_A>> LOOP
    EXIT WHEN t_loop_var_2 = 0;
    dbms_output.put_line(t_loop_var_2);
    t_loop_var_2 := t_loop_var_2 - 1;
    END LOOP loop_A;
END;

BEGIN
  FOR l_counter IN 1..5
  LOOP
    DBMS_OUTPUT.PUT_LINE( l_counter );
  END LOOP;
END;

DECLARE
  l_step  PLS_INTEGER := 2;
BEGIN
  FOR l_counter IN 1..5 LOOP
    dbms_output.put_line (l_counter*l_step);
  END LOOP;
END;

<<outer>>
DECLARE
  l_counter PLS_INTEGER := 10;
BEGIN
  FOR l_counter IN 1.. 5 loop
    DBMS_OUTPUT.PUT_LINE ('Local counter:' ||  l_counter);
    outer.l_counter := l_counter;
  end loop;
  -- after the loop
  DBMS_OUTPUT.PUT_LINE ('Global counter' || l_counter);
END outer;

BEGIN
  FOR l_counter IN REVERSE 1..3
  LOOP
    DBMS_OUTPUT.PUT_LINE( l_counter );
  END LOOP;
END;

BEGIN
    FOR n_index IN 1 .. 20
    LOOP
        IF MOD( n_index, 2) = 1 THEN
        CONTINUE;
        END IF;
    dbms_output.put_line( n_index );
    END LOOP;
END;

BEGIN
  FOR n_index IN 1 .. 10
  LOOP
    -- skip even numbers
    CONTINUE
  WHEN MOD( n_index, 2 ) = 0;
    DBMS_OUTPUT.PUT_LINE( n_index );
  END LOOP;
END;
