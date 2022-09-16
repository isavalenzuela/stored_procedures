
-- create
CREATE TABLE students (
	user_id serial PRIMARY KEY,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	name VARCHAR ( 50 ) UNIQUE NOT NULL,
	batch VARCHAR ( 50 ) NOT NULL,
	htmlcss_score BOOLEAN NULL,
	js_score BOOLEAN NULL,
	react_score BOOLEAN NULL,
	backend_score BOOLEAN NULL,
	get_certificate BOOLEAN NULL
);

-- insert

INSERT INTO 
    students (email, name, batch, htmlcss_score, js_score, react_score, backend_score, get_certificate)
VALUES
    ('andres@gmail.com','Andres Perez', 1, true, true, true, true, false),
    ('pedrito@gmail.com','Pedro Gonzalez', 1, true, true, true, true, false),
    ('elena@gmail.com','Elena Gonzalez', 2, true, true, true, true, false),
    ('constanza@gmail.com','Constanza Perez', 2, true, true, true, true, false),
    ('andrea@gmail.com','Andrea Gonzalez', 3, true, true, true, true, false),
    ('maria@gmail.com','Maria Torres', 3, true, true, true, true, false);

-- fetch 
SELECT * FROM students;

-- stored procedure
create or replace procedure certificate(
   htmlcss_score BOOLEAN,
   js_score BOOLEAN, 
   react_score BOOLEAN,
   backend_score BOOLEAN,
   get_certificate BOOLEAN
)
language plpgsql    
as $$
begin
    -- activating certificate
    update students 
    set get_certificate = true 
    where htmlcss_score = true AND js_score = true AND react_score = true AND backend_score = true;

    commit;
end;$$

CALL certificate(true, true, true, true, true);
