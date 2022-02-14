--
-- Database: `ordergl`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CAT_ID` int(11) NOT NULL,
  `CAT_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CAT_ID`, `CAT_NAME`) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUS_ID` int(11) NOT NULL,
  `CUS_NAME` varchar(20) DEFAULT NULL,
  `CUS_PHONE` varchar(10) DEFAULT NULL,
  `CUS_CITY` varchar(30) DEFAULT NULL,
  `CUS_GENDER` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUS_ID`, `CUS_NAME`, `CUS_PHONE`, `CUS_CITY`, `CUS_GENDER`) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ORD_ID` int(11) NOT NULL,
  `ORD_AMOUNT` int(11) NOT NULL,
  `ORD_DATE` date DEFAULT NULL,
  `CUS_ID` int(11) NOT NULL,
  `PROD_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`ORD_ID`, `ORD_AMOUNT`, `ORD_DATE`, `CUS_ID`, `PROD_ID`) VALUES
(20, 1500, '2021-10-12', 3, 5),
(25, 30500, '2021-09-16', 5, 2),
(26, 2000, '2021-10-05', 1, 1),
(30, 3500, '2021-08-16', 4, 3),
(50, 2000, '2021-10-06', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PRO_ID` int(11) NOT NULL,
  `PRO_NAME` varchar(20) DEFAULT NULL,
  `PRO_DESC` varchar(60) DEFAULT NULL,
  `CAT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PRO_ID`, `PRO_NAME`, `PRO_DESC`, `CAT_ID`) VALUES
(1, 'GTA V', 'DFJDJFDJFDJFDJFJF', 2),
(2, 'TSHIRT', 'DFDFJDFJDKFD', 5),
(3, 'ROG LAPTOP', 'DFNTTNTNTERND', 4),
(4, 'OATS', 'REURENTBTOTH', 3),
(5, 'HARRY POTTER', 'NBEMCTHTJTH', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `PROD_ID` int(11) NOT NULL,
  `PRO_ID` int(11) NOT NULL,
  `SUPP_ID` int(11) NOT NULL,
  `PROD_PRICE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`PROD_ID`, `PRO_ID`, `SUPP_ID`, `PROD_PRICE`) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `RAT_ID` int(11) NOT NULL,
  `CUS_ID` int(11) NOT NULL,
  `SUPP_ID` int(11) NOT NULL,
  `RAT_RATSTARS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`RAT_ID`, `CUS_ID`, `SUPP_ID`, `RAT_RATSTARS`) VALUES
(1, 2, 2, 4),
(2, 3, 4, 3),
(3, 5, 1, 5),
(4, 1, 3, 2),
(5, 4, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SUPP_ID` int(11) NOT NULL,
  `SUPP_NAME` varchar(50) DEFAULT NULL,
  `SUPP_CITY` varchar(50) DEFAULT NULL,
  `SUPP_PHONE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SUPP_ID`, `SUPP_NAME`, `SUPP_CITY`, `SUPP_PHONE`) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CAT_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUS_ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ORD_ID`),
  ADD KEY `CUS_ID` (`CUS_ID`),
  ADD KEY `PROD_ID` (`PROD_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PRO_ID`),
  ADD KEY `CAT_ID` (`CAT_ID`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`PROD_ID`),
  ADD KEY `PRO_ID` (`PRO_ID`),
  ADD KEY `SUPP_ID` (`SUPP_ID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`RAT_ID`),
  ADD KEY `SUPP_ID` (`SUPP_ID`),
  ADD KEY `CUS_ID` (`CUS_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SUPP_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUS_ID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`PROD_ID`) REFERENCES `product_details` (`PROD_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CAT_ID`) REFERENCES `category` (`CAT_ID`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`PRO_ID`) REFERENCES `product` (`PRO_ID`),
  ADD CONSTRAINT `product_details_ibfk_2` FOREIGN KEY (`SUPP_ID`) REFERENCES `supplier` (`SUPP_ID`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`SUPP_ID`) REFERENCES `supplier` (`SUPP_ID`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUS_ID`);
COMMIT;


-- Write queries for the following:

-- 3)	Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000.
-- 4)	Display all the orders along with the product name ordered by a customer having Customer_Id=2.
-- 5)	Display the Supplier details who can supply more than one product.
-- 6)	Find the category of the product whose order amount is minimum.
-- 7)	Display the Id and Name of the Product ordered after “2021-10-05”.
-- 8)	Display customer name and gender whose names start or end with character 'A'.
-- 9)	 Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.

-- Answer 3 
select * from `order` where ord_amount >= 3000;

-- INNER JOIN between order and customer table
select cus_gender, count(*)
from `order`  inner join customer on `order`.cus_id = customer.cus_id 
where ord_amount >= 3000 group by customer.cus_gender;

-- Display all the orders along with the product name ordered by a customer having Customer_Id=2.
-- Join 3 tables order table product and product details

select * from `order` inner join product_details
on `order`.prod_id = product_details.prod_id 
inner join product on
product_details.pro_id = product.pro_id
where cus_id = 2;

-- 5 Display the Supplier details who can supply more than one product.

-- Find out supplier ids of the supplier supplying more than one product

select supp_id from product_details group by supp_id;

select * from supplier where supp_id IN 
(select supp_id from product_details group by supp_id having count(*)> 1);


-- 6)	Find the category of the product whose order amount is minimum.

select * from  `order`;

-- order, product details, product, category

select category.* from `order`
inner join product_details 
on product_details.prod_id = `order`.prod_id
inner join product 
on product_details.pro_id = product.pro_id
inner join category
on product.cat_id = category.cat_id
order by `order`.ord_amount limit 1;

-- 7)	Display the Id and Name of the Product ordered after “2021-10-05”.
-- order , product details, product

select product.pro_id, product.pro_name, product.pro_desc from `order` inner join 
product_details on 
`order`.prod_id = product_details.prod_id
inner join product on
product_details.pro_id = product.pro_id
where ord_date > '2021-10-05';


-- 8 Display customer name and gender whose names start or end with character 'A'.

-- HINT: like 'A%'

select cus_name, cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

-- 9)	 Create a stored procedure to display the Rating for a Supplier if any 
-- along with the Verdict on that rating if any like if rating >4 then 
-- “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.

CREATE DEFINER=`root`@`localhost` PROCEDURE `categorize_supplier`()
BEGIN
select supplier.supp_id,supplier.supp_name,rating.rat_ratstars,
CASE
    WHEN rating.rat_ratstars >4 THEN 'Genuine Supplier'
    WHEN rating.rat_ratstars>2 THEN 'Average Supplier'
    ELSE 'Supplier should not be considered'
END AS verdict from rating inner join supplier on supplier.supp_id=rating.supp_id;
END


