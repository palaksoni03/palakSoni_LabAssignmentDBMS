create database labAssignment;

use labAssignment;

create table Supplier (
	SUPP_ID int primary key,
    SUPP_NAME varchar(255),
    SUPP_CITY varchar(255),
    SUPP_PHONE varchar(255)
);

create table Customer (
	CUS__ID int primary key,
    CUS__NAME varchar(255),
    CUS__PHONE varchar(255),
    CUS__CITY varchar(255),
    CUS__GENDER  ENUM('male', 'female')
);

create table Category (
	CAT_ID int primary key,
    CAT_NAME varchar(255)
);

create table Product (
	PRO_ID int primary key,
    PRO_NAME varchar(255),
    PRO_DESC varchar(255),
    CAT_ID int,
    FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

create table ProductDetails (
	PROD_ID int primary key,
    PRICE varchar(255),
    PRO_ID int,
    SUPP_ID int,
    FOREIGN KEY (PRO_ID) REFERENCES Product(PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES Supplier(SUPP_ID)
);

create table OrderDetail (
	ORD_ID int primary key,
    ORD_AMOUNT DECIMAL(6,2),
    ORD_DATE date,
    PROD_ID int,
    CUS_ID int,
    FOREIGN KEY (PROD_ID) REFERENCES ProductDetails(PROD_ID),
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID)
);

create table Rating (
	RAT_ID int primary key,
    RAT_RATSTARS varchar(255),
    FOREIGN KEY (CUS_ID) REFERENCES Customer(CUS_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES Supplier(SUPP_ID)
);

insert into Supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) values 
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

insert into Customer (CUS__ID, CUS__NAME, CUS__PHONE, CUS__CITY, CUS__GENDER) values 
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

insert into Category (CAT_ID, CAT_NAME) values 
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

insert into Product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values 
(1, 'GTA V','DFJDJFDJFDJFDJFJF',2),
(2, 'TSHIRT','DFDFJDFJDKFD',5),
(3, 'ROG LAPTOP','DFNTTNTNTERND',4),
(4, 'OATS','REURENTBTOTH',3),
(5, 'HARRY POTTER','NBEMCTHTJTH',1);

insert into ProductDetails (PROD_ID, PRICE, PRO_ID, SUPP_ID) values 
(1,'1500', 1, 2),
(2, '30000', 3, 5),
(3, '3000', 5, 1),
(4, '2500', 2, 3),
(5, '1000', 4, 1);

insert into orderdetail (ORD_ID, ORD_AMOUNT, ORD_DATE, PROD_ID, CUS_ID ) values 
(1,'1500', '2021-10-12', 1, 2),
(2, '30500', '2021-09-16', 3, 5),
(3, '2000', '2021-10-05', 5, 1),
(4, '3500', '2021-08-16', 2, 3),
(5, '2000', '2021-10-06', 4, 1);


3. SELECT COUNT(customer.CUS__ID) AS customerCount,customer.CUS__GENDER FROM customer inner join orderDetail 
	WHERE orderDetail.ORD_AMOUNT>=3000 group by customer.CUS__GENDER;

4. SELECT orderDetail.ORD_ID, orderDetail.ORD_AMOUNT, orderDetail.ORD_DATE, product.PRO_NAME  FROM orderDetail 
inner join productdetails on orderDetail.PROD_ID=productdetails.PROD_ID INNER JOIN 
product on product.PRO_ID=productdetails.PRO_ID inner JOIN customer on orderDetail.CUS_ID=customer.CUS__ID WHERE customer.CUS__ID=2;

5. SELECT supplier.SUPP_ID, supplier.SUPP_NAME from supplier inner join productdetails on supplier.SUPP_ID=productdetails.SUPP_ID inner join product
on product.PRO_ID=productdetails.PRO_ID;

6. SELECT category.CAT_ID, category.CAT_NAME, orderdetail.ORD_AMOUNT from category inner join product on category.CAT_ID=product.CAT_ID inner join 
productdetails on nproduct.PRO_ID=productdetails.PRO_ID inner join orderdetail on productdetails.PROD_ID=orderdetail.PROD_ID order by
orderdetail.ORD_AMOUNT asc limit 1;

7. SELECT product.PRO_ID, product.PRO_NAME from orderdetail inner join productdetails on orderdetail.PROD_ID=productdetails.PROD_ID inner join product on
product.PRO_ID=productdetails.PRO_ID WHERE orderdetail.ORD_DATE<"2021-10-05";

8. SELECT Supplier.SUPP_ID, Supplier.SUPP_NAME, Rating.RAT_RATSTARS, Customer.CUS__NAME FROM Supplier inner join Rating on Supplier.SUPP_ID=Rating.SUPP_ID inner join 
Customer on Rating.CUS_ID=Customer.CUS__ID order by Rating.RAT_RATSTARS DESC LIMIT 3;

9. SELECT CUS__NAME,CUS__GENDER from Customer WHERE CUS__NAME LIKE 'A%' or CUS__NAME LIKE '%A';

10. SELECT sum(orderDetail.ORD_AMOUNT) from orderDetail inner join Customer WHERE orderDetail.CUS_ID=Customer.CUS__ID 
having Customer.CUS__GENDER = "M";

11. SELECT customer.CUS__ID,customer.CUS__NAME,customer.CUS__CITY FROM customer LEFT JOIN orderDetail ON 
orderDetail.CUS_ID = customer.CUS__ID group by customer.CUS__ID;

12.  SELECT * from Rating inner join Supplier where Rating.SUPP_ID=Supplier.SUPP_ID;