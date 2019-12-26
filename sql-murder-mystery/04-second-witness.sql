SELECT
  *
FROM
  person
LEFT JOIN interview
ON person.id = interview.person_id
WHERE
  address_street_name = 'Franklin Ave' AND
  name like '%Annabel%'

/* 16371|Annabel Miller|490173|103|Franklin Ave|318771143|16371|I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th. */
