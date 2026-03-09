# Currency Converter Web Application

## Project Overview
This project is a web-based Currency Converter developed using Java Servlets, JSP, MySQL, and an Exchange Rate API.  
The application allows users to convert one currency into another using the latest exchange rates stored in a database.

The system automatically retrieves daily exchange rate data from an external API and stores it in MySQL. The stored exchange rates are then used to perform currency conversions efficiently. The application also allows exporting the stored exchange-rate data in CSV format.

---

## Features
- Convert between multiple currencies (USD, EUR, INR, GBP, AUD, CAD, JPY, CNY, CHF)
- Automatic exchange rate updates using an API
- Database storage of exchange rate data
- CSV export of stored exchange rates
- Web-based user interface for currency conversion

---

## Technologies Used
- Java (Servlets)
- JSP
- MySQL
- Apache Tomcat
- HTML / CSS
- Exchange Rate API

---

## API Used
This project uses the **Frankfurter Exchange Rate API** to retrieve foreign exchange rate data.

API Website:  
https://www.frankfurter.app/

Example API endpoints used in this project:

Latest exchange rates
```
https://api.frankfurter.app/latest
```

Latest rates for a specific currency
```
https://api.frankfurter.app/latest?from=USD
```

Historical exchange rates (used by AutoRateUpdater)
```
https://api.frankfurter.app/2026-01-01..2026-03-09?from=USD
```

The API is used to automatically fetch daily exchange rates and store them in the database.

---

## Project Structure
```
CurrencyConverter
│
├── src/com/currency
│   ├── CurrencyServlet.java
│   ├── AutoRateUpdater.java
│   ├── DBConnection.java
│   └── ExportHistoryServlet.java
│
├── webapp
│   └── index.jsp
│
├── images
│   ├── conversion.png
│   ├── csv.png
│   ├── mysql1.png
│   └── mysql2.png
│
├── database.sql
└── README.md
```

---

## Setup Instructions

1. Install **Java JDK**
2. Install **Apache Tomcat**
3. Install **MySQL**
4. Import the project into **Eclipse**
5. Run the SQL script to create the database
6. Update database credentials in `DBConnection.java`
7. Start the Tomcat server
8. Open the application in a browser:

```
http://localhost:8080/CurrencyConverter
```

---

## Database Setup

Run the following SQL script:

```sql
CREATE DATABASE cu_co;

USE cu_co;

CREATE TABLE currency_rates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    base_currency VARCHAR(10),
    rate_date DATE,
    USD DOUBLE,
    EUR DOUBLE,
    INR DOUBLE,
    GBP DOUBLE,
    AUD DOUBLE,
    CAD DOUBLE,
    JPY DOUBLE,
    CNY DOUBLE,
    CHF DOUBLE
);
```

The application automatically fetches exchange rate data from the API when the server starts.

---



## Author
This project was developed by:

- **Smit Patil**
- **Shirin Shaikh**
