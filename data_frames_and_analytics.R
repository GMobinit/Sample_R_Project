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
  
## Q4

mean=100
sd=20

pnorm.110=pnorm(110, mean, sd,lower.tail = TRUE)
pnorm.90=pnorm(90, mean, sd,lower.tail = TRUE)
pnorm.90.110=pnorm.110-pnorm.90
pnorm.90.110

## Q5

internet_sales.csv=data.frame(read.csv(choose.files(), header = TRUE, sep = ","))
customized_internet_sales<-internet_sales.csv[,c("OrderQuantity","ProductKey")]
names(customized_internet_sales)<-c("Quantity", "ProductKey")

mixed_sales<-rbind(sales.csv[,c("Quantity","ProductKey")], customized_internet_sales[,c("Quantity","ProductKey")])
mixed_sales

## Q6

Customers.csv<-data.frame(read.csv(choose.files()))
sales.customer.dataframe<-left_join(internet_sales,Customers.csv,by="CustomerKey")

## Q7

merged.customer_sales<-merge(sales.csv, product.csv, by.x = "ResellerKey", by.y = "ProductKey")

## Q8
Territories.csv<-data.frame(read.csv(choose.files()))
merged.territory_sales<-merge(Territories.csv, sales.csv, by = "SalesTerritoryKey")
product_per_country<-merged.territory_sales[,c("Country","ProductKey","Quantity")]

total_sales_per_country<-product_per_country %>% group_by(Country) %>% summarise(totalSales = sum(Quantity))
max_sales=max(total_sales_per_country$totalSales)
min_sales=min(total_sales_per_country$totalSales)
average = mean(total_sales_per_country$totalSales)


## Q9
