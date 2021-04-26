# Pewlett Hackard Analysis
Module 7 Project

## Overview

This project is to satisfy the requirements for the seventh module challenge in the Data Analysis Bootcamp. We are working in [PostgreSQL](https://www.postgresql.org/).
In this project, we are asked to create different tables to analyze the employees of the Pewlett Hackard company as they make determinations
about their retiring employees and being able to support the young talent currently working for the company. The analysis described here is to 
help management determine their current state with employees and to make plans moving forward.

## Results

### Data Review
* The initial process was creating an Entity Relationship Diagram. This is an evalution and way of documenting the tables with their particular characteristics. 
The program used for this was [Quick Database Diagrams](https://www.quickdatabasediagrams.com/).
![Entity Relationship Diagram](https://github.com/summerstime/Pewlett_Hackard_Analysis/blob/main/EmployeeDB.png) 

* There were many tables to be created from the six original entry tables. These csv files were joined with specific criteria to create other tables and exported
as required in a csv format. 
Part of the review included the generation of a table for retiree's titles based on birthdate. Birthdays between 1/1/1952 and 12/31/1955 were considered in the range of retirement age.
Another part of the review was establishing a group for mentorship. Where possibly the help of part-time retirees mentoring the younger employees will
continue the efforts of knowledge transfer for the future.

### Retirees
* This table shows a list of retiring employees who's birthdays fall within 1952 to 1955. There is a total of 133776 entries. There are duplicate entries 
since some employees have moved to other positions during their employment at PH. This file can be found in the Data folder of this project, retirement_titles.csv.
#### All Retirees [Retirement_titles.csv](https://github.com/summerstime/Pewlett_Hackard_Analysis/blob/main/Data/retirement_titles.csv)
![All Retirees](https://github.com/summerstime/Pewlett_Hackard_Analysis/blob/main/Screenshots/Retirement_titles.png) 

* The duplicates needed to be removed from this file. This was accomplished by utilizing Distinct ON and Order By.
This file can be found in the Data folder of this project, unique_titles.csv. After the process, there is a total of 90398 entries of the most recent job titles.
#### Retirees No Duplicates [Unique_titles.csv](https://github.com/summerstime/Pewlett_Hackard_Analysis/blob/main/Data/unique_titles.csv)
![Retirees No Duplicates](https://github.com/summerstime/Pewlett_Hackard_Analysis/blob/main/Screenshots/Unique_titles.png) 

### Mentorship Eligibility
* Mentorship eligibility was determined based on the employee's birthdate being during the year 1965. There is a total 1549 employees eligible for mentoring.
This file can be found in the Data folder, mentorship_eligibility.csv.
#### Mentorship Eligible [Mentorship_eligibility.csv](https://github.com/summerstime/Pewlett_Hackard_Analysis/blob/main/Data/mentorship_eligibility.csv)
![Mentorship Eligible](https://github.com/summerstime/Pewlett_Hackard_Analysis/blob/main/Screenshots/Mentorship_eligibility.png) 

### Mentors to Retirees
* Comparing the two files, unique_titles.csv for the retirees to the mentorship_eligibility.csv, it is clear that there are far more retiring employees than
the group listed for mentoring. With such a large gap between 90398 retirees to 1549 mentees, perhaps it would be beneficial to expand the date from just 1965.

## Summary
In summary, the following questions were asked:
* How many roles will need to be filled as the "silver tsunami" begins to make an impact?
. The unique_titles.csv file contains that list with 90,398 individuals who will retire in the coming years.
* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
. Yes, there is a strong possibility that there will be enough mentor volunteers for those who want a mentor. The screenshot below shows the number
of possible mentees.  
#### Mentorship Titles 
![Mentorship Titles](https://github.com/summerstime/Pewlett_Hackard_Analysis/blob/main/Screenshots/Mentorship_titles.png) 
* The comparison of the retiree titles available for mentoring changes as you remove the duplicates, remove those no longer employed, and evaluate the
possiblity that the younger retirees (born 1954-1955) would be more likely to be a mentor.
#### Retiree Titles Compared
![Retiree Titles](https://github.com/summerstime/Pewlett_Hackard_Analysis/blob/main/Screenshots/Retiree_title_compare.png) 

