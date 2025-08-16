CREATE DATABASE Skincare;
USE Skincare;
DROP DATABASE Skincare;

CREATE TABLE Products (
product_id INT PRIMARY KEY,
product_name TEXT,
price INT NOT NULL                                                     -- Indian Currency
);

CREATE TABLE Concerns(
concern_id INT PRIMARY KEY,
concern VARCHAR(15)
);

CREATE TABLE Routinee(
routinee_id INT PRIMARY KEY AUTO_INCREMENT,
routinee CHAR(2)
);

CREATE TABLE Ratings (
rate_id INT PRIMARY KEY AUTO_INCREMENT,
prod_id INT,
rating DECIMAL(2,1),
FOREIGN KEY (prod_id) REFERENCES Products(product_id)
);

CREATE TABLE Prod_Concern(
det_id INT PRIMARY KEY AUTO_INCREMENT,
prod_id INT,
concern_id INT,
FOREIGN KEY (prod_id) REFERENCES Products(product_id),
FOREIGN KEY (concern_id) REFERENCES Concerns(concern_id)
);

CREATE TABLE Prod_Routinee(
det_id INT PRIMARY KEY AUTO_INCREMENT,
prod_id INT,
routinee_id INT,
FOREIGN KEY (prod_id) REFERENCES Products(product_id),
FOREIGN KEY (routinee_id) REFERENCES Routinee(routinee_id)
);

INSERT INTO Products
(product_id,product_name,price)
VALUES
(001,'Cetaphil Gentle Skin Cleanser',359),
(002,'Minimalist 2% Salicylic Acid + LHA Face Cleanser',295),
(003,'The Derma Co 10% Niacinamide Face Serum',204),
(004,"Paula's Choice-Skin Perfecting 2% BHA Liquid Salicylic Acid Exfoliant-Facial Exfoliant",1200),
(005,'Neutrogena Oil-Free Moisturiser SPF 15',618),
(006,'Minimalist Sunscreen - Spf 50 Pa++++ Lightweight With Niacinamide & Multi-vitamins, No White Cast, Broad Spectrum',250),
(007,'The Face Shop Rice Water Bright Foaming Cleanser',437),
(008,'Cerave Moisturizing Cream Dry to Very Dry',379),
(009,"Re'equil Ceramide & Hyaluronic Acid Moisturiser",266),
(010,'CeraVe Facial Moisturizing Lotion SPF30',1235),
(011,'Beauty of Joseon Relief Sun : Rice + Probiotics (SPF50+ PA++++)',940),
(012,'Cetaphil Moisturizing Lotion For Normal To Combination, Sensitive Skin 100 Ml Moisturizer With Niacinamide, Panthenol Non-Greasy, Wonrsquo T Clog',429),
(013,'Foxtale Glow Sunscreen SPF 50 PA++++',350),
(014,'Dot & Key 10% Vitamin C + E 5% Niacinamide Serum | Fades Pigmentation & Dark Spots | For Uneven & Dull Skin',695),
(015,'Beauty of Joseon - Glow Serum - Propolis + Niacinamide',1689),
(016,'The Ordinary Hyaluronic Acid 2% + B5',1899),
(017,'Minimalist 2% Alpha Arbutin Face Serum With Butylresorcinol & Ferulic Acid For Hyperpigmentation',250),
(018,'Cetaphil Oily Skin Cleanser, Daily Face Wash for Oily & Acne prone Skin',545),
(019,'Isntree - Hyaluronic Acid Watery Sun Gel',1601),
(020,'Cosrx Aloe Soothing SPF50 PA+++ Sun Cream',1050);

INSERT INTO Concerns
(concern_id,concern)
VALUES
(1, 'Impurities'),
(2, 'Dark Spots'),
(3, 'Anti-Ageing'),
(4, 'Moisturising'),
(5, 'Acne'),
(6, 'Comedones'),
(7, 'Clogged Pores'),
(8, 'Sun Protection'),
(9, 'Pigmentation'),
(10, 'Scar Treatment');

INSERT INTO Routinee
(routinee) 
VALUES 
('AM'),
('PM'),
('AT');                             -- AT = Any Time, Can used to either in the morning or at night or both

INSERT INTO Ratings
(rate_id,prod_id,rating)
VALUES
(1, 001, 4.8),
(2, 002, 4.0),
(3, 003, 4.6),
(4, 004, 4.7),
(5, 005, 3.9),
(6, 006, 4.4),
(7, 007, 4.8),
(8, 008, 4.8),
(9, 009, 4.6),
(10, 010, 4.5),
(11, 011, 4.8),
(12, 012, 4.6),
(13, 013, 4.6),
(14, 014, 4.5),
(15, 015, 4.7),
(16, 016, 4.7),
(17, 017, 3.6),
(18, 018, 4.6),
(19, 019, 4.5),
(20, 020, 4.8); 

