# SAP ABAP Classical Report - Flight Information

![ABAP Project CI](https://github.com/<your-username>/<your-repo-name>/actions/workflows/abap-project-ci.yml/badge.svg)

## 📌 Overview
This project is a **Classical Report in SAP ABAP** that retrieves flight data from the `SFLIGHT` table 
and displays it in a structured list format.

## 🚀 Features
- Selection screen with input parameters (`CARRID`, `CONNID`)
- Fetches real SAP flight data (`SFLIGHT`)
- Classical Report output using WRITE statements
- Displays total number of records

## 📂 Project Structure
```
Classical-Report-Flight/
├── ZFLIGHT_REPORT.abap   # Main ABAP program
└── README.md             # Project documentation
```

## 📷 Sample Output
```
Classical Report: Flight Information
---------------------------------------------------------------
CARRID   CONNID   FLDATE       PRICE     CURR  SEATSMAX SEATSOCC
---------------------------------------------------------------
LH       0400     09.09.2025   500.00    EUR   300      280
...
---------------------------------------------------------------
Total Records: 25
```

## 🧑‍💻 Author
Aayush Bairagi
