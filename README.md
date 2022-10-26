# Pewlett-Hackard-Analysis

## Purpose

Pewlett Hackard is a large company with over 300,000 employees. As the baby boomers began to retire, the company is preparing for the furture in 2 ways 1) offering a retirement package for eligible employees and 2) considering position fulfillment.  As part of the effort Bobby and I have been tasked with determining the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. [^1]


<sub>Fig.1 - ERD</sub>

![EmployeeDB](https://user-images.githubusercontent.com/112449480/197890609-8f9a44ee-66f5-497a-a168-caf00ef55dd4.png)



## Results
As part of the effort, specific criteria was set to determine an employee's eligibility information; review current employees only whom were born between January 1, 1952 and December 31, 1955.

Based on the criteria set forth and additional information we determined the following:
- A total of 72,458 current employees are eligible for retirement.
- Senior Engineers (36%) and Senior Staff (34%) account for the majority of employees eligible for retirement. We would need to focus a significant amount of training in these positions.
- There are 2 Managers eligible for retirement.
- There are 1,549 employees eligible for the mentorship program. 

<sub>Fig.2 - Number of Eligible Retirees by Title</sub>

![CountByTitle_Eligible Retirees](https://user-images.githubusercontent.com/112449480/197843844-75531097-ae42-49ef-a942-81c79e1d72e2.png)



## Summary
In summary, there are over 72,000 roles that will be impacted as a result of the "silver tsunami".  Further analysis show the roles are across all departments with the largest impact being the Development, Production and Sales departments, approximately 45,876 roles.


<sub>Fig.3 - Number of Eligible Retirees by Title per Department</sub>

![TitleByDept_EligibleRetirees](https://user-images.githubusercontent.com/112449480/197846131-ebbc8578-26b9-46fb-9eb6-26ebbb217433.png)



<sub>Fig.4 - Code for Eligible Retirees Titles by Department.</sub>

![SQLCode_TitleByDept](https://user-images.githubusercontent.com/112449480/197849244-3d3f75e5-a8a3-4fe6-832c-9e660bf54ce1.png)


There are 1,549 qualified, retirement-ready employees for the mentorship program.  There would need to be an increase in mentors to ensure adequate coverage for each area.



<sub>Fig.5 - Total Salaries by Title for Eligible Retirees.</sub>

![TotalSalaryByTitle_EligibleRetirees](https://user-images.githubusercontent.com/112449480/197896141-522b2446-8e66-45c9-83f3-140a92749c6b.png)




[^1]: Utilize some of description from Module 7 work to assist in writing my background for the Challenge 
[^2]: Utilize some of description from Module 7 Challenge- Deliverable to assist with formulating my analysis for the Analysis of Outcomes Based on Goals section.
