
-- fetch 
SELECT * FROM students;

-- stored procedure
create or replace procedure certificate(
   value BOOLEAN
)
language plpgsql    
as $$
begin
    -- activating certificate
    update students 
    set get_certificate = value 
    where htmlcss_score = true AND js_score = true AND react_score = true AND backend_score = true;

    commit;
end;$$

CALL certificate(true);
DROP PROCEDURE certificate(boolean);