

CREATE TABLE salesman (
    salesman_id numeric(5,0) NOT NULL,
    name character varying(30) NOT NULL,
    city character varying(15),
    commission numeric(5,2)
);

CREATE TABLE customer (
    customer_id numeric(5,0) NOT NULL,
    cust_name character varying(30) NOT NULL,
    city character varying(15),
    grade numeric(3,0) DEFAULT 0,
    salesman_id numeric(5,0) NOT NULL
);


CREATE TABLE orders (
    ord_no numeric(5,0) NOT NULL,
    purch_amt numeric(8,2) DEFAULT 0,
    ord_date date,
    customer_id numeric(5,0) NOT NULL,
    salesman_id numeric(5,0) NOT NULL
);

INSERT INTO salesman  (salesman_id, name, city , commission )
VALUES (5001,	'James Hoog',	'New York',	0.15);


INSERT INTO salesman  (salesman_id, name, city , commission )
VALUES (5002,'Nail Knite',	'Paris',	0.13),
       (5005,	'Pit Alex'	,'London',	0.11),
	   (5006,	'Mc Lyon',	'Paris',	0.14),
	   (5003,'Lauson Hen',''	,	0.12),
	   (5007,'Paul Adam',	'Rome',	0.13)
 
 SELECT * FROM salesman ;


 truncate table customer

 INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES (3002,	'Nick Rimando'	,'New York'	,100	,5001 ),
       (3007,	'Brad Davis'	,'New York' ,200	,5001 ),
       (3003,	'Jozy Altidor',	'Moncow'	,200	,5007 ),
       (3005,	'Graham Zusi',	'California',200	,5002 ),
       (3008,	'Julian Green',	'London'	,300	,5002 ),
       (3004,	'Fabian Johnson',	'Paris'	,300	,5006 ),
       (3009,	'Geoff Cameron',	'Berlin',100	,5003 ),
       (3001,	'Brad Guzan'	,'London',NULL 	,5005)



INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES (70009	,270.65	    ,'2012-09-10',	3001	,5005),
       (70002	,65.26	    ,'2012-10-05',	3002	,5001),
       (70004	,110.50	    ,'2012-08-17',	3009	,5003),
       (70005	,2400.60	,'2012-07-27',	3007	,5001),
       (70008	,5760.00	,'2012-09-10',	3002	,5001),
       (70010	,1983.43	,'2012-10-10',	3004	,5006),
       (70003	,2480.40	,'2012-10-10',	3009	,5003),
       (70011	,75.29	    ,'2012-08-17',	3003	,5007),
       (70013	,3045.60	,'2012-04-25',	3002	,5001),
       (70001	,150.50	    ,'2012-10-05',	3005	,5002),
       (70007	,948.50	    ,'2012-09-10',	3005	,5002),
       (70012	,250.45	    ,'2012-06-27',	3008	,5002)


---Display name and commission for all the salesmen. 
---Mostrar nombre y comisión de todos los vendedores. 
SELECT name, commission FROM salesman; 

---Retrieve salesman id of all salesmen from orders table without any repeats.
---Recuperar el id de vendedor de todos los vendedores de la tabla de pedidos sin repeticiones.
SELECT DISTINCT salesman_id FROM orders;

---Display names and city of salesman, who belongs to the city of Paris
---Mostrar los nombres y la ciudad del vendedor, que pertenece a la ciudad de París

SELECT name,city FROM salesman WHERE city='Paris';

--Find those salesmen with all information who gets the commission within a range of 0.10 and 0.12.
--Encuentra aquellos vendedores con toda la información que obtienen la comisión dentro de un rango de 0,10 y 0,12.

SELECT  salesman_id, name,commission FROM salesman  WHERE  commission>0.10 AND commission<0.12

---Display all the information for those customers with a grade of 200
---Mostrar toda la información de los clientes con una nota de 200

SELECT *FROM customer WHERE grade=200;

--Find all those customers with all information whose names are ending with the letter 'n'.
--Encuentre todos los clientes con toda la información cuyos nombres terminen en "n".

SELECT *FROM customer WHERE cust_name LIKE '%N'

--Find those salesmen with all information whose name containing the 1st character is 'N' and the 4th
---character is 'l' and rests may be any character

--Encuentre aquellos vendedores con toda la información cuyo nombre contenga el 1er carácter es 'N' y el 4º
--carácter es 'l' y los restos pueden ser cualquier carácter

