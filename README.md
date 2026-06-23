# Income Inequality and Housing Affordability in Dutch Municipalities
Tutorial 4, Group 1 - Vrije Universiteit Amsterdam
Authors: Toms Kelderis, Mijke Gerritsen, Nathan van Doorn, Frederick Nuboer, Khpelwaak Mamound, Caner Tepe, Fouad Safssafi

## What this project does 

This report quantifies the relationship between income inequality and housing affordability across Dutch municipalities using CBS administrative data (2015-2021).

## Data sources

All data is downloaded automatically via the 'cbsodataR' package when the Rmd is knitted. No manual downloads are needed. The CBS table numbers are:
|
Dataset
|
CBS table
|
Years
|
|
---
|
---
|
---
|
|
Kerncijfers wijken en buurten (quintile income)
|
83220NED, 83487NED, 83765NED, 84286NED, 84583NED, 84799NED, 85039NED
|
2015-2021
|
|
Inkomen van huishoudens (median income)
|
85064NED
|
2015-2020
|
|
Woningen naar type (housing stock)
|
82550NED
|
2015-2021
|

## How to reproduce 
1. Clone this repository
2. Open `Tutorial-4-group-1-Income-inequality-and-housing-affordabilities-in-The-Netherlands.Rmd` in RStudio
3. Click **knit** - all packages install automatically on first run and all data downloads from CBS Open Data via the API

## Repository structure 
```
├── Template_Assignment.Rmd   # main analysis file
├── data/                     # cleaned datasets saved as .rds (auto-generated)
└── README.md                 # this file
```
