--FIT5148B
create or replace TRIGGER CHECK_OCCUPANCY 
before INSERT ON BOOKING_ROOM_GUESTS 
for each row
declare
room_occupancy number :=0;
number_of_guest number ;
BEGIN
        select count(guest_id) into number_of_guest from booking_room_guests where booking_id = :new.booking_id group by (booking_id, hotel_id, room_num);

       -- if number_of_guest = null then
       -- number_of_guest := 0;
       -- end if;
        
        select room_occ into room_occupancy from room where room_number = :new.room_num and hotel_id = :new.hotel_id;
        
        if (number_of_guest + 1) > room_occupancy then
                rollback;
        end if;
        exception
             when no_data_found then
                     room_occupancy := 0;         
       
END;
