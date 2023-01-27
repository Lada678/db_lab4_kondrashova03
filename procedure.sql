-- Додає новій рядок в accident з теперішнім часом

DROP PROCEDURE IF EXISTS insert_accident(integer, int);

CREATE OR REPLACE PROCEDURE insert_accident(accid_arg integer, country_id_arg int, descrip_id_arg varchar)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO accident(accident_id, accident_date, country_id, description_id ) VALUES (accid_arg, CURRENT_DATE, country_id_arg, descrip_id_arg );
END;
$$;
