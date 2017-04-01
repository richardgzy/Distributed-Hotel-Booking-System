create or replace PROCEDURE  CHECK_CREDIT 
(
  NEW_CREDIT IN NUMBER 
, NEW_TIER out customer.membership_tier%type 
) AS 

BEGIN
        if new_credit >= 300 then
                new_tier := 'Platinum';
                elsif new_credit >= 200 then
                        new_tier := 'Gold';
                elsif new_credit >= 100 then
                        new_tier := 'Silver'; 
                        else new_tier := 'Bronze'; 
        end if;  
END CHECK_CREDIT;
