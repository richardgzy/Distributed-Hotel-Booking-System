create or replace TRIGGER HOTEL_CHECK 
after DELETE OR UPDATE OF HOTEL_ID ON HOTEL 
for each row
BEGIN
    if updating then
        update room@fit5148b
        set hotel_id = :new.hotel_id
        where hotel_id = :old.hotel_id;        
    end if;
    if deleting then
        update room@fit5148b
        set hotel_id = :old.hotel_id || '*'
        where hotel_id = :old.hotel_id;
    end if;
END;
