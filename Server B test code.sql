--room
insert into room values ('0101', '0001', 'double', 2, 200, 'Nice room')
commit;
insert into room values ('0101', '0002', 'double', 2, 200, 'Nice room')
commit;
insert into room values ('0103', '0001', 'suite', 3, 300, 'big room')


select * from room

--membership
insert into membership values('Bronze', 0, 0.9,'Water');
insert into membership values('Silver', 100, 0.8,'Wine');
insert into membership values('Gold', 200, 0.7,'Good Wine');
insert into membership values('Platinum', 300, 0.5,'Hehe');

select * from membership

--customer
insert into customer values (customerid.nextval, 'Mr', 'Jeremy','Clarkson', '08-Sep-1956', 'England', 'London', 'You Guess St', '20035','Bronze',0, '12345678','jr.clarkson@topgear.uk');
insert into customer values (customerid.nextval, 'Mr', 'Tony','Stark', '08-Sep-1976', 'American', 'New York', 'Iron man St', '1001','Bronze',0, '12345678','tm.stark@ironman.com');


select * from customer

--booking
insert into booking values ('00000001', '10002', '0001','0101','07-Mar-2017','09-Mar-2017','JIO','sds@sdf.com',0,'unpaid');
insert into booking values ('00000001', '10002', '0001','0102','07-Mar-2017','09-Mar-2017','JIO','sds@sdf.com',0,'unpaid');

insert into booking values ('00000002', '10002', '0001','0101','05-Mar-2017','10-Mar-2017','JIO','sds@sdf.com',0,'unpaid');
insert into booking values ('00000003', '10003', '0001','0103','06-Mar-2017','08-Mar-2017','JIO','sds@sdf.com',0,'unpaid');
delete from booking

select * from booking

--guest
insert into guest values ('00001', 'Mr', 'Jeremy','Clarkson', '08-Sep-1956', 'England', 'London', 'You Guess St', '20035', '12345678','jr.clarkson@topgear.uk');
insert into guest values ('00002', 'Mr', 'Keremy','Darkson', '08-Sep-1956', 'England', 'London', 'You Guess St', '20035', '12345678','jr.clarkson@topgear.uk');
insert into guest values ('00003', 'Mr', 'Qeremy','Markson', '08-Sep-1956', 'England', 'London', 'You Guess St', '20035', '12345678','jr.clarkson@topgear.uk');
insert into guest values ('00004', 'Mr', 'Teremy','Parkson', '08-Sep-1956', 'England', 'London', 'You Guess St', '20035', '12345678','jr.clarkson@topgear.uk');
insert into guest values ('00005', 'Mr', 'Teremy','Parkson', '08-Sep-1956', 'England', 'London', 'You Guess St', '20035', '12345678','jr.clarkson@topgear.uk');
delete from guest 


select * from guest

--booking_room_guests
insert into booking_room_guests values('00000001','0001','0101','00001');
insert into booking_room_guests values('00000001','0001','0101','00002');
insert into booking_room_guests values('00000002','0001','0101','00001');
insert into booking_room_guests values('00000003','0001','0103','00001');
insert into booking_room_guests values('00000003','0001','0103','00002');
insert into booking_room_guests values('00000003','0001','0103','00003');
insert into booking_room_guests values('00000003','0001','0103','00004');

select * from  booking_room_guests
select to_char(check_out_date)  from  booking where booking_id = '00000001' and room_num = '0101' and hotel_id = '0001';

delete from booking_room_guests
select nvl(count(guest_id),null)  from booking_room_guests where booking_id = '00000003' group by (booking_id, hotel_id, room_num);
select room_occ from room

rollback
select * from booking_room_guests

--payment
insert into payment values('000001','00000001','27-Mar-2017','Cash',(select total_amount from booking where booking_id = '00000001'),'0001','0101')
insert into payment values('000002','00000002','27-Mar-2017','Cash',(select total_amount from booking where booking_id = '00000002'))

select * from payment

select count(guest_id) from booking_room_guests where booking_id = '00000003' group by (booking_id, hotel_id, room_num)
select room_occ from room where room_number = '0103' and hotel_id = '0001'


rollback








