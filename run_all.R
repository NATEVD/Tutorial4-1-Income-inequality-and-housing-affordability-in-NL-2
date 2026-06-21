# run_all.R

# Run this script to reproduce the entire analysis from scratch

# Step 1 - restore exact package versions
renv::restore()

# Step 2 - render the full report
rmarkdown::render("Template_Assignment.Rmd")