SELECT *FROM salesman WHERE name LIKE 'N__L%'

---Find that customer with all information who does not get any grade except NULL.
---Encuentra a ese cliente con toda la información que no obtiene ninguna calificación excepto NULO.

SELECT *FROM customer WHERE grade is  NULL

---Find the total purchase amount of all orders.
--Encuentre el importe total de compra de todos los pedidos.

 SELECT SUM(purch_amt) As TotalPurchAmount FROM orders

--Display all the customers, who are either belongs to the city New York or not had a grade above 100. 
--Mostrar todos los clientes, que son o bien pertenece a la ciudad de Nueva York o no tenía una calificación superior a 100. 

SELECT* FROM customer WHERE city='New York' or not grade>100

--Display the order number,orderdate and the purchase amount for order(s)which will be delivered by the salesman with ID5001.
--Muestra el número de pedido, la fecha de pedido y el importe de compra de los pedidos que serán entregados por el vendedor con ID5001.

SELECT ord_no, ord_date,purch_amt
FROM orders
WHERE salesman_id=5001

---Find the total purchase amount of all orders
---Encuentre el importe total de compra de todos los pedidos.

SELECT COUNT(DISTINCT salesman_id) TOTAL_COMPRA
FROM orders

---Find the highest grade for each of the cities of the customers
---Encuentre la nota más alta para cada una de las ciudades de los clientes

SELECT city,MAX(grade)Max_grade
 FROM customer
 GROUP BY city

 ---Find the highest purchase amount ordered by the each customer
----with their ID and highest purchase amount.

--Encuentre el importe de compra más alto pedido por cada cliente
---con su ID y el importe de compra más alto.

SELECT customer_id,MAX(purch_amt) Precio
 FROM orders 
 GROUP BY customer_id
 order by  Precio desc
 
 --Find the highest purchase amount on a date '2012-08-17'
--for each salesman with their ID.

---Encontrar el mayor importe de compra en una fecha '2012-08-17'
---para cada vendedor con su ID.

SELECT salesman_id,MAX(purch_amt) AS MAYOR_APORTE
 FROM orders
 WHERE ord_date='2012-08-17'
 GROUP BY  salesman_id


---Find the highest purchase amount with their customer ID
---and order date, for only those customers who have the
---highest purchase amount in a day is more than 2000.

---Buscar el importe de compra más alto con su ID de cliente
---y la fecha de pedido, sólo para aquellos clientes cuyo
---mayor importe de compra en un día es superior a 2000.

 SELECT
customer_id, ord_date,MAX(purch_amt) 
FROM
orders 
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) > 2000.00;


---Write a SQL statement that counts all orders for a
--date August 17th, 2012.

--Escriba una sentencia SQL que cuente todos los pedidos para una
--fecha 17 de agosto de 2012

SELECT COUNT(*)
 FROM orders
 WHERE ord_date='2012-08-17'

-------------------------------------------------------------------------------
---------------ORDER OF SQL STATEMENT------------------------------------------
-------------------------------------------------------------------------------
---FROM ==> WHERE ==>SELECT ==> GROUP BY ==> HAVING ==> ORDER BY ==> LIMIT
-----------------------------------------------------------------------------------

--Find the name and city of those customers and salesmen who lives in the same city. 
--Encuentre el nombre y la ciudad de aquellos clientes y vendedores que viven en la misma ciudad. 

SELECT A.cust_name,B.name,B.city
FROM customer A ,salesman B
WHERE A.city=B.city

--- Find the names of all customers along
--- with the salesmen who works for them. 

---Encuentre los nombres de todos los clientes
--con los vendedores que trabajan para ellos. 

SELECT  A.cust_name,B.name
 FROM customer A ,salesman B
 WHERE A.salesman_id=B.salesman_id

 --Display all those orders by the customers not located
---in the same cities where their salesmen live. 

---Mostrar todos aquellos pedidos de los clientes que no se encuentran
---en las mismas ciudades donde viven sus vendedores. 

SELECT C.ord_no,B.cust_name,B.customer_id,A.salesman_id
FROM salesman A, customer B, orders C
WHERE A.city<>B.city
AND C.customer_id=B.customer_id
AND C.salesman_id=A.salesman_id


SELECT ord_no ,cust_name ,orders.customer_id,
orders.salesman_id
FROM salesman ,customer ,orders
WHERE customer.city <> salesman.city
AND orders.customer_id = customer.customer_id
AND orders.salesman_id = salesman.salesman_id;

