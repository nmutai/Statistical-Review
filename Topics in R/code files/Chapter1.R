#############################
## Chapter  1. Basics 
### The console, the editor, and basic syntax in R

# R can be used as a calculator
2 + 2
4*5
6^2
3+5*2
(3+5)*2
# 2+2

# R is an object-oriented language. Object assignment below.
a = 5

a

a*2
a

#Note that the above manipulations do not actually change the assigned value
# of the object a. If you want to change "a", you have to assign "a" a new
# value, e.g. see below. R is case sensitive.
a=a*2

#Note that <- and = are equivalent. But good practice is to use <- for 
# assignment and to reserve = for passing arguments through functions.

#Vector Assignment
sms=c(0,1,2,0,0,0,1)
# C() "means concatenate"
# () passes an argument
# () Allows R to differentiate between functions and variables

#vector arithmetic
sms + 5
sms * 5
sms/2
sort(sms)

#looking at specific entries within a vector. Square brackets "[]" are
# used for indexing vectors, matrices, data tables, and arrays.
sms[3]
sms[2:4]
sms[-3]
sms[-(2:3)]
sms[-c(2,3,7)]

#logical extraction with vectors. The first command returns a 
# "logical vector". Note that R treats logical values as FALSE = 0 
# and TRUE = 1  
sms>0
sms[sms>0]

sum(sms>0)

which(sms>0)
sms[which(sms>0)]
mean(sms[which(sms>0)])

# Notice that the code mean(sms[sms > 0]) gives the same
# output as mean(sms[which(sms > 0)])

sms
sms[1]=1
sms

1:50

x=c("a","b","c","d","e","f","g","h","i")
y=21:30
z=c(2,4,6)

# the below "vector calls" show how vectors can interact with one another
x[y]

x[z]

y[z]

z[y]

#"rev" reverses the order of z so if z=c(2,4,6) 
# then rev(z) = x(6,4,2)

x[rev(z)] 

y[x]

# the below vector multiplication results in an error. Notice that the 
# length of y and z are different. Vector y contains 10 elements while
# vector z contains only 3 elements. When multiplying y and z, the first
# element of y is myltiplied by the first element of z, the second by the
# the second, the third by the third. But the fourth element of y is then
# multiplied by the first element of z. Thus element of z are repeatedly
# used in repitiious manner. The error comes not from the fact that a vector
# is repeated but that it is repeated in an uneven manner. The 10th element
# of y is multiplied by the first element of z. If we restrict vector y to 
# only the first 9 elements and then multiply by vector z, there would
# not be an error.
y*z

# Some Important Commands
# Function | Description
# ---------|------------
# sd()     | standard deviation
# median() | median
# max()    | maximum
# min()    | minimum
# range()  | maximum and minimum
# length() | number of elements of a vector
# cummin() | cumulative min (or max cummax() )
# diff()   | differences between successive elements of a vector
# rm()     | removes objects from workspace
# ls()     | lists objects in workspace, does not print object values
  
#Basic "for" Loops

#Note 1: {} are option if everthing fits on one line. Good practice is to 
# always add them so that you don't forget them when you need them.

#Note 2: letters contains only 26 elements, so when the below for loop calls
# to print 27 characters, the 27th entry will br NA.
for (i in 1:27) {cat(letters[i])}

#Note 3: when running code in loops, values are not printed unless stated,
# cat() does this.

#Randomly sample 14 values from 1:26, without replacement. Run everal times
# for convincing.
for (i in sample(x = 1:26,size = 14)) cat(LETTERS[i])

#for loops with non-numeric character strings
x<-c("Most","loops","in","R","can","be","avoided")
for (i in x){cat(paste(i,"!"))}

###### VI. Exercises. ######

## 1)## Enter the following data in R and call it `P1`:  
# `23,45,67,46,57,23,83,59,12,64`
p1 = c(23,45,67,46,57,23,83,59,12,64)

# What is the maximum value? What is the minimum value? What is the mean value?
max(p1)   #maximum value of p1
min(p1)   #minimum value of p1
mean(p1)  #mean value of p1

## 2)## Oh no! The next to last (9th) value was mistyped - it should be 42. Change it, and see how the mean has changed. How many values are greater than 40? What is the mean of values over 40?
# Hint: how do you see the 9th element of the vector `P1`?
p1[9] <- 42  #substitute the value of 42 into the 9th entry of p1

# limit the vector p1 by values of p1 that are greater than 40. the length of this conditional vector is the number of values greater than 40 in p1
p1
p1 >40
p1[p1>40]
length(p1[p1>40])
mean(p1[p1>40])

## 3)## Using the data from problem ##2## find:  
# a) the sum of `P1`  
sum(p1)

# b) the mean (using the sum and `length(P1)`)
mean(p1)
a <- sum(p1)
b <- length(p1)
a/b

# c) the log(base10) of `P1` - use `log(base=10)`
log(p1, base = 10)
log10(p1)

# d) the difference between each element of `P1` and the mean of `P1`
p1 - mean(p1)

## 4)## If we  have two vectors, `a=11:20` and `b=c(2,4,6,8)` predict (_without running the code_) the outcome of the following (After you make your predictions, you can check yourself by running the code):  
# a) `a*2`
# a*2 will multiply all entries of vector a by 2. a=11:20 is actually the vector a = c(11,12,13,14,15,16,17,18,19,20), thus a*2 = c(22,24,26,28,30,32,34,36,38,40)

# b) `a[b]`  
# a[b] find the bth entries of vector a. In other words a[b] is the vector showing the 2nd, 4th, 6th, and 8th elements of vector a, or 12, 14, 16, and 18.

# c) `b[a]`
# Similar to (b) b[a] prints the 11th through 20th elements if vector b. However, since vector b contains only four elements, the resulting output will be 10 NA's

# d) `c(a,b)`
# This entry defines the union of vectors a and b,and will print all units from both a and b.

# e) `a+b
# adds entries from a and b. since vector b contains less entries than vector a, vector b will be "recycled" and repeated. An error message will appear 
# because vector b will not be recycled in an even manner.
