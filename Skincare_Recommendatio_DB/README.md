Skincare Recommendation Database
📌 Objective
As part of a Code First Girls SQL course, I designed and queried a skincare product database aimed at helping users find the right products based on few specific skin concerns (e.g., acne, dryness, pigmentation). This case study mimics a basic skincare recommendation engine — enabling insights like:

Which products target a specific concern (e.g., acne)?
Which products target multiple concerns and where do they fit in a routine?
This project allowed me to practice relational schema design, ER modeling, and SQL querying for real-world skincare data.

🛠️ What I Did
Designed a relational database schema from scratch
Created an ER diagram using MySQL Workbench
Queried data to recommend products based on concerns
Wrote SQL queries to uncover brand insights, rating trends, and routine coverage
🗃️ Database Structure
The database includes the following tables:

Products: Product ID, Product_Name, Price
Concerns: Concern ID, Concern (e.g., acne, pigmentation)
Routinee: Routine ID, Routinee (e.g., cleanser, serum)
Ratings: Product_ID, Rating_ID, Rating
Prod_Concern: Det ID,Product ID,Concern ID
Prod_Routinee: Det ID,Product ID,Routinee ID
📸 Entity Relationship Diagram (ERD) available in assets/screenshots/

Sample Business Questions Answered

Which products address a specific concern like acne or dryness?
Find the second most expensive product using subqueries
Create a stored procedure to update product prices dynamically
What are the top-rated products for pigmentation?