---Display all the orders issued by the salesman 'Paul Adam' from the orders table.
--Mostrar todos los pedidos emitidos por el vendedor 'Paul Adam' de la tabla de pedidos.

SELECT *
FROM orders 
WHERE salesman_id=(SELECT salesman_id FROM salesman WHERE name='Paul Adam')

---Display all the orders which values are greater than the average order value for 10th October 2012.
---Mostrar todos los pedidos cuyos valores sean superiores a el valor medio de los pedidos del 10 de octubre de 2012.

SELECT *
FROM  orders 
WHERE purch_amt>(SELECT AVG(purch_amt) FROM  orders  WHERE ord_date='2012-10-10')

--Find all orders attributed to salesmen in Paris.
--Buscar todos los pedidos atribuidos a vendedores en Paris.
SELECT *
FROM  orders 
WHERE salesman_id IN (SELECT salesman_id FROM  salesman  WHERE city='Paris')

--Extract the data from the orders table for the salesman who earned the maximum commission.
--Extraiga los datos de la tabla de pedidos para el vendedor que obtuvo la comisión máxima.

SELECT *
FROM orders
WHERE salesman_id IN (SELECT salesman_id FROM salesman WHERE commission= (SELECT MAX(commission) FROM salesman))


--Find the name and ids of all salesmen whohad more than one customer.
--Busque el nombre y los identificadores de todos los vendedores que tengan más de un cliente.

SELECT *
 FROM salesman A
 WHERE 1<(SELECT COUNT(*) FROM customer B WHERE A.salesman_id=B.salesman_id)

--Write a query to find all the salesmen who worked for only one customer.
--Escriba una consulta para encontrar todos los vendedores que trabajaron para un solo cliente.

SELECT * FROM 
salesman
WHERE salesman_id IN(SELECT DISTINCT salesman_id FROM customer A WHERE NOT EXISTS (SELECT * FROM  customer B WHERE A.salesman_id=B.salesman_id 
                      AND A.cust_name<>B.cust_name))

 SELECT c.salesman_id, s.name, s.city, s.commission
FROM salesman s, customer c
where s.salesman_id = c.salesman_id
group by c.salesman_id, s.name
Having count(c.salesman_id) = 1;


---Display all the orders that had amounts that were greater than at east one of the orders from September 10th 2012.
---Mostrar todas las órdenes que tenían importes superiores a al este uno de los pedidos del 10 de septiembre de 2012.

SELECT *
FROM Orders
WHERE purch_amt > ANY
(SELECT purch_amt
FROM orders
WHERE ord_date = '2012-09-10');


--Display only those customers whose grade are, in fact, higher than every customer in New York.
--Mostrar sólo aquellos clientes cuya nota sea, de hecho, superior a la de todos los clientes de Nueva York.

SELECT *
FROM customer
WHERE grade > ALL
(SELECT grade
FROM customer
WHERE city = 'NewYork');

-----------------------------------------------------
-- -------------------OTRA TABLA---------------------
-----------------------------------------------------
CREATE TABLE nobel_win (
    year integer,
    subject character(25),
    winner character(45),
    country character(25),
    category character(25)
);



