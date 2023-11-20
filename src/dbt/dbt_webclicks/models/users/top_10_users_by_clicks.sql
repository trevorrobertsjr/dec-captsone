-- List the top 10 IP addresses accessing the site that are not mulicast addresses.
-- Display the list in descending order based on the number of clicks generated by each address.
select
    ip,
    count(ip) as clicks
from {{ source('default', 'webclicks') }} 
where ip not like '233%'
group by ip
order by clicks desc
limit 10