INSERT INTO Prod_Concern
(prod_id,concern_id)
VALUES
(001, 1),          
(002, 6),
(002, 3),
(003, 3),
(003, 10),
(004, 3),
(004, 7),
(005, 4),
(005, 8),
(006, 8),
(007, 1),
(008, 4),
(009, 4),
(010, 4),
(011, 8),
(011, 4),
(012, 4),
(013, 8),
(014, 9),
(014, 10),
(015, 3),
(016, 3),
(016, 4),
(017, 9),
(017, 3),
(018, 1),
(019, 4),
(019, 8),
(020, 4),
(0020, 8);

INSERT INTO Prod_Routinee
(prod_id,routinee_id)
VALUES
(001,3),          
(002,2),
(003,3),
(004,3),
(005,2),
(006,1),
(007,3),
(008,3),
(009,3),
(0010,3),
(0011,1),
(0012,3),
(0013,1),
(0014,2),
(0015,2),
(0016,3),
(0017,3),
(0018,3),
(0019,1),
(0020,1);

-- PRODUCT INSIGHTS
SELECT 
    p.product_id,
    p.product_name,
    p.price,
    r.rating,
    c.concern
FROM 
    Products p
LEFT JOIN 
    Ratings r ON p.product_id = r.prod_id
LEFT JOIN 
    Prod_Concern pc ON p.product_id = pc.prod_id
LEFT JOIN 
    Concerns c ON pc.concern_id = c.concern_id;
    

/*Using any type of the [JOINS] create a [VIEW] that combines multiple tables in a logical way
Retrives details like prod name, conern along with the routine to be followed */

CREATE VIEW ProductDetailsView AS
SELECT 
    p.product_name,
    c.concern,
    r.routinee
FROM 
    Products p
LEFT JOIN 
    Prod_Concern pc ON p.product_id = pc.prod_id
LEFT JOIN 
    Concerns c ON pc.concern_id = c.concern_id
LEFT JOIN 
    Prod_Routinee pr ON p.product_id = pr.prod_id
LEFT JOIN 
    Routinee r ON pr.routinee_id = r.routinee_id;

-- QUERYING THE VIEW TABLE
SELECT * FROM ProductDetailsView WHERE concern IN ('pigmentation','sun protection');
SELECT * FROM ProductDetailsView WHERE product_name LIKE '%serum%' AND routinee = 'PM';



/* In your database, create a [STORED FUCNTION] that can be applied to a query in your DB
To find the avg price of all the products based on the concern */

DELIMITER $$
CREATE FUNCTION avg_price_by_concern(concern_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_price DECIMAL(10,2);
    
    -- Calculate average price for products associated with the given concern_id
    SELECT AVG(p.price) INTO avg_price
    FROM Products p
    JOIN Prod_Concern pc ON p.product_id = pc.prod_id
    WHERE pc.concern_id = concern_id;
    
    -- Return the result
    RETURN avg_price;
END $$
DELIMITER ;

SELECT avg_price_by_concern(3);  -- Replace 1 with the desired concern_id


/*Prepare an example query with a [SUBQUERY] to demonstrate how to extract data
Retrives the second costly product details */

SELECT product_id,product_name,price FROM Products 
where price = (SELECT MAX(price) 
			   FROM Products 
               WHERE price < (SELECT MAX(price) FROM Products)) LIMIT 1;
               
SELECT product_name,price FROM Products ORDER BY price DESC;                                           -- Check 

/* In your database, create a [STORED PROCEDURE] and demonstrate how it runs
This procedure updates the prices of the products */

DELIMITER //
CREATE PROCEDURE UpdatePrice(IN p_product_id INT, IN new_price DECIMAL(10, 2))
BEGIN
    UPDATE Products
    SET price = new_price
    WHERE product_id = p_product_id;
END //
DELIMITER ;

CALL UpdatePrice(001, 299.00);

SELECT product_name,price FROM Products WHERE product_id = 001;  

/* Prepare an example query with [GROUP BY] and [HAVING TO]
Retrieves the avg rating */
SELECT 
    p.product_name,
    AVG(r.rating) AS average_rating
FROM 
    Products p
JOIN 
    Ratings r ON p.product_id = r.prod_id
GROUP BY 
    p.product_name
HAVING 
    AVG(r.rating) < 4.1;

/* Which product address a specific concern (eg.,pigmentation or impurities) */
SELECT p.product_name, c.concern
FROM Products p
JOIN Prod_Concern pc ON p.product_id = pc.prod_id
JOIN Concerns c ON pc.concern_id = c.concern_id
WHERE c.concern IN ('Pigmentation','Impurities');


/* Top rated products for pigmentation */
SELECT p.product_name, r.rating, c.concern
FROM Products p
JOIN Ratings r ON p.product_id = r.prod_id
JOIN Prod_Concern pc ON p.product_id = pc.prod_id
JOIN Concerns c ON pc.concern_id = c.concern_id
WHERE c.concern = 'pigmentation'
ORDER BY r.rating DESC
LIMIT 5;