INSERT INTO nobel_win(year, subject, winner, country, category) 
VALUES
(1970	,'Physics'                  	,'Hannes Alfven'                                	,'Sweden'                   ,'Scientist'           ),    
(1970	,'Physics'                  	,'Louis Neel'                                   	,'France'                   ,'Scientist'           ),    
(1970	,'Physiology'               	,'Julius Axelrod'                               	,'USA'                      ,'Scientist'           ),    
(1970	,'Physiology'               	,'Ulf von Euler'                                	,'Sweden'                   ,'Scientist'           ),    
(1970	,'Physiology'               	,'Bernard Katz'                                	    ,'Germany'                  ,'Scientist'           ),    
(1970	,'Literature'               	,'Aleksandr Solzhenitsyn '                      	,'Russia'                   ,'Linguist'             ),   
(1970	,'Economics'                	,'Paul Samuelson'                               	,'USA'                      ,'Economist'          ),    
(1971	,'Physics'                  	,'Dennis Gabor'                                 	,'Hungary'                  ,'Scientist'          ),    
(1971	,'Chemistry'               	    ,'Gerhard Herzberg'                             	,'Germany'                  ,'Scientist'          ),    
(1971	,'Literature'               	,'Pablo Neruda'                                 	,'Chile'                    ,'Linguist'            ),    
(1971	,'Economics'                	,'Simon Kuznets'                                	,'Russia'                   ,'Economist'           ),    
(1978	,'Peace'                    	,'Anwar al-Sadat'                               	,'Egypt'                    ,'President'           ),    
(1978	,'Peace'                    	,'Menachem Begin'                               	,'Israel'                   ,'Prime Minister'      ),    
(1994	,'Peace'                    	,'Yitzhak Rabin'                                	,'Israel'                   ,'Prime Minister'      ),    
(1987	,'Physics'                  	,'Johannes Georg Bednorz'                      	    ,'Germany'                  ,'Scientist'           ),    
(1987	,'Chemistry'                	,'Donald J. Cram'                               	,'USA'                      ,'Scientist'           ),    
(1987	,'Chemistry'                	,'Jean-Marie Lehn'                              	,'France'                   ,'Scientist'           ),    
(1987	,'Physiology'               	,'Susumu Tonegawa'                              	,'Japan'                    ,'Scientist'           ),    
(1987	,'Literature'               	,'Joseph Brodsky'                               	,'Russia'                   ,'Linguist'            ),    
(1987	,'Economics'                	,'Robert Solow'                                 	,'USA'                     ,'Economist'            ),   
(1994	,'Literature'               	,'Kenzaburo Oe'                                 	,'Japan'                    ,'Linguist'            ),    
(1994	,'Economics'                	,'Reinhard Selten'                              	,'Germany'                  ,'Economist'           ),
(1970	,'Chemistry'                	,'Luis Federico Leloir'                         	,'France'                  	,'Scientist'           )

---Show the winner of the 1971 prize for Literature.
--Muestra al ganador del premio de Literatura de 1971.

SELECT  winner FROM nobel_win WHERE subject='Literature'   and  year=1971

---Show all the details of the winners with first name Louis. 
---Mostrar todos los detalles de los ganadores con el nombre Louis. 

SELECT * FROM nobel_win WHERE  winner LIKE 'Louis%'

---Show all the winners in Physics for 1970 together with the winner of Economics for 1971. 
---Mostrar todos los ganadores en Física de 1970 junto con el ganador de Economía de 1971. 
SELECT * FROM nobel_win WHERE subject='Physics' AND year=1970 
UNION
SELECT * FROM nobel_win WHERE subject='Economics' AND year=1971

--Show all the winners of Nobel prize in the year 1970 except the subject Physiology and Economics.
--Mostrar todos los ganadores del premio Nobel en el año 1970 excepto el tema Fisiología y Economía.
SELECT * FROM  nobel_win  WHERE year=1970  AND subject not in ('Physiology' ,'Economics')


---Find all the details of the Nobel winners for the subject not started with the letter 'P' and arranged
---the list as the most recent comes first, then by name in order.

--Encuentra todos los datos de los ganadores del Nobel de la materia que no empiece por la letra "P" y ordena
--la lista como el más reciente va primero, luego por nombre en orden.

SELECT * FROM nobel_win WHERE subject NOT LIKE 'P%'
ORDER BY year desc, winner 


-----------------------------------------------------
-- -------------------OTRA TABLA---------------------
-----------------------------------------------------

CREATE TABLE item_mast (
    pro_id integer NOT NULL,
    pro_name character varying(25) NOT NULL,
    pro_price numeric(8,2) NOT NULL,
    pro_com integer NOT NULL
);

INSERT INTO item_mast (pro_id, pro_name, pro_price, pro_com) 
VALUES 
(101	,'Mother Board' 	   ,3200.00	,15		  ),
(102	,'KeyBoard'            ,450.00	,16		  ),
(103	,'ZIPdrive'            ,250.00	,14		  ),
(104	,'Speaker'	           ,550.00	,16		  ),
(105	,'Monitor'	           ,5000.00	,11		  ),
(106	,'DVDdrive'            ,900.00	,12		  ),
(107	,'CDdrive'             ,800.00	,12		  ),
(108	,'Printer'	           ,600.00	,13		  ),
(109	,'Refillartridge'      ,350.00	,13	      ),
(110	,'Mouse'	           , 250.00	,12       )


---Find the name and price of the cheapest item(s). 
---Busca el nombre y el precio del artículo  más baratos. 

SELECT pro_name,pro_price FROM item_mast WHERE  pro_price=(SELECT MIN(pro_price) FROM item_mast)

