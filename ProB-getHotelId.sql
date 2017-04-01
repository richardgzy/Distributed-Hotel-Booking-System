create or replace PROCEDURE getHotelId(
p_hotel_id out room.hotel_id%type, 
hid in room.hotel_id%type) 
AS
begin
    select hotel_id  into p_hotel_id from (select distinct hotel_id from hotel@fit5148a where hotel_id = hid);
        DBMS_OUTPUT.PUT_LINE('Hotel exits.');
exception
    when others then
          DBMS_OUTPUT.PUT_LINE('No such hotel.');
end getHotelId;
