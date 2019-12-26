-- Get structure of tables
SELECT sql
  FROM sqlite_master;
/* CREATE TABLE crime_scene_report ( */
/*         date integer, */
/*         type text, */
/*         description text, */
/*         city text */
/*     ) */
/* CREATE TABLE drivers_license ( */
/*         id integer PRIMARY KEY, */
/*         age integer, */
/*         height integer, */
/*         eye_color text, */
/*         hair_color text, */
/*         gender text, */
/*         plate_number text, */
/*         car_make text, */
/*         car_model text */
/*     ) */
/* CREATE TABLE person ( */
/*         id integer PRIMARY KEY, */
/*         name text, */
/*         license_id integer, */
/*         address_number integer, */
/*         address_street_name text, */
/*         ssn integer, */
/*         FOREIGN KEY (license_id) REFERENCES drivers_license(id) */
/*     ) */
/* CREATE TABLE facebook_event_checkin ( */
/*         person_id integer, */
/*         event_id integer, */
/*         event_name text, */
/*         date integer, */
/*         FOREIGN KEY (person_id) REFERENCES person(id) */
/*     ) */
/* CREATE TABLE interview ( */
/*         person_id integer, */
/*         transcript text, */
/*         FOREIGN KEY (person_id) REFERENCES person(id) */
/*     ) */
/* CREATE TABLE get_fit_now_member ( */
/*         id text PRIMARY KEY, */
/*         person_id integer, */
/*         name text, */
/*         membership_start_date integer, */
/*         membership_status text, */
/*         FOREIGN KEY (person_id) REFERENCES person(id) */
/*     ) */
/* CREATE TABLE get_fit_now_check_in ( */
/*         membership_id text, */
/*         check_in_date integer, */
/*         check_in_time integer, */
/*         check_out_time integer, */
/*         FOREIGN KEY (membership_id) REFERENCES get_fit_now_member(id) */
/*     ) */
/* CREATE TABLE income ( */
/*         ssn integer PRIMARY KEY, */
/*         annual_income integer */
/*     ) */
/* CREATE TABLE solution ( */
/*         user integer, */
/*         value text */
/*     ) */
