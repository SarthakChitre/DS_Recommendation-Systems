#Installing and loading the libraries
install.packages("recommenderlab", dependencies=TRUE)
install.packages("Matrix")
library("recommenderlab")
library(caTools)
??recommenderlab
#movie rating data
book_rate_data <- read.csv(file.choose())
book_rate_data=book_rate_data[-c(1)]

View(book_rate_data)

#metadata about the variable
str(book_rate_data)


#rating distribution
hist(book_rate_data$Book.Rating)

#the datatype should be realRatingMatrix inorder to build recommendation engine
book_rate_data_matrix <- as(book_rate_data, 'realRatingMatrix')
book_rate_data_matrix@data
#Popularity based 

book_recomm_model1 <- Recommender(book_rate_data_matrix, method="POPULAR", parameter=book_rate_data$Book.Rating)

#Predictions for two users 
recommended_items1 <- predict(book_recomm_model1, book_rate_data_matrix[17], n=7)
recommended_items1_2 <- predict(book_recomm_model1, book_rate_data_matrix[10], n=7)

as(recommended_items1, "list")
as(recommended_items1_2, "list")


## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering

book_recomm_model2 <- Recommender(book_rate_data_matrix, method="UBCF")

#Predictions for two users 
recommended_items2 <- predict(book_recomm_model2, book_rate_data_matrix, n=5)
as(recommended_items2, "list")

