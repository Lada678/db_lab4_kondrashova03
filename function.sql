-- Функція приймає в аргумент число яке відповідає кількості смертей та повертає усю інформацію про випадки де смертей менше або дорівнює заданій 


DROP FUNCTION IF EXISTS accident_info(int);

CREATE OR REPLACE FUNCTION accident_info(death_arg int)
    RETURNS TABLE (accident int, dat_e DATE, death  int,  country int, countryname varchar, description varchar, descriptionname varchar)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT accident_id::int, accident_date::date, accident_death::int,  a.country_id:: int, country_name::varchar, a.description_id:: varchar,  description_name::varchar
		FROM accident as a JOIN country as c ON a.country_id = c.country_id 
		JOIN description as d ON a.description_id = d.description_id 
		WHERE accident_death <= death_arg;
END;
$$;
