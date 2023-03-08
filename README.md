# Caleb' Little Esty Shop Bulk Discount Project

## Background and Description

This is an extension of the Little Esty Shop group project. In this extension I added bulk discounts that the merchant can create, update, and destroy.

## Stories

User stories 1-5 focus on setting up CRUD functionality within for the bulk discount. In these stories I created forms that allow a merchant to create, edit, and destroy bulk discounts. With those forms came RESTful routing, proper usability and functionality.

User story 6 is where we were tasked with making a query that would show a merchant's revenue based off of any discounts that may apply to an invoice. To get this, I used an AR query that calculated the max revenue and subtracted the amount that was discounted. After this was completed we were tasked with displaying both the revenue and discounted revenue on the invoice a merchant sees.

User story 7 
This story had us create a link to the discounts that were applicable (if any) and put them on the invoice. Once clicked upon these links took us to the discount's show page which gave us details on the discount.

User story 8
This story is the same as user story 6, it just had us display the information on the admin site of the application. 

User story 9
In this story we were asked to consume an API that would retrieved all holidays in our country. Upon doing this we were asked to limit the display of those holidays to the next 3, and have them shown on the view of the Merchant's dashboard. Every merchant dashboard now has a section that displays the next 3 holidays. For extension work we could make discounts based off of the upcoming holiday.


## Schema

<img width="1152" alt="Screenshot 2023-03-08 at 8 59 35 AM" src="https://user-images.githubusercontent.com/104170346/223764268-514a4c6b-7a1e-440a-9a5a-d9d1961af4fd.png">
