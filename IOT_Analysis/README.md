# IoT Environmental Monitoring Dashboard 🌆📶

## 📌 Project Overview
This project was created as part of my learning journey to **practice Power BI and SQL skills** using IoT sensor data.  
The main objective was to gain hands-on experience in **data cleaning, ETL, and dashboard design**, while simulating how environmental monitoring can be applied in smart buildings and cities.  

## 🗃️ Dataset
The dataset contained time-series IoT sensor readings with the following fields:

- `Timestamp`
- `Device ID`
- `Temperature`
- `Humidity`
- `CO2`, etc

  ## 🔧 Data Preprocessing (SQL)
- Converted raw timestamp column into proper datetime format  
- Handled duplicates and ensured data integrity  
- Created **threshold categories** (e.g., Safe / Moderate / Hazardous) for PM2.5 and CO2  
- Ensured no missing values before visualization

  ## 📊 Dashboard Highlights (Power BI)
- **Stacked Column Chart** – Daily alert trends by sensor type
- **KPI Card** – Total alerts across all sensors on a given date
- **Donut Chart** – Alerts breakdown by Device ID
- **Bar Chart** – Total alert count by sensor type
- **Line Chart** – Average sensor readings per day
- **Forecast Line Chart** – Alert trends & forecast by device

  ## 💡 Insights & Business Value
- Enabled **device-level monitoring** across multiple sensors
- Certain devices consistently generated more alerts, pointing to location-specific issues.
-  Trends + forecasts enable **predictive anomaly monitoring**, not just reactive checks  
- Early anomaly detection helps facility managers take timely action  
- Supports **health, safety, and energy efficiency** in smart buildings 

## 🛠️ Tools Used
- **SQL** → ETL, data cleaning, threshold categorization  
- **Power BI** → Interactive dashboards and anomaly detection visuals  

## Dashboard
![IOT Dashboard](IOT_Analysis/IoT_DA.png)
