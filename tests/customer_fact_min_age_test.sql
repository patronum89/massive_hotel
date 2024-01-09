select 
    age
from    
    {{ref('customer_data')}}
where
    age < 18