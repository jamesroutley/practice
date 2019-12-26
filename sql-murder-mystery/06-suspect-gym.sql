select
  person.name
from
  get_fit_now_member
  left join get_fit_now_check_in on get_fit_now_member.id = get_fit_now_check_in.membership_id
  left join person on get_fit_now_member.person_id = person.id
  left join drivers_license on drivers_license.id = person.license_id
where
  membership_status = 'gold'
  and get_fit_now_member.id like '48Z%'
  and check_in_date = '20180109'
  and check_in_time < 1700
  and check_out_time > 1600
  and drivers_license.plate_number like '%H42W%'
  /* Jeremy Bowers */
