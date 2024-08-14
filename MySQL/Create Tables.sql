Create database Olist_Project;
use Olist_Project;

Create Table Customers_Dataset (
Customer_ID Varchar(50) Primary Key , Customer_Unique_ID varchar(50) , Customer_Zip_Code_Prefix varchar(25) ,
Customer_City varchar(50) , customer_State varchar(50)
);


Create Table Sellers_Dataset (
Seller_ID varchar(50) Primary Key , Seller_Zip_Code_Prefix varchar(25) , seller_City varchar(50) , Seller_State varchar(50)
);


Create Table Orders_Dataset (
Order_ID Varchar(50) Primary Key , Customer_ID varchar(50) , Order_Status varchar(25) , order_purchase_timestamp Datetime ,
order_approved Datetime , order_delivered_carrier_date Datetime , order_delivered_customer_date Datetime , order_estimated_delivery_date Datetime ,
foreign key(Customer_ID) references Customers_Dataset(Customer_ID)
);


create Table Product_Dataset (
Product_ID Varchar(50) Primary Key , Product_Category_Name Varchar(50) , product_name_lenght Varchar(25) , product_description_lenght varchar(25) , 
product_photos_qty Varchar(25) , product_weight_g varchar(25) , product_length_cm Varchar(25) , product_height_cm varchar(25) , product_width_cm varchar(25)
);



Create Table Order_Items (
Order_ID varchar(50) Primary Key , Order_Item_ID int , Product_ID Varchar(50) , seller_ID Varchar(50) , Shipping_Limit_Date datetime , Price int , freight_value int ,
foreign key(Product_ID) references Product_Dataset(Product_ID) ,
foreign key(Seller_ID) references Sellers_Dataset(Seller_ID) 
);



Create Table Order_Payments (
Order_ID varchar(50) not null , payment_sequential int , Payment_Type varchar(25) , Payment_Installments int , Payment_Value int ,
foreign key(Order_ID) references Orders_Dataset(Order_ID)
);


Create Table Order_Reviews (
Review_ID varchar(50) Not Null , Order_ID varchar(50) , Review_Score int , Review_Comment_Title Varchar(255) , Review_Comment_Message Varchar(255) ,
foreign key(Order_ID) references orders_Dataset(Order_ID)
);

Create Table Geolocation_Dataset (
geolocation_zip_code_prefix int , geolocation_lat int , geolocation_lng int , geolocation_city varchar(50) , geolocation_state varchar(25)
);


Create Table product_category_name_translation (
product_category_name Varchar(50) , product_category_name_english Varchar(50)
);