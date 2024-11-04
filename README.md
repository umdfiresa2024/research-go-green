# What is the impact of utility companies’ charging station rebates on EV adoption in New Jersey?


## Introduction:

Electric vehicle (EV) adoption is starting to rise and one of the most
challenging aspects is the transition between gasoline-powered vehicles
to electric ones. In the state of New Jersey, many utility companies are
starting to offer rebates and incentives for the purpose of installing
EV charging stations in various counties to maintain widespread
accessibility (Qmerit, 2024). The rebates are for reducing financial
issues and burdens on businesses, property wonders, and other
organizations in order to make it easier to install these stations.
Lowering the costs and increasing the availability of charging stations
through rebate programs, this attracts more EV customers and supports
the current ones. Our research is important to society because New
Jersey contains a high urban environment (New Jersey’s cleanenergy
program, 2020). These charging station rebates lead to clean
transportation choices and offer awareness to the public about the
importance of positive EV consumption. Using this research to promote
property wonders and businesses to understand the relationship between
rebates and EV adoption, helps New Jersey’s objectives to reducing
greenhouse gasses and promoting healthy energy uses.

## Existing Research:

Electric vehicle (EV) charging rebates are financial incentives that are
given by governments and certain organizations to encourage people to
acquire electric vehicles. When one applies for a rebate after
purchasing an EV charging station, one can receive some money back. This
helps promote cleaner transportation options and makes charging stations
more affordable and convenient.This study will build on existing
findings and delve deeper into the impact of utility companies’ charging
station rebates on electric vehicle adoption. Despite there being some
research done on similar topics, there are noticeable gaps. Certain
studies have focused on border areas from a geographical standpoint, or
also lack specific information on the impact of rebates on EV adoption
rates in New Jersey. Other studies also may not have researched consumer
behavior, accessibility affordability, and rebate mechanisms overall.
Muehlegger & Rapson (2022) studied EV adoption in California and helped
strengthen our data when focusing on New Jersey by using reliable
comparisons (Muehlegger & Rapson, 2022). The state of California gives a
broader perspective of what the subsidies and purchases of EVs are from
another geographic location. Clinton & Steinberg (2019) explained the
relationship between financial incentives and EV adoption through its
lessons (Clinton & Steinberg, 2019). Our study will address those gaps
due to focusing strictly on New Jersey and its direct impact of the
rebates on EV adoption.

## Data Description:

### Outcome Variable:

- The outcome variable is Vehicle.Count (EV sales) in the zip codes
  covered by AEC and PSEG in New Jersey. This measures the number of
  electric vehicles registered, which serves as a proxy for EV adoption
  in response to the treatment (rebate programs).

### Treatment Variable:

- The treatment variable is the rebate programs offered by the utility
  companies (AEC_Rebate, PSEG_Rebate). These rebates are intended to
  incentivize the installation of EV charging stations, which, in turn,
  could increase EV adoption.

- **PSEG:**  Electric Vehicle Charging Program which was implemented on
  June 15, 2022, offers \$1,500 for Level 2 EVSE make-ready
  infrastructure. \$5,000 discount for utility-side make-ready costs.

- **Atlantic City Electric:** Residential Charger Rebate Program
  implemented on February 17, 2021, rebate up to 50% of electrical
  upgrade costs – or a maximum of \$1,000 – for installing a Level 2 EV
  charger at home.

### Frequency/Geographic Unit:

- Frequency: The dataset is semi-annual, with observations collected
  every six months from 2016 to 2023.

- Geographic Unit: The data is organized by zip code.

### Treated and Untreated Group:

- Treated Group: Zip codes served by utility companies that provide
  rebates, specifically AEC and PSEG.

- Untreated Group: Zip codes served by utility companies that do not
  provide rebates, specifically OR (Rockland Electric Company) and JCP&L
  (Jersey Central Power & Light).

### Data Cleaning and Analysis:

Step 1. Install necessary packages.

``` r
install.packages("tidyverse")
```

    Installing package into '/cloud/lib/x86_64-pc-linux-gnu-library/4.4'
    (as 'lib' is unspecified)

``` r
install.packages("kableExtra")
```

    Installing package into '/cloud/lib/x86_64-pc-linux-gnu-library/4.4'
    (as 'lib' is unspecified)

Step 2. Declare that you will use these packages in this session.

``` r
library("tidyverse")
```

    ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ✔ purrr     1.0.2     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library("kableExtra")
