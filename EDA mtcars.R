AllDemographics <- read.table('raw/all_demographics.csv', stringsAsFactors = FALSE, sep = '|', header = TRUE)




mtcars
View(mtcars)

length(mtcars)
is.data.frame(mtcars)
is.table(mtcars)
mtcars[1]
mtcars[0]
mtcars[2]
names(mtcars)
length(names(mtcars))
head(datasets::women)
head(mtcars)
str(mtcars)
str(mtcars[2])


seq(mtcars)
class(mtcars)
class(mtcars[1])


dim(mtcars)
names(mtcars)
max(mtcars)
min(mtcars)
unique(mtcars$gear)
str(mtcars)


names(mtcars)

mtcars$vs = factor(mtcars$vs)
mtcars$cyl = factor(mtcars$cyl)
mtcars$am = factor(mtcars$am)
mtcars$gear = factor(mtcars$gear)
mtcars$carb = factor(mtcars$carb)
str(mtcars)


#counting
nrow(mtcars$vs)
nrow(mtcars)

str(mtcars$vs)
unique(mtcars$vs)

table(mtcars$vs)[2]


table(mtcars$vs)
table(mtcars$cyl)
table(mtcars$am)
table(mtcars$gear)
table(mtcars$carb)

#summary
skew_check=function(attribute){
  summary(attribute)
  ifelse (summary(attribute)[4] > summary(attribute)[3],
  
    return (list(summary(attribute)," The mean is greater than median POSITIVELY SKEWED")),
    return(list(summary(attribute),"The mean is less than median NEG SKEWED"))
  )
}
skew_check(mtcars$mpg)
skew_check(mtcars$disp)
skew_check(mtcars$hp)
skew_check(mtcars$drat)
skew_check(mtcars$wt)
skew_check(mtcars$qsec)

#Graphics
library(ggplot2)

#bar chart (categorical)
ggplot(as.data.frame(table(mtcars$vs)), aes(x=Var1, y=Freq))+geom_bar(stat = "identity")
ggplot(as.data.frame(table(mtcars$cyl)), aes(x=Var1, y=Freq))+geom_bar(stat = "identity")
ggplot(as.data.frame(table(mtcars$am)), aes(x=Var1, y=Freq))+geom_bar(stat = "identity")
ggplot(as.data.frame(table(mtcars$gear)), aes(x=Var1, y=Freq))+geom_bar(stat = "identity")
ggplot(as.data.frame(table(mtcars$carb)), aes(x=Var1, y=Freq))+geom_bar(stat = "identity")


#Line chart (numerical)
ggplot(data = mtcars, aes(x=seq(1, nrow(mtcars)), y=mpg)) +geom_line(aes(group=1))
ggplot(data = mtcars, aes(x=seq(1, nrow(mtcars)), y=disp)) +geom_line(aes(group=1))
ggplot(data = mtcars, aes(x=seq(1, nrow(mtcars)), y=hp)) +geom_line(aes(group=1))
ggplot(data = mtcars, aes(x=seq(1, nrow(mtcars)), y=drat)) +geom_line(aes(group=1))
ggplot(data = mtcars, aes(x=seq(1, nrow(mtcars)), y=wt)) +geom_line(aes(group=1))
ggplot(data = mtcars, aes(x=seq(1, nrow(mtcars)), y=qsec)) +geom_line(aes(group=1))

#Histogram
ggplot(data = mtcars, aes(x=mpg)) + geom_histogram(binwidth = 0.5)
ggplot(data = mtcars, aes(x=disp)) + geom_histogram(binwidth = 0.5)
ggplot(data = mtcars, aes(x=hp)) + geom_histogram(binwidth = 0.5)
ggplot(data = mtcars, aes(x=drat)) + geom_histogram(binwidth = 0.5)
ggplot(data = mtcars, aes(x=wt)) + geom_histogram(binwidth = 0.5)
ggplot(data = mtcars, aes(x=qsec)) + geom_histogram(binwidth = 0.5)


#box plot
ggplot(mtcars, aes(factor(mtcars$vs), y=mpg))+geom_boxplot()
ggplot(mtcars, aes(factor(mtcars$vs), y=disp))+geom_boxplot()
ggplot(mtcars, aes(factor(mtcars$vs), y=hp))+geom_boxplot()
ggplot(mtcars, aes(factor(mtcars$vs), y=drat))+geom_boxplot()
ggplot(mtcars, aes(factor(mtcars$vs), y=wt))+geom_boxplot()
ggplot(mtcars, aes(factor(mtcars$vs), y=qsec))+geom_boxplot()

#scatter plot
ggplot(mtcars, aes(x=mpg, y=disp))+geom_point(shape=1)
ggplot(mtcars, aes(x=mpg, y=disp, color=factor(mtcars$vs)))+geom_point(shape=1)

