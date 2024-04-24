DELETE FROM h57dbanew.M_EMP;

DO $$

DECLARE
	counter integer := 2;
DECLARE 
	empId TEXT := LPAD((11110 + counter)::TEXT, 10, '0');
DECLARE
	empCd TEXT := (11110 + counter)::TEXT; 
BEGIN
    WHILE counter < 52 LOOP 
        empId := LPAD((11110 + counter)::TEXT, 10, '0');
		empCd := (11110 + counter)::TEXT; 
	
        INSERT INTO h57dbanew.M_EMP (emp_id, emp_name, emp_cd, affl_cd)
        VALUES (empId, 'User' || counter, empCd, CAST((MOD(counter, 5) + 69)AS CHAR(2)));
         
        INSERT INTO h57dbanew.M_N1 (emp_id, fk_emp_id, emp_name, emp_cd, affl_cd)
        SELECT empId, empId, 'User' || counter, empCd, CAST((MOD(counter, 5) + 69)AS CHAR(2))
        WHERE NOT EXISTS (
            SELECT 1 FROM h57dbanew.M_N1 WHERE EMP_ID = empId
        );
    
        UPDATE h57dbanew.M_N1
        SET FK_EMP_ID = empId, EMP_NAME = 'User' || counter, AFFL_CD = CAST((MOD(counter, 5) + 69)AS CHAR(2))
        WHERE EMP_ID = empId AND FK_EMP_ID IS NULL;

	counter := counter + 1;
    END LOOP;
END;
$$;
