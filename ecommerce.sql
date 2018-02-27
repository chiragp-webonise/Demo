/*table:user_type*/

/*CREATE TABLE user_types(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
type varchar(20) NOT NULL);

/*inserts*/
/*
insert into user_type values(NULL,"buyer");
insert into user_type values(NULL,"inventory manager");
/*table:users*/

/*
CREATE TABLE users(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
name varchar(30) NOT NULL, 
phone_no varchar(15) NOT NULL,
email varchar(30) unique NOT NULL,
password varchar(30) NOT NULL,
usertype_id int,
FOREIGN KEY (usertype_id)REFERENCES user_type(id));
*/

/*inserts*/
/*
insert into users values(NULL,"chirag",7874875444,"chiragpainter42@gmail.com","chirag",17);
insert into users values(NULL,"nikhil",9844575444,"nikhilsss42@gmail.com","niks",18);
insert into users values(NULL,"sagar", 6456544414,"sagarpatel42@gmail.com","sagar",17);
insert into users values(NULL,"niketa",4144875444,"niketaaa42@gmail.com","niketa",18);
insert into users values(NULL,"smit",  6564875444,"smitpdsd42@gmail.com","smit",17);
/*table:colors*/

/*CREATE TABLE colors(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
color varchar(20) NOT NULL);*/
/*inserts*/
/*
insert into colors values(NULL,"red");
insert into colors values(NULL,"blue");
insert into colors values(NULL,"green");
insert into colors values(NULL,"yellow");
insert into colors values(NULL,"white");

/*table:discounts*/

/*CREATE TABLE discounts(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
rate int NOT NULL);

/*inserts*/
/*
insert into discounts values(NULL,10);
insert into discounts values(NULL,20);
insert into discounts values(NULL,30);
insert into discounts values(NULL,40);
insert into discounts values(NULL,50);

/*table:sellers*/
/*
CREATE TABLE sellers(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
name varchar(30) NOT NULL,
address varchar(50) NOT NULL);

/*inserts*/
/*
insert into sellers values(NULL,"karan","pune");
insert into sellers values(NULL,"sagar","surat");
insert into sellers values(NULL,"niketa","mumbai");
insert into sellers values(NULL,"jay","surat");
insert into sellers values(NULL,"nikhil","pune");

/*table:payments*/
/*
CREATE TABLE payments(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
mode varchar(20) NOT NULL,
status varchar(20) NOT NULL);

/*inserts*/
/*
insert into payments values(NULL,"debit card","pending");
insert into payments values(NULL,"netbanking","successfull");
insert into payments values(NULL,"credit card","pending");
insert into payments values(NULL,"debitcard","rejected");
insert into payments values(NULL,"debitcard","pending");

/*table:products*/

/*
CREATE TABLE products(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
name varchar(30) NOT NULL, 
price int NOT NULL,
is_discontinued bit NOT NULL,
color_id int,
FOREIGN KEY (color_id) REFERENCES colors(id),
discount_id int,
FOREIGN KEY (discount_id) REFERENCES discount(id),
seller_id int,
FOREIGN KEY (seller_id) REFERENCES sellers(id));

/*inserts*/
/*
insert into products values(NULL,"shirt",400,1,6,6,6);
insert into products values(NULL,"T-shirt",800,0,7,6,7);
insert into products values(NULL,"shoes",1000,1,8,8,8);
insert into products values(NULL,"mobile",40000,1,9,9,9);
insert into products values(NULL,"mouse",400,1,10,10,10);

/*table:orders*/


/*
CREATE TABLE orders(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
number varchar(40) NOT NULL, 
date datetime,
trans_status varchar(20) NOT NULL,
payment_id int,
FOREIGN KEY (payment_id) REFERENCES payments(id),
user_id int,
FOREIGN KEY (user_id) REFERENCES users(id));

/*inserts*/
/*
insert into orders values(NULL,"2122121",'2017-02-19',"successfull",6,23);
insert into orders values(NULL,"21221swdes",'2016-02-19',"pending",7,24);
insert into orders values(NULL,"2122121sd",'2012-02-19',"successfull",8,25);
insert into orders values(NULL,"2122121ghdg",'2014-02-19',"successfull",9,26);
insert into orders values(NULL,"21s22121",'2017-02-19',"rejected",10,27);


/*table:order_details*/

/*
CREATE TABLE order_details(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
size varchar(20) NOT NULL, 
price int NOT NULL,
qty int NOT NULL,
total int NOT NULL,
color_id int,
FOREIGN KEY (color_id) REFERENCES colors(id),
discount_id int,
FOREIGN KEY (discount_id) REFERENCES discounts(id),
order_id int,
FOREIGN KEY (order_id) REFERENCES orders(id),
product_id int,
FOREIGN KEY (product_id)REFERENCES products(id));

/*inserts*/
/*
insert into order_details values(NULL,"xxl",400,2,800,6,6,1,16);
insert into order_details values(NULL,"xl",800,1,800,7,7,2,17);
insert into order_details values(NULL,"xxl",100,4,400,8,8,3,18);
insert into order_details values(NULL,"l",400,2,800,9,9,4,19);
insert into order_details values(NULL,"xl",200,4,800,10,10,5,20);

/*table:carts*/

/*
CREATE TABLE carts(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
color_id int REFERENCES colors(id),
user_id int REFERENCES users(id),
product_id int REFERENCES products(id));

/*inserts*/
/*
insert into carts values(NULL,6,23,16);
insert into carts values(NULL,7,24,17);
insert into carts values(NULL,8,25,18);
insert into carts values(NULL,9,26,19);
insert into carts values(NULL,10,27,20);
*/


 
/*montly report query*/
/*
select o.id AS order_id, DATE_FORMAT(o.date, '%m/%d/%Y') AS OrderDate,pn.name AS productnames,pp.price AS costofproduct,pt.tot AS costoforder,u.name As username,u.email As emails
from orders o,users u,(select p.name from product p,order_details od where order_id=od.order_id and p.id=od.product_id ) pn,(select p.price from product p,order_details od where order_id=od.order_id and p.id=od.product_id ) pp,(select sum(od.total) As tot from order_details od where order_id=od.order_id) pt 
where o.user_id=u.id and  o.date BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()

/*view query*/
/*
CREATE VIEW ProductSold AS
	 select od.id As OrderId,(select sum(total) from order_details group by (select id from order_details where product_id=(select p.id from products p,sellers s where p.seller_id=s.id))) As OrderTotal,od.Date As Date,d.rate As Discount,p.mode As PaymentMethod,p.status As PaymentStatus
	 From orders od,payments p,discounts d,order_details ods 
	 where od.payment_id=p.id and ods.discount_id=d.id and od.id=ods.order_id;
*/

/*store procedure*/
/*
DELIMITER$$
CREATE PROCEDURE report(IN trans_status varchar(20),IN mode varchar(20))
BEGIN 
IF trans_status = "successfull" THEN
	INSERT INTO payments VALUES(NULL,mode);
END IF;
END$$
DELIMITER;	
