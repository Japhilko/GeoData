#---------------------------------------------------------------------------#
# Gesis Summerschool 2013 - Analysis of Complex Survey Data
# Day 1 - Toolbox
#
# First steps
#
# Stephanie Eckman and Jan-Philipp Kolb
#
#                                                             27.06.2013
#---------------------------------------------------------------------------#


a <- 1

  # combining things with c
b <- c(1,2)

  # compute the mean for object b
mean(b)

  # Length of object b
length(b)

  # structure of object b
str(b)

####
# Different types of data

  # this object is different from b
d <- "Hello world"

  # logical vector
logi <- c(T,F)

  # character vector
char <- c("A","b")

  # factor
fac <- as.factor(c(1,2))

  # with str() you get the structure

str(fac)

#---------------------------------------------#
# Indexing
#---------------------------------------------#


# vector
A1 <- c(1,2,3,4)
A1
A1[1]
A1[4]
A1[1:3]
A1[-4]

# dataframe

AA <- 4:1
A2 <- cbind(A1,AA)
A2[1,1]
A2[2,]
A2[,1]
A2[,1:2]

# array

A3 <- array(1:8,c(2,2,2))
A3
A3[,,2]

# list

A4 <- list(A1,1)
A4
A4[[2]]


#---------------------------------------------#
# Sequences
#---------------------------------------------#

# sequence from 1 to 10
1:10

seq(-2,8,by=1.5)

a<-seq(3,12,length=12)

b<- seq(to=5,length=12,by=0.2)

d <-1:10
d<- seq(1,10,1)
d <- seq(length=10,from=1,by=1)

# replicate 1 10 times
rep(1,10)
rep("A",10)


#---------------------------------------------#
# Further useful functions
#---------------------------------------------#

max(b)
min(b)
sd(b)
var(b)
median(b)
quantile(b,.9)

  # draw a sample
sample(b,1)

#---------------------------------------------#
# Necessary Libraries
#---------------------------------------------#

  # many functions are in the bas package
  # but sometimes you need more specified ones

  # than you have to install these packages
  
install.package("lme4")

  # and load them into the workspace

library(lme4)

  # if install.packages does not work, because 
  # you do not have an internet conection
  # Sometimes it is enough to conduct library()
  # because they are already installed

install.package("foreign")
install.package("sampling")
install.package("survey")

install.package("lattice")
install.package("vcd")
install.package("ggplot2")

install.package("xtable")
install.package("dummies")
install.package("mvtnorm")
install.package("maptools")

  # Load the libraries
library("foreign")
library("sampling")
library("survey")

library("lattice")
library("vcd")
library("ggplot2")

library("xtable")
library("dummies")
library("mvtnorm")
library("maptools")

#---------------------------------------------#
# How to get help
#---------------------------------------------#

help.start()

help(mean)

?mean

  # often you can get examples
  # like the following one for linear regression

example(lm)

#---------------------------------------------#
# Import and Export of data
#---------------------------------------------#

library(foreign)

  # you have to tell R where the data is:

setwd("D:/Dropbox/Samp & Analysis 2013/exercises/datasets")

  # with dir() you can see what's in your recent 
  # directory

dir()

nhis <- read.csv("nhis.csv")

  # Have a first look at the data
head(nhis)


#---------------------------------------------#
# Sampling
#---------------------------------------------#

?sample

sample(x=1:10,n=1,replace=T)


#---------------------------------------------#
# Basic graohics
#---------------------------------------------#

  # you have to adjust the following path to your computer:
graph.path <- "D:/Dropbox/Samp & Analysis 2013/slidesApplied/graphs"

setwd(graph.path)

  # Draw random numbers:

  # Uniform Distribution
x1 <- runif(1000)
  # Normal distribution
x2 <- rnorm(1000)
  # Exponential distribution
x3 <- rexp(1000)

rnorm(100,mean=0,sd=1)


  # hist() for generation of histograms:
hist(x1,main="")

  # you can save the graphic as png with the function png()
png("HistX1.png")
  hist(x1,main="")
dev.off()

png("HistX2.png")
  hist(x2,main="")
dev.off()

png("HistX3.png")
  hist(x3,main="")
dev.off()



typeof(b)


library(MASS)

#############################################################################
# General things
#############################################################################

#---------------------------------------------------------------------------#
# How to conduct a regression
#---------------------------------------------------------------------------#

  # lm is used to fit linear models.

?lm

  # We create a simple dataset:

N <- 100
y <- rnorm(N)
x1 <- rnorm(N)
x2 <- rnorm(N)
x3 <- sample(1:2,N,replace=T)
x4 <- sample(c("m","f"),N,replace=T)


Dat <- data.frame(y,x1,x2,x3,x4)

  # Our first model:

lm(y ~ x1,data=Dat)

  # the dependent variable is always on the lefthandside of the tilde
  # the independent variables are always on the righthandside of the tilde

  # you can see more with summary:

summary(lm(y ~ x1,data=Dat))

  # It is always useful to save the models in objects:

mod1 <- lm(y ~ x1,data=Dat)
summary(mod1)

  # if you have more than one independent variable:

mod2 <- lm(y ~ x1 + x2,data=Dat)

  # if you have a Dummy:

mod3 <- lm(y ~ x1 + as.factor(x3),data=Dat)
summary(mod3)

  # x4 differs in coding from x3, that is why you do not need as.factor() here

mod4 <- lm(y ~ x4,data=Dat)
summary(mod4)

  # if you want to add interaction:

mod5 <- lm(y ~ as.factor(x3):x4,data=Dat)
summary(mod5)

  # if you do not want to integrate an intercept:

mod6 <- lm(y ~ -1 + x1:x4,data=Dat)
summary(mod6)

#############################################################################
# Base weights
#############################################################################

head(housing)

 # polr fits a logistic or probit regression model to an ordered factor response. 

attach(housing)
pmod1 <- polr(Sat ~ Infl, weights = Freq)

pmod2 <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
summary(pmod2)
