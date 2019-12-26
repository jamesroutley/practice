SELECT
  *
FROM
  person
LEFT JOIN interview
ON person.id = interview.person_id
WHERE
  address_street_name = 'Northwestern Dr'
  AND address_number = (
    SELECT
      MAX(address_number)
    FROM
      person
    where
      address_street_name = 'Northwestern Dr'
  )

/* 14887|Morty Schapiro|118009|4919|Northwestern Dr|111564949|14887|I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W". */
