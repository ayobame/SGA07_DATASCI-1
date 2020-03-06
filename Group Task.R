View(read.table("raw/dictionary.csv", sep = "|"))




#dictionary=data.table::fread('raw/bureau_score.csv')
#data.table::fread('raw/bureau_score.csv')
#View(dictionary)
#
bureauscore=read.table("raw/bureau_score.csv", sep = ",", header = TRUE)


##literature review, articles, questions answered,comments

library(readr,dply,ggplot2,tidyverse,lubridate)
all_accounts<-read_csv("raw/all_accounts.csv")
all_balances <- read_csv("raw/all_balances.csv")
all_demographics <- read_delim("raw/all_demographics.csv", "|", escape_double = FALSE, trim_ws = TRUE)
all_investments <- read_csv("raw/all_investments.csv")
all_loans <- read_csv("raw/all_loans.csv")
all_loans_application <- read_csv("raw/all_loans_application.csv")
all_transactions_digital <- read_csv("raw/all_transactions_digital.csv")
bureau_score <- read_csv("raw/bureau_score.csv")
dictionary <- read_csv("raw/dictionary.csv", skip=1)


View(all_accounts)
View(all_balances)
View(all_demographics)
View(all_investments)
View(all_loans)
View(all_loans_application)
View(all_transactions_digital)
View(bureau_score)
View(dictionary)

all_accounts[-2]
(unique(all_accounts[1]))
nrow(unique(all_accounts[1]))

sum(all_accounts$ACY_AVL_BAL[all_accounts$RECORD_STAT=="C"]>0)

library(data.table)

all_accounts <- all_accounts %>% group_by(CUSTOMER_UNIQUE_ID)
all_accounts

#remove(dictionary)
#remove(all_investments.csv)
#remove(bureauscore)



variable.names(all_accounts)
dim(all_accounts)
names(all_accounts)
nrow(bureau_score)


summary(bureau_score$BUREAU_SCORE)
summary(bureau_score[3])
str(bureau_score[3])
sum(bureau_score[3]==NA)
is.data.frame(bureau_score)
names(bureau_score)
variable.names(bureau_score)


