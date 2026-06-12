# WTF IS THIS IN THE CHUNK FOR THIS SECTION (I REMOVED IT)
```{r visualise_subpopulations}
dataset$inmetro <- dataset$inmetro %>% as.factor()
# Boxplot of poverty rate by state using the 'midwest' dataset
ggplot(dataset, aes(x = inmetro, y = percadultpoverty)) +
  geom_boxplot() +
  labs(
    title = "Distribution of Poverty Rates by Metropolitan status (Midwest counties)",
    x = "Metropolitan Area",
    y = "Poverty Rate of Adults (%)"
  ) +
  theme_minimal() +
  theme(
    legend.position = "right"
  )
```
#???

#What is the poverty rate by state? ~why was this Q at the top of the section???~

# SUB-POPULATION VARIATION / COMPARISON

# filter to 2021 
subpop_data<-quintile_income%>%
  filter(year==2021)

# create income categories (groups)
subpop_data<-subpop_data%>%
  mutate(
    income_category=case_when(
      avg_income<25~"Low income",
      avg_income<=32~"Medium income",
      TRUE~"High income"
    )
  )

# create renter groups
subpop_data<-subpop_data%>%
  mutate(
    renter_group=case_when(
      pct_renter>40~"High renter share",
      TRUE~"Low renter share"
    )
  )

# checking the groups (income cat. + renter group)
table(subpop_data$income_category)
table(subpop_data$renter_group)

# MAKING THE BOXPLOT
ggplot(
  subpop_data,
  aes(
    x=income_category,
    y=affordability_ratio,
    fill=renter_group
  )
)+
  geom_boxplot()+
  labs(
    title="Housing affordability by income category and renter share (2021).",
    x="Income category",
    y="Affordability ratio",
    fill="Renter share",
    caption="Source: CBS (2021)"
  )+
  scale_fill_viridis_d()+
  theme_minimal()

ggsave(
  "VISUALIZATIONS/subpopulation_boxplot.png",
  width = 8,
  height = 5,
  dpi = 300
)


# calculating means for interpretation (of boxplot)
subpop_data%>%
  group_by(income_category,renter_group)%>%
  summarise(
    mean_affordability=mean(affordability_ratio, na.rm=TRUE),
    n=n()
  )

# MAKING GROUPED BAR CHART
# summary dataset
bar_data<-subpop_data%>%
  group_by(income_category,renter_group)%>%
  summarise(
    mean_affordability=
      mean(affordability_ratio,na.rm=TRUE)
  )
# PLOTTING
ggplot(
  bar_data,
  aes(
    x=income_category,
    y=mean_affordability,
    fill=renter_group
  )
)+
  geom_col(position = "dodge")+
  labs(
    title="Average housing affordability by income category and renter share (2021)",
    x="Income category",
    y="Average affordability ratio",
    fill="Renter share",
    caption ="Source: CBS (2021)"
  )+
  scale_fill_viridis_d(option = "cividis")+
  theme_minimal()
    
ggsave(
  "VISUALIZATIONS/subpopulation_barchart.png",
  width = 8,
  height = 5,
  dpi = 300
)

    
    
    
    
    
    
    
  
