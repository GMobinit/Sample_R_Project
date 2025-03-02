# Packages
install.packages("dplyr")
library("dplyr")

## Q1
# Importing data of adventure works database
sales.csv<-read.csv(choose.files(), header = TRUE, sep = ",")
product.csv<-read.csv(choose.files(), header = TRUE, sep = ",")
typeof(sales.csv)
head(sales.csv)
str(sales.csv)

# generate custom data
joined_data<-left_join(sales.csv, product.csv, by="ProductKey")
# customized_data<-joined_data[,c("SalesOrderNumber","Quantity","Unit.Price","Sales","Cost","Product","Category")]
customized_data_Frame<-data.frame(joined_data[,c("Quantity","Product")])

# group data
help("group_by")
grouped_data<-customized_data_Frame %>% group_by(Product) %>% summarise(Total_Qnty = sum(Quantity))
grouped_data

## Q3
p<-0.3
n<-15

  ### r=5
  exactly_five_time_success = dbinom(5,n,p)
  
  ### r>=7
  more_than_seven_success = pbinom(6,n,p,lower.tail = FALSE)
  