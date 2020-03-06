---
title: "GROUP TASK 1: Application of Data Science Tools and Technique to Improve a Lending Business"
authors: "Ayobami Adeyeye; Jindu Kwentua; Eyo Ekpenyong"
date: "3/6/2020"
output: pdf_document
---



## Summary
The goal of this report seeks to apply data science techniques to determine how derived insight can help benefit a lending business.

## Introduction

The Nigerian Lending space is ripe with amazing potentials given its reception and the competitive rates available to meet the diverse monetary needs of a wide array of customers. Using data science, exploratory data analysis and a data set from one of Nigerian's leading banks, our objective will be to analyze this data in order to provide answers the following questions which seeks to benefit the bank's lending business.

**-	What does the loan data distribution for the bank look like?** Using data science  we will illustrate the most important aspects related to the loans and perform EDA

**-	Are the loan grades from the bank optimal?** Loan grades measure the likelihood of a client to incur a default, hence crucial for the bank's profitablility. So perhaps if we could build a predictive model that can classify loans applications as performing or non-performing and compare against the already existing data on loan performance we could measure optimality of the model to predict if a loan application is likely to default.

**-	Can we create an alternative credit scoring framework?**


## Data Preparation and Preprocessing

**Data source:** Awaiting permission...

  
**The Data set:** The dataset contains 9 csv files which includes a file for referencing names mentioned in other files for better meaning named "dictionary.csv".

all_accounts.csv

all_balances.csv

all_demographics.csv

all_investments.csv

all_loans.csv

all_loans_application.csv

all_transactions_digital.csv

bureau_score.csv

dictionary.csv

 
**Featured Tools**: R, python

***Loading libraries in R:*** data.table,tidyverse,lubridate,ggplot2, dply

```{r library}
library(pacman)
pacman::p_load(data.table,tidyverse,lubridate,ggplot2, dply)
```

**Preprocessing**
```{r}
### All loans df
AllLoans <- fread('all_loans.csv', stringsAsFactors = F, drop = c('PRODUCT_NAME', 'CURRENCY'))
AllLoansdf <- AllLoans %>% group_by(CUSTOMER_UNIQUE_ID) %>% filter(BOOK_DATE == max(BOOK_DATE))
### All loans application
AllLoansApplication <- fread('all_loans_application.csv', drop = c('OFFERID','APPLICATION_STATUS', 'MODULE'))
AllLoansAppdf <- AllLoansApplication %>% group_by(CUSTOMER_UNIQUE_ID) %>% filter(DATE_OF_APPLY
 == max(DATE_OF_APPLY))
### All transaction digital imported in
AllTransactionsDigital <- fread('all_transactions_digital.csv', select = c('CUSTOMER_UNIQUE_ID','MASKED_ACCT','LCY_AMOUNT'))
#### AN aggregate of digital transactions
ATdf <- aggregate( AllTransactionsDigital$LCY_AMOUNT, by=list(CUSTOMER_UNIQUE_ID= AllTransactionsDigital$CUSTOMER_UNIQUE_ID), FUN=sum)
### All Accounts
AllAccountsDf <- read.csv('all_accounts.csv')
### All balance
AllBalancesDf <-fread('all_balances.csv')
#### All balance aggregate
AllBalancesDf <- aggregate( AllBalancesDf$BAL, by=list(CUSTOMER_UNIQUE_ID = AllBalancesDf$CUSTOMER_UNIQUE_ID, MASKED_ACCOUNT = AllBalancesDf$MASKED_ACCOUNT ), FUN=sum)
names(AllBalancesDf)[3] <- 'AggBal'
### All demographics
AllDemographics <- fread('all_demographics.csv',  stringsAsFactors = FALSE, sep = '|', header = TRUE, select = c('CUSTOMER_UNIQUE_ID', 'CUSTOMER_TYPE','MARITAL_STATUS','DATE_OF_BIRTH', 'SEX') )
AllInvestmentsDf <- read.csv('all_investments.csv')
### BUREAU SCORE
BureauScore <- fread('bureau_score.csv', drop = c('CUSTOMER_TYPE', 'BUREAU_SCORE', 'CPO','LOAN_CT'))
BSDF <- aggregate( BureauScore$APPROVED_AMT, by=list(CUSTOMER_UNIQUE_ID= BureauScore$CUSTOMER_UNIQUE_ID, APPROVE_AMT= BureauScore$APPROVED_AMT), FUN=sum)
length(unique(BureauScore$CUSTOMER_UNIQUE_ID)) 
length(unique(AllAccountsDf$CUSTOMER_UNIQUE_ID))
length(unique(AllTransactionsDigital$CUSTOMER_UNIQUE_ID))
# ddply(AllAccountsDf, "Species", summarise, 
#   wmn = weighted.mean(Sepal.Length, Petal.Length),
#   mn = mean(Sepal.Length))
# glimpse(AllAccountsDf)
# str(AllAccountsDf)
# str(AllBalancesDf)
# AllBalancesDf$VAL_DT <- mdy( as.character(AllBalancesDf$VAL_DT) )
# str(AllDemographicsDf)
```



## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