```


    Attaching package: 'kableExtra'

    The following object is masked from 'package:dplyr':

        group_rows

Step 3. Upload the dataframe that you have created in Spring 2024 into
the repository.

Step 4. Open the dataframe into the RStudio Environment.

``` r
df<-read.csv("panel (1).csv")
```

Step 5. Use the **head** and **kable** function showcase the first 10
rows of the dataframe to the reader.

``` r
kable(head(df))
```

| X | ZIP.Code | NAME | Registration.Date | Vehicle.Count | AEC_Rebate | AEC | PSEG_Rebate | PSEG | REC_Rebate | REC | JCPL_Rebate | JCPL |
|---:|---:|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | 7001 | Public Service Electric & Gas Co. | 2019-06-01 | 21 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 |
| 2 | 7001 | Public Service Electric & Gas Co. | 2021-06-01 | 45 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 |
| 3 | 7001 | Public Service Electric & Gas Co. | 2022-06-01 | 59 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
| 4 | 7001 | Public Service Electric & Gas Co. | 2017-06-01 | 5 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 |
| 5 | 7001 | Public Service Electric & Gas Co. | 2021-12-01 | 53 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
| 6 | 7001 | Public Service Electric & Gas Co. | 2022-12-01 | 67 | 1 | 0 | 1 | 1 | 1 | 0 | 1 | 0 |

Step 6: Create a boxplot to visualize the distribution of the outcome
variable under treatment and no treatment.

``` r
df2 <- df %>%
  mutate(Registration.Date = as.Date(Registration.Date)) %>%
  filter(Registration.Date < as.Date("2022-06-01")) %>%
  group_by(Registration.Date, NAME, AEC_Rebate, PSEG_Rebate, AEC, PSEG) %>%
  summarize(Total_EV = sum(Vehicle.Count))
```

    `summarise()` has grouped output by 'Registration.Date', 'NAME', 'AEC_Rebate',
    'PSEG_Rebate', 'AEC'. You can override using the `.groups` argument.

``` r
ggplot(df2, aes(x = Registration.Date, y = Total_EV, color = NAME)) + geom_line()
```

![](README_files/figure-commonmark/unnamed-chunk-5-1.png)

``` r
model1<-lm(Total_EV ~ AEC*AEC_Rebate + PSEG*PSEG_Rebate, data=df2)
summary(model1)
```


    Call:
    lm(formula = Total_EV ~ AEC * AEC_Rebate + PSEG * PSEG_Rebate, 
        data = df2)

    Residuals:
       Min     1Q Median     3Q    Max 
     -9560  -1133  -1105     -3  17316 

    Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
    (Intercept)        1146.0      549.5   2.086 0.040095 *  
    AEC                 576.4     1563.8   0.369 0.713374    
    AEC_Rebate         2709.4     1514.4   1.789 0.077252 .  
    PSEG              13321.1     1475.0   9.031 5.66e-14 ***
    PSEG_Rebate        -343.7     2019.2  -0.170 0.865260    
    AEC:AEC_Rebate     -144.9     3484.5  -0.042 0.966921    
    PSEG:PSEG_Rebate  17469.2     4646.0   3.760 0.000315 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 4141 on 83 degrees of freedom
    Multiple R-squared:  0.631, Adjusted R-squared:  0.6044 
    F-statistic: 23.66 on 6 and 83 DF,  p-value: 4.058e-16

## Preliminary Regression Results:

Step 8: Fit a regression model $y=\beta_0 + \beta_1 x + \epsilon$ where
$y$ is the outcome variable and $x$ is the treatment variable. Use the
**summary** function to display the results.

``` r
glimpse(df)
```

    Rows: 8,442
    Columns: 13
    $ X                 <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 1…
    $ ZIP.Code          <int> 7001, 7001, 7001, 7001, 7001, 7001, 7001, 7001, 7001…
    $ NAME              <chr> "Public Service Electric & Gas Co.", "Public Service…
    $ Registration.Date <chr> "2019-06-01", "2021-06-01", "2022-06-01", "2017-06-0…
    $ Vehicle.Count     <int> 21, 45, 59, 5, 53, 67, 187, 14, 10, 130, 40, 30, 28,…
    $ AEC_Rebate        <int> 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1…
    $ AEC               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ PSEG_Rebate       <int> 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1…
    $ PSEG              <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    $ REC_Rebate        <int> 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1…
    $ REC               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ JCPL_Rebate       <int> 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1…
    $ JCPL              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…

``` r
#df2 <- df %>%
 # mutate(Registration.Date = as.Date(Registration.Date)) %>%
  #filter(Registration.Date < as.Date("2022-06-01")) 
```

## Question 1: What is the predicted value of the outcome variable when treatment=0?

Answer: 36 EV sales per zip code per 6 months

## Question 2: What is predicted value of the outcome variable when treatment=1?

Answer: AEC = 28(decreased), PSEG = 103(increased)

## Question 3: What is the equation that describes the linear regression above? Please include an explanation of the variables and subscripts.

Answer: $
y = \beta_0 + \beta_1 AEC + \beta_2 AECRebate + \beta_3 AEC*AECRebate + \beta_4  + \beta_5 PSEG + \beta_6 PSEGRebate + \beta_7 PSEG*PSEGRebate
$

y represents the expected amount of vechile sales in the zip codes
covered by AEC and PSEG in New Jersey

``` r
#install.packages("lfe")
library("lfe")
```

    Loading required package: Matrix


    Attaching package: 'Matrix'

    The following objects are masked from 'package:tidyr':

        expand, pack, unpack

``` r
df4 <- df2 %>%
  filter(NAME == "Jersey Central Power & Light" | NAME == "Public Service Electric & Gas Co.")
  
