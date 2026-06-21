# run_all.R
# Run this script to reproduce the entire analysis from scratch

# Step 1 - restore exact package versions
renv::restore()

# Step 2 - render the full report to PDF
rmarkdown::render("Tutorial_4_group_1_Income_inequality_and_housing_affordabilities_in_The_Netherlands.Rmd")