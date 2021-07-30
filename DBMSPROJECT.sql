create table customer(driving_license_id varchar2(20),primary key(driving_license_id),email varchar2(40),cus_name varchar2(20),address varchar2(200));

alter table customer drop column email;
alter table customer add email varchar(40);

create table locations(location_id varchar2(20),primary key(location_id),loc_name varchar2(20),street varchar2(20),pincode int );
 
create table pinlocation(pincode int,primary key(pincode) ,state_name varchar2(20),city varchar2(20));

create table car_category(cname varchar2(20),primary key(cname),no_of_persons int,late_fee int,cost_per_day int,no_of_luggage int);
 
create table bookings(booking_id varchar2(20),primary key(booking_id),pic_location_id varchar2(20),drop_location_id varchar2(20),foreign key (pic_location_id) REFERENCES locations(location_id),foreign key (drop_location_id) REFERENCES locations( location_id),driving_license_id varchar2(20),foreign key (driving_license_id) REFERENCES customer(driving_license_id),amount int,
booking_status varchar2(20),to_date1 varchar2(20),from_date varchar2(20));

create table billing(bill_id varchar2(20),primary key(bill_id),booking_id varchar2(20),foreign key(booking_id) REFERENCES bookings(booking_id),bill_status varchar2(20),
total_late_fee int,total_amount int,bill_date varchar2(20));
 
create table car(registration_no varchar2(20),primary key(registration_no),driving_license_id varchar2(20),foreign key(driving_license_id)references customer(driving_license_id) 
,cname varchar2(20),foreign key(cname) references car_category(cname),location_id varchar2(20),foreign key (location_id) references locations(location_id),booking_id varchar2(20),
foreign key (booking_id) references bookings(booking_id),model_name varchar2(20),mileage int,availability_flag int);
 
create table customerph(driving_license_id varchar2(20),foreign key(driving_license_id)REFERENCES customer(driving_license_id),ph_no int);

SELECT * FROM CUSTOMER;


insert into  customer values('d121','jithender','ramannapet,bhongir,telangana','jithenderamamidi122@gmail.com');
insert into  customer values('d122','goutham','madhapur,hyderbad,telangana','tatipalligoutham@gmail.com');
insert into  customer values('d123','vamshi',' nagarkurnool,mahabubnagar,telangana','3vamshi3@gmail.com');
insert into  customer values('d124','sairam','aler,janagon,telangana','sairam12@gmail.com');
insert into  customer values('d125','avinash','valiginda,rajamundry,andrapradesh','manyamavinash34@gmail.com');
insert into  customer values('d126','roshik',' chityala,mahabubnagar,telangana','roshik223@gmail.com');
insert into  customer values('d127','srivatsa','uppal,hyderbad,telangana','srivatsa271@gmail.com');
insert into  customer values('d128','vinod','dhoddimekhala,kurnool,andrapradesh','kuruvavinod2221@gmail.com');
insert into  customer values('d129','uday','narsapur,west godhavari,andrapradesh','udaykiran521@gmail.com');
insert into  customer values('d130','likith','ghatkesar,rangareddy,telangana','likithchinthala654@gmail.com');


insert into locations values('l101','kphb bus stop','kukatpally',500001);
insert into locations values('l102','lp bus stop','lingampally',500050);
insert into locations values('l103','wgl bus stop','kohaku road',504001);
insert into locations values('l104','wgl railway station','senku road',504001);
insert into locations values('l105','hnk bus stop','raina road',504009);
insert into locations values('l106','kzp railway station','warner road',504011);
insert into locations values('l107','upl bus stop','L road',500025);
insert into locations values('l108','mbnr bus stop','zoro road',509001);
insert into locations values('l109','mbnr railway station','luffy road',509001);
insert into locations values('l110','ngkl bus stop','sasuke road',509209);
insert into locations values('l111','ngkl railway station','naruto road',509209);

insert into pinlocation values(500001,'telangana','lingampally');
insert into pinlocation values(500050,'telangana','kukatpally');
insert into pinlocation values(504001,'telangana','warangal');
insert into pinlocation values(504009,'telangana','hanamkonda');
insert into pinlocation values(504011,'telangana','kazipet');
insert into pinlocation values(500025,'telangana','uppal');
insert into pinlocation values(509001,'telangana','mahabubnagar');
insert into pinlocation values(509209,'telangana','nagarkurnool');