model3 <- felm(Total_EV ~ PSEG*PSEG_Rebate, data=df4)
summary(model3)
```


    Call:
       felm(formula = Total_EV ~ PSEG * PSEG_Rebate, data = df4) 

    Residuals:
        Min      1Q  Median      3Q     Max 
    -9861.1 -3565.6  -141.8  2632.1 11569.9 

    Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
    (Intercept)          8819       1927   4.577  0.00031 ***
    PSEG                 5950       2725   2.184  0.04423 *  
    PSEG_Rebate         12009       6093   1.971  0.06626 .  
    PSEG:PSEG_Rebate     7524       8616   0.873  0.39542    
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 5780 on 16 degrees of freedom
    Multiple R-squared(full model): 0.5663   Adjusted R-squared: 0.4849 
    Multiple R-squared(proj model): 0.5663   Adjusted R-squared: 0.4849 
    F-statistic(full model):6.963 on 3 and 16 DF, p-value: 0.003277 
    F-statistic(proj model): 6.963 on 3 and 16 DF, p-value: 0.003277 

``` r
df5 <- df2 %>%
  filter (NAME == "Atlantic City Electric" | NAME == "Rockland Electric Company")

model4 <- felm(Total_EV ~ AEC*AEC_Rebate, data=df5)
summary(model4)
```


    Call:
       felm(formula = Total_EV ~ AEC * AEC_Rebate, data = df5) 

    Residuals:
         Min       1Q   Median       3Q      Max 
    -1015.38  -388.53     5.75   356.47  1149.62 

    Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
    (Intercept)      1078.2      209.6   5.145 9.78e-05 ***
    AEC               644.1      296.4   2.173   0.0451 *  
    AEC_Rebate       1209.8      468.6   2.581   0.0201 *  
    AEC:AEC_Rebate   1182.9      662.7   1.785   0.0933 .  
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 592.8 on 16 degrees of freedom
    Multiple R-squared(full model): 0.7323   Adjusted R-squared: 0.6821 
    Multiple R-squared(proj model): 0.7323   Adjusted R-squared: 0.6821 
    F-statistic(full model):14.59 on 3 and 16 DF, p-value: 7.685e-05 
    F-statistic(proj model): 14.59 on 3 and 16 DF, p-value: 7.685e-05 

## Future Plans:

Our future plans include a more detailed analysis taking other variables
into account. For example, we could look at electricity costs in
different seasons to see if that impacts the perceived benefit of EV
charging station rebates. We also plan to look at other states and
rebate policies based on the data available. This would help us compare
our preliminary results of New Jersey to other states to see if trends
are similar.

## Bibliography:

Clinton, B. C., & Steinberg, D. C. (2019). Providing the Spark: Impact
of financial incentives on battery electric vehicle adoption. Journal of
Environmental Economics and Management, 98, 102255.
https://doi.org/10.1016/j.jeem.2019.102255 

Electric Vehicle Incentive Programs \| NJ OCE Web Site. (2020).
Njcleanenergy.com.
https://www.njcleanenergy.com/ev?gad_source=1&gclid=Cj0KCQiA_qG5BhDTARIsAA0UHSIhzHJDWQ_QdSyRdiJZgAbI6xi1JgecGyTVxcU6rW_Zgq9IrJDr1wAaAh9FEALw_wcB 

EV Residential Charging Program. EV Residential Charging Program -
PSE&G. (n.d.).
https://nj.myaccount.pseg.com/myservicepublic/electricvehicles-residential-program

EV promotions & tax credits.
(n.d.).https://jerseycentral.chooseev.com/promos/#:~:text=Through%20JCP&L’s%20EV%20Driven%20Program,at%20each%20qualifying%20installation%20site

Muehlegger, E., & Rapson, D. S. (2022). Subsidizing low- and
middle-income adoption of electric vehicles: Quasi-experimental evidence
from California. Journal of Public Economics, 216(216), 104752.
https://doi.org/10.1016/j.jpubeco.2022.104752 

New Jersey EV Rebates & Charging Incentives (2024, July). Qmerit.
https://qmerit.com/location/new-jersey/ 

Orange & Rockland. (n.d.).
https://www.oru.com/en/our-energy-future/electric-vehicles/new-jersey/residential-ev-drivers/charger-ready-for-home

Residential Charger Rebate. Atlantic City Electric. (n.d.).
https://www.atlanticcityelectric.com/smart-energy/innovation-technology/residential-charger-rebate
