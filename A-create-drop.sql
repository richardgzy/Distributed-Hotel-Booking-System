DROP TABLE hotel CASCADE CONSTRAINTS ;

CREATE TABLE hotel
  (
    hotel_id          CHAR (5 CHAR) NOT NULL ,
    hotel_name        VARCHAR2 (50 CHAR) NOT NULL ,
    hotel_type        VARCHAR2 (7) NOT NULL ,
    construction_year NUMBER NOT NULL ,
    country           VARCHAR2 (15 CHAR) NOT NULL ,
    city              VARCHAR2 (20 CHAR) NOT NULL ,
    address           VARCHAR2 (100 CHAR) NOT NULL ,
    contect_number    VARCHAR2 (15 CHAR) NOT NULL ,
    email             VARCHAR2 (50 CHAR) NOT NULL
  ) ;
ALTER TABLE hotel ADD CONSTRAINT hotel_type_check CHECK ( hotel_type IN ('1 star', '2 stars', '3 stars', '4 stars', '5 stars')) ;
ALTER TABLE hotel ADD CONSTRAINT hotel_PK PRIMARY KEY ( hotel_id ) ;