insert into car_category values('ECONOMY',5,9,30,2);
insert into car_category values('COMPACT',5,3,32,3);
insert into car_category values('MID SIZE',5,13,35,3);
insert into car_category values('STANDARD',5,14,38,3);
insert into car_category values('FULL SIZE',5,12,40,4);
insert into car_category values('LUXURY CAR',5,25,75,5);
insert into car_category values('MID SIZE SUV',5,18,36,2);
insert into car_category values('STANDARD SUV',5,12,40,3);
insert into car_category values('FULL SIZE SUV',8,18,60,2);
insert into car_category values('MINI VAN',7,2,70,5);


insert into bookings values('b101','l101','l105','d125',2000,'yes','2019-12-06','2019-12-17');
insert into bookings values('b102','l105','l106','d121',4000,'no','2019-12-08','2019-12-27');
insert into bookings values('b103','l106','l109','d123',200,'pending','2019-12-16','2019-12-17');
insert into bookings values('b104','l107','l101','d127',1000,'cancelled','2019-12-26','2019-12-31');
insert into bookings values('b105','l102','l103','d122',1500,'cancelled','2019-12-12','2019-12-20');
insert into bookings values('b106','l105','l110','d124',1500,'no','2019-12-08','2019-12-18');
insert into bookings values('b107','l109','l103','d126',200,'yes','2019-12-03','2019-12-23');
insert into bookings values('b108','l102','l107','d128',800,'yes','2019-12-13','2019-12-23');
insert into bookings values('b109','l108','l106','d123',900,'yes','2019-12-15','2019-12-30');
insert into bookings values('b110','l110','l108','d122',500,'yes','2019-12-06','2019-12-30');



insert into billing values('i110','b101','completed',200,500,2020-01-02);
insert into billing values('i101','b102','completed',100,1000,2020-01-21); 
insert into billing values('i102','b104','pending',120,1020,2020-01-22);
insert into billing values('i103','b106','completed',190,840,2020-02-01);
insert into billing values('i104','b103','pending',800,2800,2020-01-02);
insert into billing values('i105','b107','pending',390,1800,2020-01-15);
insert into billing values('i106','b105','completed',713,3913,2020-02-03);
insert into billing values('i107','b109','completed',1000,4500,2020-01-31);
insert into billing values('i108','b110','completed',950,3600,2020-02-07);
insert into billing values('i109','b108','pending',670,1470,2020-05-03);



insert into car VALUES('r201','d121','ECONOMY','l101','b101','CIVIC',20,1);
insert into car VALUES('r202','d122','COMPACT','l102','b102','FIESTA',19,1);
insert into car VALUES('r203','d123','MID SIZE','l103','b103','POLO',12,0);
insert into car VALUES('r204','d124','STANDARD','l104','b104','CRUZE',10,1);
insert into car VALUES('r205','d125','STANDARD SUV','l105','b105','SCORPIO',8,1);
insert into car VALUES('r206','d126','MINI VAN','l106','b106','MAGIC',15,1);
insert into car VALUES('r207','d127','LUXURY CAR','l107','b107','Q3',6,1);
insert into car VALUES('r208','d128','FULL SIZE SUV','l108','b108','FORTUNER',9,1);
insert into car VALUES('r209','d129','MID SIZE SUV','l109','b109','INNOVA',4,0);
insert into car VALUES('r210','d130','FULL SIZE','l110','b110','BOLERO',10,0);
insert into car VALUES('r215','d130','COMPACT','l101','b103','SWIFT',19,1);
insert into car VALUES('r213','d126','STANDARD','l105','b108','BALENO',25,1);
insert into car VALUES('r211','d122','LUXURY CAR','l108','b104','FERRARI',5,1);
insert into car VALUES('r214','d129','MINI VAN','l103','b106','BAJAJ',19,0);
insert into car VALUES('r212','d125','ECONOMY','l105','b104','DUSTER',12,0);



insert into  customerph values('d121',9154173452);
insert into  customerph values('d121',8946325237);
insert into  customerph values('d122',7185784929);
insert into  customerph values('d122',8300428020);
insert into  customerph values('d123',2987895899);
insert into  customerph values('d123',9652264789);
insert into  customerph values('d124',9683897863);
insert into  customerph values('d125',8967239082);
insert into  customerph values('d126',7890290470);
insert into  customerph values('d127',8231748639);
insert into  customerph values('d128',7294204849);
insert into  customerph values('d129',7844098404);
insert into  customerph values('d130',9388299492);


SELECT * FROM CUSTOMERPH;

