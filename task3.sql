CREATE OR REPLACE PROCEDURE UPDATE_EMAIL 
(
  C_ID IN customer.customer_id%type 
, NEW_EMAIL_ADD IN CUSTOMER.EMAIL%type 
) AS 
BEGIN
        update customer
        set email = new_email_add
        where customer_id = c_id;
END UPDATE_EMAIL;
