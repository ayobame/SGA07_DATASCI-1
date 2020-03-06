---
title: "GROUP TASK 1: Application of Data Science Tools and Technique to Improve a Lending Business"
authors: "Ayobami Adeyeye; Jindu Kwentua; Eyo Ekpenyong"
date: "3/6/2020"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Summary
The goal of this report seeks to apply data science techniques to determine how derived insight can help benefit a lending business.

## Introduction

The Nigerian Lending space is ripe with amazing potentials given its reception and the competitive rates available to meet the diverse monetary needs of a wide array of customers. Using data science, exploratory data analysis and a data set from one of Nigerian's leading banks, our objective will be to analyze this data in order to provide answers the following questions which seeks to benefit the bank's lending business.

**-	What does the loan data distribution for the bank look like?** Using data science  we will illustrate the most important aspects related to the loans and perform EDA

**-	Are the loan grades from the bank optimal?** Loan grades measure the likelihood of a client to incur a default, hence crucial for the bank's profitablility. So perhaps if we could build a predictive model that can classify loans applications as performing or non-performing and compare against the already existing data on loan performance we could measure optimality of the model to predict if a loan application is likely to default.

**-	Can we create an alternative credit scoring framework?**


## Data Preparation and Preprocessing

Data source: Awaiting permission...

**The Data set**
The dataset contains 9 csv files which includes a file for referencing names mentioned in other files for better meaning named "dictionary.csv".

all_accounts.csv

all_balances.csv

all_demographics.csv

all_investments.csv

all_loans.csv

all_loans_application.csv

all_transactions_digital.csv

bureau_score.csv

dictionary.csv


```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
