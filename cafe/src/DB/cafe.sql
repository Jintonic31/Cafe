
/* Drop Triggers */



/* Drop Tables 

DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE odetail CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;

*/



/* Drop Sequences 

DROP SEQUENCE cart_cseq;
DROP SEQUENCE odetail_odseq;
DROP SEQUENCE orders_oseq;
DROP SEQUENCE product_pseq;

*/




/* Create Sequences */

CREATE SEQUENCE cart_cseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE odetail_odseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE orders_oseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE product_pseq INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE cart
(
	cseq number NOT NULL,
	userid varchar2(300) NOT NULL,
	pseq number NOT NULL,
	quantity number NOT NULL,
	result char(1) NOT NULL,
	indate date DEFAULT SYSDATE,
	PRIMARY KEY (cseq)
);


CREATE TABLE members
(
	userid varchar2(300) NOT NULL,
	pwd varchar2(300) NOT NULL,
	name varchar2(300) NOT NULL,
	phone varchar2(300) NOT NULL,
	nickname varchar2(300),
	email varchar2(300),
	znum varchar2(300),
	add1 varchar2(300),
	add2 varchar2(300),
	add3 varchar2(300),
	indate date DEFAULT SYSDATE,
	useyn char(1) DEFAULT 'Y',
	PRIMARY KEY (userid)
);


CREATE TABLE odetail
(
	odseq number NOT NULL,
	oseq number NOT NULL,
	pseq number NOT NULL,
	quantity number NOT NULL,
	result char(1) NOT NULL,
	PRIMARY KEY (odseq)
);


CREATE TABLE orders
(
	oseq number NOT NULL,
	userid varchar2(300) NOT NULL,
	indate date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (oseq)
);


CREATE TABLE product
(
	pseq number NOT NULL,
	name varchar2(300) NOT NULL,
	kind char(1) NOT NULL,
	price1 number NOT NULL,
	price2 number NOT NULL,
	price3 number,
	content varchar2(1000) NOT NULL,
	image varchar2(300) NOT NULL,
	useyn char(1) DEFAULT 'Y',
	bestyn char(1) DEFAULT 'N',
	indate date DEFAULT SYSDATE,
	PRIMARY KEY (pseq)
);



/* Create Foreign Keys */

ALTER TABLE cart
	ADD FOREIGN KEY (userid)
	REFERENCES members (userid)
;


ALTER TABLE orders
	ADD FOREIGN KEY (userid)
	REFERENCES members (userid)
;


ALTER TABLE odetail
	ADD FOREIGN KEY (oseq)
	REFERENCES orders (oseq)
;


ALTER TABLE cart
	ADD FOREIGN KEY (pseq)
	REFERENCES product (pseq)
;


ALTER TABLE odetail
	ADD FOREIGN KEY (pseq)
	REFERENCES product (pseq)
;



















/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_cart_cseq BEFORE INSERT ON cart
FOR EACH ROW
BEGIN
	SELECT SEQ_cart_cseq.nextval
	INTO :new.cseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_odetail_odseq BEFORE INSERT ON odetail
FOR EACH ROW
BEGIN
	SELECT SEQ_odetail_odseq.nextval
	INTO :new.odseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_orders_oseq BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
	SELECT SEQ_orders_oseq.nextval
	INTO :new.oseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_pseq BEFORE INSERT ON product
FOR EACH ROW
BEGIN
	SELECT SEQ_product_pseq.nextval
	INTO :new.pseq
	FROM dual;
END;

/

/* Drop Triggers */

DROP TRIGGER TRI_cart_cseq;
DROP TRIGGER TRI_odetail_odseq;
DROP TRIGGER TRI_orders_oseq;
DROP TRIGGER TRI_product_pseq;


