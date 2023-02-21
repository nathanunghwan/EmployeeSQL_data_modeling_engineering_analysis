# EmployeeSQL Data modeling, Engineering and Analysis
***
It’s a task to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.
For this project, I’ll perform data modeling, data engineering, and data analysis, respectively.

## Data Modeling
First, I checked the CSV file and sketched the ERD as below.

<img
  src="./ERD.png"
  width="350"
  height="250"
/>

## Data Engineering
Based on ERD, a table schema was created considering data types, primary keys, foreign keys and other constraints. Import each CSV file into its corresponding SQL table.

## Data Analysis

- List the employee number, last name, first name, sex, and salary of each employee.

- List the first name, last name, and hire date for the employees who were hired in 1986.

- List the manager of each department along with their department number, department name, employee number, last name, and first name.

- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

- List each employee in the Sales department, including their employee number, last name, and first name.

- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

## Analysis in conjunction with Jupiter notebook and database.
```
# Import
from sqlalchemy import create_engine

# create engine and connect
engine = create_engine(f'postgresql://{username}:{password}@localhost:5432/employee_DB')
conn = engine.connect()

# query records from the database
departments_data=pd.read_sql("select * from departments",conn)
departments_data.head()

# Use the bins and labels to group data in a dataframe employees_data['employement_period_Year']=pd.cut(employees_data['employement_period'],bins=bins, labels=labels)
pd_cut_employees=employees_data
pd_cut_employees.head()

# merge title_emp with salary data
all_employees = pd.merge(salary_data, title_emp_merged, on = 'emp_no', how = 'left')
all_employees=all_employees.dropna(axis=0).reset_index()
all_employees.head()

## get the average salary by title and employment period
avg_salaries=all_employees.groupby(['employement_period_Year','title'])['salary'].mean()
avg_salaries=avg_salaries.dropna(axis=0).reset_index()
avg_salaries
```

## Visualization using pivot chart
df_pivot = avg_salaries.pivot(index='employement_period_Year',
columns='title',values='salary')

df_pivot.plot.bar(rot=0)

plt.title('Average Salary By Title As Employment Period', color='black')

plt.ylabel("Salary")

plt.legend(loc='center left', bbox_to_anchor=(1, 0.5))


<img
  src="./Image/Average Salary by Title (each by employment period).png"
  width="450"
  height="250"
/>
