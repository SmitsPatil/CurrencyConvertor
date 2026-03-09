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