-- Get relevant crime scene reports
SELECT
  *
FROM
  crime_scene_report
where date = '20180115' and city = 'SQL City' and type = 'murder';

/* 20180115|murder|Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".|SQL City */
