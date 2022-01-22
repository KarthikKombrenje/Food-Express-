# food_clg

This project is a very  food delivery website made using flutter web . 
Tools used in this project are:-

Flutter

MyPhpAdmin (MySql)

Xampp Server [To host my Sql,php files]

Php

I have created A login and register Page which is used to register/login the users . A table called users contains all the data of Users which is present in MySql.
I have created 6 tables namely:-
**Users table**: Contains the registered users and their passwords
Driver table:-Contains the driver details Has Driver id(Did),Driver 
Name(Dname),Driver Age(Dage),

**Customers table**: This contains the Customer id(Cid),Customer Name(Cname),Customer 
Address(Cadd),the type of Customer(Regular , Occasional , New Customer)

**Restaurant table**:-Has the restaurant details in it.This contains the Restaurant 
id(Rid),Name of Restaurant(Rname),Location of restaurant(Loc)

**Food table**: It stores the details of food available in different restaurants.This contains 
Restaurant id (Rid),Food id (Fid),Food Name(Fname),Cost of Food(Cost).

Reviews module: This contains all reviews given by the customer.It has Customer 
id(Cid),Restaurant id(Rid),Rating given by the customer from 1-5(Rating)

**Order Details**: Contains the order details of different customers. It has Rid,Cid,Date of 
Billing(Date),Bill amount(Bill)

The tables along with attributes are:
1) Users (Username,Password} 
2) Drivers(Did,Dname,Age}
3) Customers{ Cid,Cname,Cadd }
4) Restaurant {Rid,Rname,Location}
5) Food(Rid,Fid,Fname,Cost} 
6) Review (Cid,Rid,Rating }
7) OrderDetails {Rid,Cid,Date,Bill}

You can add Update delete and view each of the tables which makes it easy for Food delivery .

To view the table,insert,update,delete  I have made of http api call in flutter to the php files.
The database and php files are present in my Xampp server

Here are the screenshots:-
Login register Page
![image](https://user-images.githubusercontent.com/77848437/150645047-f250049f-2adb-42a6-9599-48459feff21a.png)
![image](https://user-images.githubusercontent.com/77848437/150645058-317cc643-d81e-4294-b6a3-8780d4d7a55d.png)

Home Page:-

![image](https://user-images.githubusercontent.com/77848437/150645080-9e0ba347-70ca-4bd6-b3e9-10b3b1672727.png)

Drivers Table:-
![image](https://user-images.githubusercontent.com/77848437/150645100-d0af9dd0-3e2d-461b-ad20-068f723e5d65.png)
![image](https://user-images.githubusercontent.com/77848437/150645103-1264eb28-a727-415e-a337-44923d732f4a.png)
![image](https://user-images.githubusercontent.com/77848437/150645105-39a0d8cf-d92d-4cbf-ac9b-cbbe01222416.png)
![image](https://user-images.githubusercontent.com/77848437/150645111-c550a1c3-d22e-4962-b0c7-f10134ae4749.png)
![image](https://user-images.githubusercontent.com/77848437/150645115-7b185438-d7b8-47a7-a09e-09b4a99bf0d9.png)
![image](https://user-images.githubusercontent.com/77848437/150645121-36e8e614-d4bb-45d0-9b6c-5e5d3c2758b4.png)

For more details refer to the pdf attached in this Repository named Food_Express_Report




