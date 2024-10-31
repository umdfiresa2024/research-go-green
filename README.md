# What is the impact of utility companies’ charging station rebates on
EV adoption in Maryland?


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

## Question 1: What is the frequency of this data frame?

Answer: Semi-annually from 2016 - 2023

## Question 2: What is the cross-sectional (geographical) unit of this data frame?

Answer: Zipcode

Step 6. Use the **names** function to display all the variables (column)
in the dataframe.

``` r
names(df)
```

     [1] "X"                 "ZIP.Code"          "NAME"             
     [4] "Registration.Date" "Vehicle.Count"     "AEC_Rebate"       
     [7] "AEC"               "PSEG_Rebate"       "PSEG"             
    [10] "REC_Rebate"        "REC"               "JCPL_Rebate"      
    [13] "JCPL"             

## Question 3: Which column represents the treatment variable of interest?

Answer: Rebate columns for all electric companies

## Question 4: Which column represents the outcome variable of interest?

Answer: Vehicle.Count (EV Sales)

Step 7: Create a boxplot to visualize the distribution of the outcome
variable under treatment and no treatment.

``` r
df2 <- df %>%
  mutate(Registration.Date = as.Date(Registration.Date)) %>%
  filter(Registration.Date <= as.Date("2022-06-01")) %>%
  group_by(Registration.Date, NAME) %>%
  summarize(Total_EV = sum(Vehicle.Count))
```

    `summarise()` has grouped output by 'Registration.Date'. You can override using
    the `.groups` argument.

``` r
ggplot(df2, aes(x = Registration.Date, y = Total_EV, color = NAME)) + geom_line()
```

![](README_files/figure-commonmark/unnamed-chunk-6-1.png)

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
df2 <- df %>%
  mutate(Registration.Date = as.Date(Registration.Date)) %>%
  filter(Registration.Date <= as.Date("2022-06-01")) 
  
  
#data_combined<- rbind(df_BGE, df_SMECO)
model1<-lm(Vehicle.Count ~ AEC*AEC_Rebate + PSEG*PSEG_Rebate, data=df2)

summary(model1)
```


    Call:
    lm(formula = Vehicle.Count ~ AEC * AEC_Rebate + PSEG * PSEG_Rebate, 
        data = df2)

    Residuals:
        Min      1Q  Median      3Q     Max 
    -151.35  -38.02  -17.82    9.18 1404.65 

    Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
    (Intercept)        36.822      2.013  18.288  < 2e-16 ***
    AEC               -20.261      3.773  -5.370 8.16e-08 ***
    AEC_Rebate         46.084      4.157  11.086  < 2e-16 ***
    PSEG               16.200      2.730   5.933 3.12e-09 ***
    PSEG_Rebate        24.666      5.286   4.666 3.13e-06 ***
    AEC:AEC_Rebate    -34.125      7.041  -4.847 1.28e-06 ***
    PSEG:PSEG_Rebate   27.579      6.221   4.433 9.42e-06 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 92.04 on 6626 degrees of freedom
    Multiple R-squared:  0.1337,    Adjusted R-squared:  0.1329 
    F-statistic: 170.5 on 6 and 6626 DF,  p-value: < 2.2e-16

## Question 5: What is the predicted value of the outcome variable when treatment=0?

Answer: 36 EV sales per zip code per 6 months

## Question 6: What is predicted value of the outcome variable when treatment=1?

Answer: AEC = 28(decreased), PSEG = 103(increased)

## Question 7: What is the equation that describes the linear regression above? Please include an explanation of the variables and subscripts.

Answer: $$
y = \beta_0 + \beta_1 AEC + \beta_2 AECRebate + \beta_3 AEC*AECRebate + \beta_4  + \beta_5 PSEG + \beta_6 PSEGRebate + \beta_7 PSEG*PSEGRebate
$$

y represents the expected amount of vechile sales in the zip codes
covered by AEC and PSEG in New Jersey

## Question 8: What fixed effects can be included in the regression? What does each fixed effects control for? Please include a new equation that incorporates the fixed effects.

Answer: Fixed effects include Zipcode, Company, Semi-annual Indicator,
Year

\## Question 9: What is the impact of the treatment effect once fixed
effects are included?

``` r
install.packages("lfe")
```

    Installing package into '/cloud/lib/x86_64-pc-linux-gnu-library/4.4'
    (as 'lib' is unspecified)

``` r
library("lfe")
```

    Loading required package: Matrix


    Attaching package: 'Matrix'

    The following objects are masked from 'package:tidyr':

        expand, pack, unpack

``` r
df3<-df2 %>%
  mutate(H2=ifelse(str_detect(Registration.Date, "12"), 1, 0)) %>%
  mutate(year=year(Registration.Date))
           
model2<-felm(Vehicle.Count ~ AEC*AEC_Rebate + PSEG*PSEG_Rebate +H2| 
               ZIP.Code + year, data=df3)
```

    Warning in chol.default(mat, pivot = TRUE, tol = tol): the matrix is either
    rank-deficient or not positive definite

``` r
summary(model2)
```

    Warning in chol.default(mat, pivot = TRUE, tol = tol): the matrix is either
    rank-deficient or not positive definite


    Call:
       felm(formula = Vehicle.Count ~ AEC * AEC_Rebate + PSEG * PSEG_Rebate +      H2 | ZIP.Code + year, data = df3) 

    Residuals:
        Min      1Q  Median      3Q     Max 
    -543.56  -13.99    1.43   15.30  684.39 

    Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
    AEC                   NaN         NA     NaN      NaN    
    AEC_Rebate            NaN         NA     NaN      NaN    
    PSEG                  NaN         NA     NaN      NaN    
    PSEG_Rebate         3.212      3.466   0.927    0.354    
    H2                  9.012      1.418   6.357 2.21e-10 ***
    AEC:AEC_Rebate    -34.125      3.766  -9.062  < 2e-16 ***
    PSEG:PSEG_Rebate   27.579      3.327   8.289  < 2e-16 ***
    ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    Residual standard error: 49.23 on 6021 degrees of freedom
    Multiple R-squared(full model): 0.7748   Adjusted R-squared: 0.752 
    Multiple R-squared(proj model): 0.05141   Adjusted R-squared: -0.04485 
    F-statistic(full model):33.91 on 611 and 6021 DF, p-value: < 2.2e-16 
    F-statistic(proj model): 46.62 on 7 and 6021 DF, p-value: < 2.2e-16 

Answer:

# Questions for Week 5

## Question 10: In a difference-in-differences (DiD) model, what is the treatment GROUP?

Answer: Zip codes covered by AEC and PSEG

## Question 11: In a DiD model, what are the control groups?

Answer: Zip codes covered by OR and JCPL

## Question 14: What are the next steps of your research?

Step 9: Change the document format to gfm

Step 10: Save this document as README.qmd

Step 11: Render the document. README.md file should be created after
this process.

Step 12: Push the document back to GitHub and observe your beautiful
document in your repository!

Step 13: If your team has a complete dataframe that includes both the
treated and outcome variable, you are done with the assignment. If not,
make a research plan in Notion to collect data on the outcome and
treatment variable and combine it into one dataframe.
