
CREATE TABLE accident_audit(
	id SERIAL PRIMARY KEY,
	updated TIMESTAMP,
	user_name varchar(50) NOT NULL
);

CREATE OR REPLACE FUNCTION accident1_audit() RETURNS trigger 
LANGUAGE 'plpgsql'
AS $$
BEGIN
 	INSERT INTO accident_audit(updated, user_name)
		VALUES(NOW(),  current_timestamp, user);
	RETURN NULL;
END;
$$ ;

CREATE TRIGGER accident1_update_details 
AFTER UPDATE ON accident
FOR EACH ROW EXECUTE FUNCTION accident1_audit();
