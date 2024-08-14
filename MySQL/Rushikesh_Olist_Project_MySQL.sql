#KPI_1 -> Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics

# BY IF Condition
Select 
If(weekday(order_purchase_timestamp) < 5 , "Weekday" , "Weekend") As WD_WE ,
Avg(Payment_Value) As Average, Max(payment_Value) As Maximum, Min(Payment_Value) As Minimum, Sum(Payment_Value) AS Sum, Count(Payment_Value) AS Count 
From olist_orders_Dataset Inner Join olist_order_payments_dataset 
On olist_orders_dataset.order_Id = olist_order_payments_dataset.order_id Group By WD_WE;

# BY Case When Condition
Select 
Case When weekday(order_purchase_timestamp) < 5 Then "Weekday" ELse "Weekend" End As WD_WE ,
Avg(Payment_Value) As Average, Max(payment_Value) As Maximum, Min(Payment_Value) As Minimum, Sum(Payment_Value) AS Sum, Count(Payment_Value) AS Count 
From olist_orders_Dataset Inner Join olist_order_payments_dataset 
Using (Order_ID) Group By WD_WE;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#KPI_2 -> Number of Orders with review score 5 and payment type as credit card.

Select Payment_Type, Review_Score , Count(olist_order_payments_dataset.Order_ID) As Count 
From olist_order_payments_dataset  Inner Join olist_order_reviews_dataset 
Using (Order_ID) 
Where Payment_Type = "Credit_Card" And Review_Score = 5;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#KPI_3 -> Average number of days taken for order_delivered_customer_date for pet_shop

Select Product_Category_Name , Avg(Datediff(order_delivered_customer_date , order_purchase_timestamp)) As Shipping_Days 
From olist_orders_Dataset Inner Join olist_order_items_dataset Using(Order_ID) 
Inner Join olist_products_dataset Using(Product_ID)
Where Product_Category_Name = "Pet_Shop";
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#KPI_4 -> Average price and payment values from customers of sao paulo city

# AVerage Payment

Select Customer_City , Avg(Payment_Value) As Average_Payment 
From olist_customers_dataset inner Join  olist_orders_dataset using(Customer_Id)
inner Join olist_order_payments_dataset using(Order_ID)
Where Customer_City = "Sao Paulo";

# Average Price

Select Customer_City , Avg(Price) As Average_Price 
From olist_customers_dataset inner Join  olist_orders_dataset using(Customer_Id)
inner Join olist_order_items_dataset using(Order_ID)
Where Customer_City = "Sao Paulo"; 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#KPI_5 -> Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.

Select Review_Score , Avg(datediff(order_delivered_customer_date , order_purchase_timestamp)) As Shipping_Days 
From olist_orders_Dataset Inner Join olist_order_reviews_dataset 
Using(Order_ID) Group By Review_Score Order By Review_Score;