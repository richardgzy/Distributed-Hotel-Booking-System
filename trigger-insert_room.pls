create or replace trigger insert_room
before insert on room
for each row
declare
        htid room.hotel_id%type;
begin
       getHotelId(htid,:new.hotel_id);
       if htid is null then
          rollback;
          end if;
END;
