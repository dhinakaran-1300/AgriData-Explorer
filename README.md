# AgriData Explorer

AgriData Explorer is a project created to understand Indian agriculture using data analysis, SQL queries, and Power BI dashboards.
The project uses district-level crop data and provides insights on crop production, crop yield, and cultivated area across different states and years.

------------------------------------------------------------
## Project Objective
------------------------------------------------------------

The objective of this project is to clean the agricultural dataset, analyze it, answer SQL questions, and build visual dashboards that show key trends in Indian agriculture.

------------------------------------------------------------
## Key Features
------------------------------------------------------------

1. Data cleaning and preparation using Python
2. Exploratory Data Analysis (EDA)
3. SQL-based analytical queries
4. Power BI interactive dashboard
5. Insights on crop performance, cultivated area, and yield trends

------------------------------------------------------------
## Business Use Cases
------------------------------------------------------------

### Farmers
- Analyze historical crop performance
- Identify high-yield crops for specific regions

### Policymakers
- Identify low-productivity areas
- Plan targeted interventions and subsidies

### Researchers
- Study agricultural patterns over multiple years
- Analyze correlation between area and production

------------------------------------------------------------
## Project Workflow
------------------------------------------------------------

1. Collect agricultural dataset
2. Clean and preprocess data using Python
3. Store data in MySQL
4. Write SQL queries to extract insights
5. Build interactive Power BI reports
6. Document all findings

------------------------------------------------------------
## Technologies Used
------------------------------------------------------------

Python  
MySQL  
Power BI  
Pandas  
NumPy  
Plotly  
Jupyter Notebook  

------------------------------------------------------------
## Exploratory Data Analysis (EDA)
------------------------------------------------------------

The EDA includes:
- Rice, wheat, and maize production trends
- Oilseed and sunflower production by states
- 50-year sugarcane production analysis
- Rice vs wheat production comparison
- District-level crop production analysis
- Area vs production relationship
- Crop yield comparison across states

------------------------------------------------------------
## SQL Questions Answered
------------------------------------------------------------

1. Year-wise trend of rice production (Top 3 states)
2. Top 5 districts with highest wheat yield increase
3. States with highest growth in oilseed production
4. Correlation between area and production (Rice, Wheat, Maize)
5. Cotton production trend for top 5 states
6. Highest groundnut production districts
7. Annual average maize yield
8. Total oilseeds cultivated area by state
9. Districts with the highest rice yield
10. Wheat vs rice production comparison for top 5 states (10 years)

------------------------------------------------------------
## Power BI Dashboard
------------------------------------------------------------

The Power BI dashboard contains:
- Trend lines for crop production
- State-wise and district-wise comparisons
- Interactive filters (crop, year, state, district)
- Maps, bar charts, line charts, and KPI cards
- Drill-down and dynamic visuals

------------------------------------------------------------
## Recommended Folder Structure
------------------------------------------------------------

AgriData-Explorer  
│  
├── data  
├── notebooks  
│     AgriData Explorer.ipynb  
├── sql  
│     SQL Queries.sql  
├── visuals  
│     Visuals.pdf  
│     Visuals.pbix  
├── docs  
│     Requirement Document.pdf  
│     Queries with Output.pdf  
└── README.md  

------------------------------------------------------------
## How to Run the Project
------------------------------------------------------------

### Python
1. Install required Python packages
2. Open and run the Jupyter Notebook

### MySQL
1. Create a database
2. Import the dataset
3. Run the SQL queries from the file

### Power BI
1. Open the .pbix file
2. Connect to MySQL if needed
3. Refresh the dashboard

------------------------------------------------------------
## Dataset Information
------------------------------------------------------------

The dataset includes:
- District and state codes
- District and state names
- Crop area (1000 hectares)
- Crop production (1000 tons)
- Crop yield (kg per hectare)
- Data on rice, wheat, maize, sorghum, oilseeds, sugarcane, cotton, fruits, vegetables, and more
- Multiple years of historical agricultural data

------------------------------------------------------------
## Results
------------------------------------------------------------

- Cleaned and structured dataset
- SQL-based answers for all required questions
- Interactive Power BI dashboard
- Insights for farmers, policymakers, and researchers
