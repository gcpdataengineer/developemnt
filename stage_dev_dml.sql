insert into `history_usecase_4.usecase4_history_table`
select
sha256(cust_id) as cust_id,
CONCAT(first_name,' ',last_name) AS full_name,
case gender
when 'Male' then 'Male'
when 'Female' then 'Female'
else 'Unknown'
end as gender,
ip_address,
mac_id,
split(client_name,'.')[safe_offset(0)] as client_name,
md5(mail_id) as mail_id,
case 
when url_ like 'https:%' then concat(split(url_,'//')[safe_offset(0)],'//',split(url_,'/')[safe_offset(2)])
when url_ like 'http:%' then 'null' 
end as url_,
app_name,
lpad(ph_number,14,'+91 ') as ph_number,
credit_card_band,
case
when card_isu_date like '%-%-%' then parse_date('%d-%m-%Y',card_isu_date)
when card_isu_date like '%/%/%' then parse_date('%m/%d/%Y',card_isu_date)
end as card_isu_date,
cur_code string,
stock_sym string,
valid_card string,
card_type string,
case
when valid_card like 'TRUE' and card_type like '%' then 'Valid Card'
else 'Not Valid'
end as validation,
currency_code string,
access_code string,
DATE(TIMESTAMP_SECONDS(CAST(lst_trns_dt AS INT64))) as  lst_trns_dt,
guid,
stock_sym1,
emp_role
from
`stage_usecase_4.usecase4_stage_table`
