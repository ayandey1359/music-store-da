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

/* 5. Who is the best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money */
select first_name,last_name,sum(total) as total_invoice from customer as c full join invoice as i
on c.customer_id=i.customer_id
group by c.customer_id
order by total_invoice desc
limit 1

/* 1. Write query to return the email, first name, last name, & Genre of all Rock Music
listeners. Return your list ordered alphabetically by email starting with A */

select first_name,last_name,email from customer as c full join 
invoice as i on
c.customer_id = i.customer_id full join 
invoice_line as il on
i.invoice_id = il.invoice_id
where track_id in(
select track_id from track full join genre
on track.genre_id = genre.genre_id
where genre.name like 'Rock')
order by email 
limit 5

/* 2. Let's invite the artists who have written the most rock music in our dataset. Write a
query that returns the Artist name and total track count of the top 10 rock bands ! */

select a.artist_id,a.name,count(a.artist_id) as frequency
from artist as a full join 
album as al on 
a.artist_id = al.artist_id full join 
track as t on 
al.album_id = t.album_id full join
genre as g on
t.genre_id = g.genre_id
where g.name like 'Rock'
group by a.artist_id
order by frequency desc
limit 1

/* 3. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the
longest songs listed first */
select name, milliseconds from track
where milliseconds > (
select avg(milliseconds) as duration from track )
order by milliseconds desc
limit 5

/* 1. Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent */
select * from invoice_line

