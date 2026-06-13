Create Database Ola;
Use Ola;

-- 1. Retrieve all successful bookings
Create View successful_bookings As
Select * from bookings where Booking_Status= 'Success';
Select * from successful_bookings;  



-- 2. Find the average ride distance for each vehicle type
Create view ride_distance_for_each_vehicle as
Select Vehicle_type, avg(Ride_Distance) as avg_distance from bookings
group by Vehicle_type ;
Select * from ride_distance_for_each_vehicle;





-- 3. Get the total number of cancelled rides by customers
Create View cancelled_rides_by_customers As
Select count(*) from Bookings
where Booking_Status = 'Canceled by Customer';

select * from cancelled_rides_by_customers;




-- 4. List the top 5 customers who booked the highest number of rides
Create View top_5_customer as
Select Customer_ID, count(Booking_ID) as total_rideS from bookings
Group by Customer_ID
Order by total_rides Desc Limit 5;

Select * from top_5_customer;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues
Create View rides_cancelled_by_drivers_P_C_issues As
Select  count(*) from bookings 
where Canceled_Rides_by_Driver= "Personal & Car related issue";

Select * from rides_cancelled_by_drivers_P_C_issues;



-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
Create View min_max_driver_rating As
Select min(Driver_Ratings) As min_rating, max(Driver_Ratings) As max_rating from bookings
Where Vehicle_Type= 'Prime Sedan';
Select * from min_max_driver_rating;



-- 7. Retrieve all rides where payment was made using UPI
Create View UPI_Payment As
Select * from bookings
where Payment_Method= 'UPI';
Select * from UPI_Payment;


-- 8. Find the average customer rating per vehicle type
Create View  avg_customer_rating As
Select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating FROM bookings
Group by Vehicle_Type;
Select * from avg_customer_rating ;



-- 9. Calculate the total booking value of rides completed successfully
Create View total_successful_Ride_values As
Select sum(Booking_Value) as total_successful_Ride_value from bookings
Where Booking_Status= 'Success';
Select * from total_successful_Ride_values ;



-- 10. List all incomplete rides along with the reason
Create View Incomplete_Rides_Reason As
Select Booking_ID, Incomplete_Rides_Reason  from bookings
Where Incomplete_Rides = 'yes';

Select * from Incomplete_Rides_Reason ;

