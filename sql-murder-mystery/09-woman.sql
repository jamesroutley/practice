with event_count as (
  select
    person_id,
    count(date) as num_events
  from
    facebook_event_checkin
  where
    event_name = 'SQL Symphony Concert'
    and date between 20171201
    and 20171231
  group by
    person_id
)
select
  person.name
from
  person
  left join drivers_license on person.license_id = drivers_license.id
  left join event_count on person.id = event_count.person_id
where
  drivers_license.height between 65
  and 67
  and drivers_license.car_make = 'Tesla'
  and drivers_license.car_model = 'Model S'
  and drivers_license.gender = 'female'
  and drivers_license.hair_color = 'red'
  and event_count.num_events = 3
  /* Miranda Priestly */
