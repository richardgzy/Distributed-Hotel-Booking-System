--FIT5148b
create or replace TRIGGER CHECK_MONEY 
AFTER INSERT ON booking_room_guests 
for each row
BEGIN
        update booking
        set total_amount = (CHECK_OUT_DATE - CHECK_IN_DATE) * (select price from room where hotel_id = :new.hotel_id and room_number = :new.room_num) * (select discount from membership where membership_tier = (select membership_tier from customer where customer_id = (select customer_id from booking where booking_id = :new.booking_id)))
        where booking_id = :new.booking_id;
END;
