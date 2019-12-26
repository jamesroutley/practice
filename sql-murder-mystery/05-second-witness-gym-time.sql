select
  check_in_time,
  check_out_time
from
  get_fit_now_check_in
  left join get_fit_now_member on get_fit_now_member.id = get_fit_now_check_in.membership_id
where
  get_fit_now_member.person_id = 16371

-- 1600|1700
