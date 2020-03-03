###################Book data set Assignment###########################
install.packages("arules")
library(arules)
library(arulesViz)
book<-read.csv(file.choose())
View(book)
class(book)
book_trans<-as(as.matrix(book),"transactions")
inspect(book_trans)
# If we inspect book_trans
# we should get transactions of items i.e.
# As we have 2000 rows ..so we should get 2000 transactions 
# Each row represents one transaction
# After converting the binary format of data frame from matrix to transactions
# Perform apriori algorithm 
rules<-apriori(as.matrix(book),parameter = list(support=0.002,confidence=0.7))
#writing ... [3686 rule(s)] done [0.02s].
inspect(rules[1:100])
plot(rules)
rules1<-apriori(as.matrix(book),parameter = list(support=0.02,confidence=0.5,minlen=2))
#writing ... [672 rule(s)] done [0.01s].
inspect(rules1[1:100])
rules3<-apriori(as.matrix(book),parameter = list(support=0.1,confidence=0.5,minlen=3))
#28 rules found
inspect(rules3[1:20])
plot(rules3)



##############Groceries Assignment#############################
groceries<-read.transactions(file.choose(),format = basket)
View(groceries)
class(groceries)
groceries_rule1<-apriori(groceries,parameter = list(support=0.002,confidence=0.05,minlen=2))
#430 found
inspect(groceries_rule1[1:300])
groceries_rule2<-apriori(groceries,parameter = list(support=0.02,confidence=0.01,minlen=2))
#4 rules found
inspect(groceries_rule1[1:4])
plot(groceries_rule2)


##############Movies Assignment#################################

movies<-read.csv(file.choose())
View(movies)
class(movies)
movie_new<-movies[6:15]
View(movie_new)
class(movie_new)

rule1<-apriori(as.matrix(movie_new),parameter = list(support=0.002,confidence=0.7))
#writing ... [79 rule(s)] found
inspect(rule1[1:70])
rule2<-apriori(as.matrix(movie_new),parameter = list(support=0.02,confidence=0.5,minlen=3))
#74 rules found
inspect(rule2[1:20])
rule3<-apriori(as.matrix(movie_new),parameter = list(support=0.2,confidence=0.1,minlen=2))
#13 rules found
inspect(rule3[1:12])
plot(rule3)
