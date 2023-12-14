-- 1. Who is the senior most employee based on job title?
select first_name,last_name from employee
order by levels desc
limit 1

-- 2. Which countries have the most Invoices?
select count(billing_country) AS count_billing,billing_country 
from invoice
group by billing_country
order by count_billing desc
limit 1

-- 3. What are top 3 values of total invoice?
select total from invoice
order by total desc
limit 3

/* 4. Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals ! */
select sum(total) AS total_invoice_city,billing_city from invoice
group by billing_city
order by total_invoice_city desc
limit 1

