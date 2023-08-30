
CREATE Table mobile_phone (
	mobile_no varchar(10),
	product_name text NOT NULL,
	manufacture text NOT NULL,
	product_count integer NOT NULL,
	price integer NOT NULL,
	CONSTRAINT mobile_key PRIMARY KEY (mobile_no) 
);


INSERT INTO mobile_phone (mobile_no, product_name, manufacture, product_count, price)
	VALUES ('MB001','IphoneXS11', 'China', 100, 1000000 );
	
INSERT INTO mobile_phone (mobile_no, product_name, manufacture, product_count, price)
	VALUES ('MB002','SamsungL8', 'Korea', 200, 900000 );
	
INSERT INTO mobile_phone (mobile_no, product_name, manufacture, product_count, price)
	VALUES ('MB003','XiaomiNot5', 'China', 300, 700000 );
	
INSERT INTO mobile_phone (mobile_no, product_name, manufacture, product_count, price)
	VALUES ('MB004','IphoneM13', 'China', 1, 3000000 );

INSERT INTO mobile_phone (mobile_no, product_name, manufacture, product_count, price)
	VALUES ('MB005','SamsungL2', 'Korea', 300, 700000 );
	
INSERT INTO mobile_phone (mobile_no, product_name, manufacture, product_count, price)
	VALUES ('MB006','YotaPhone0', 'Russia', 1, 3000 );


SELECT product_name, manufacture, price
FROM mobile_phone
WHERE product_count>2;

SELECT mobile_no, product_name, manufacture, product_count, price
FROM mobile_phone
WHERE product_name LIKE '%Samsung%';

SELECT mobile_no, product_name, manufacture, product_count, price
FROM mobile_phone
WHERE product_name LIKE '%Iphone%';

SELECT mobile_no, product_name, manufacture, product_count, price
FROM mobile_phone
WHERE product_name LIKE '%Samsung%';


SELECT mobile_no, product_name, manufacture, product_count, price
FROM mobile_phone
WHERE product_name like '%8%';

