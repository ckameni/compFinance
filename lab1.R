
# Download the file
data_url = "http://faculty.washington.edu/ezivot/econ424/sbuxPrices.csv"
download.file(data_url, "./sbuxPrices.csv")



# Load the data frame using read.csv
sbux_df = read.csv("./sbuxPrices.csv" ,header=T,stringsAsFactors=F)


# The sbux_df data frame is already loaded in your work space
str(sbux_df)
head(sbux_df)
tail(sbux_df)
class(sbux_df$Date)


# The sbux_df data frame is already loaded in your work space
closing_prices = sbux_df[,2,drop=F]
closing_prices


# Find indices associated with the dates 3/1/1994 and 3/1/1995
index_1 = which(sbux_df$Date=="3/1/1994")
index_2 = which(sbux_df$Date=="3/1/1995")
# Extract prices between 3/1/1994 and 3/1/1995
some_prices = sbux_df[index_1:index_2,2]
#######################################################

Subset directly on dates

The way you selected the data from a specific trading day in the previous exercise
was not very convenient, right?
When you create a data frame that has the dates of the stock price as row names, 
you can select the price on a specific day much more easily. The sample code on
the right creates a new data frame sbux_prices_df that has the trading days as row 
names. You can select the price on 3/1/1994 now simply 
with sbux_prices_df["3/1/1994", 1].


Instructions

Assign to price_1 the Starbucks stock price on 3/1/1994.
price_1<-sbux_df["3/1/1994", 1]
Assign to price_2 the Starbucks stock price on 3/1/1995.
price_2<-sbux_prices_df["3/1/1995", 1]



# Create a new data frame that contains the price data with the dates as the row names
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]
rownames(sbux_prices_df) = sbux_df$Date
head(sbux_prices_df)

# With Dates as rownames, you can subset directly on the dates.
# Find indices associated with the dates 3/1/1994 and 3/1/1995.
price_1 = sbux_prices_df["3/1/1994", 1]
price_2 = sbux_prices_df["3/1/1995", 1]


##################################
Plot the price data

R has powerful graphical capabilities. On the right, the Starbucks
closing prices are plotted as a function of time. This plot was
generated with plot(sbux_df$Adj.Close), the basic plotting function 
(more info in the documentation of plot).
However, we should be able to generate a nicer plot, right? For one
thing, a line plot makes much more sense for price time series data.
Instructions


# Now add all relevant arguments to the plot function below to get a nicer plot
plot(sbux_df$Adj.Close)










##################
Calculate simple returns

If you denote by Pt the stock price at the end of month t, the simple return 
is given by: Rt=(Pt − Pt−1)/Pt−1, the percentage price difference.
Your task in this exercise is to compute the simple returns for every time point n.
The fact that R is vectorized makes that relatively easy. In case you would like 
to calculate the price difference over time, you can use sbux_prices_df[2:n,1] - 
  sbux_prices_df[1:(n-1),1]. Think about why this indeed calculates the price
difference for all time periods. The first vector contains all prices, except
the price on the first day. The second vector contains all prices except the 
price on the last day. Given the fact that R takes the element-wise difference of
these vectors, you get Pt−Pt−1 for every t.

Instructions


Assign to sbux_ret the simple returns for the Starbucks stock.




# The sbux_df data frame is already loaded in your work space
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]

# Denote n the number of time periods
n = nrow(sbux_prices_df)
sbux_ret = 
  
  # Notice that sbux_ret is not a data frame object
  class(sbux_ret)
Let us make a better plot by adding the following arguments to the plot function: type="l" specifies a line plot, col="blue" indicates that the line should be blue, lwd=2 doubles the line thickness, ylab="Adjusted close" adds a y-axis label and
main="Monthly closing price of SBUX" adds a title.



##################
Add dates to simple return vector

The vector sbux_ret now contains the simple returns of Starbucks (well done!). 
It would be convenient to have the dates as names for the elements of that vector.
Remember that the trading dates were in the first column of the sbux_df data frame. To set the names of a vector, you can use names(vector) = some_names.
Remember that we are dealing with closing prices. The first return in sbux_df is 
thus realized on the second day, or sbux_prices_df[2,1].
Instructions

Assign the correct dates as names to all elements of the return vector sbux_ret.
Use the head function to display the first elements of sbux_ret.



# The sbux_df data frame is already loaded in your work space
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]

# Denote n the number of time periods:
n = nrow(sbux_prices_df)
sbux_ret = ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n-1), 1])/sbux_prices_df[1:(n-1), 1])

# Notice that sbux_ret is not a data frame object
class(sbux_ret)

# Now add dates as names to the vector and print the first elements of sbux_ret to the console to check





################

Compute continuously compounded 1-month returns

As you might remember from class, the relation between single-period and 
multi-period returns is multiplicative for single returns. That is not very 
convenient. 
The yearly return is for example the geometric average of the monthly returns.
Therefore, in practice you will often use continuously compounded returns. 
These returns have an additive relationship between single and multi-period returns
and are defined as rt=ln(1+Rt) with Rt the simple return and rt the continuously
compounded return at moment t.

Continuously compounded returns can be computed easily in R by realizing
that rt=ln(Pt/Pt−1) and ln(Pt/Pt−1)=ln(Pt)−ln(Pt−1). In R, the log price can be 
easily computed through log(price). Notice how the log function in R 
actually computes the natural logarithm.

Instructions

Compute the continuously compounded returns and assign to sbux_ccret.
Set the names of the sbux_ccret to the correct dates, as you did in the previous exercise.
Use the head function to display the first elements of sbux_ccret.
CODESOLUTION

1
2
3
4
5
6
7
8
9
10
11
12
13
# The sbux_df data frame is already loaded in your work space
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]
# Denote n the number of time periods:
n = nrow(sbux_prices_df)
sbux_ret = ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n-1), 1])/sbux_prices_
            df[1:(n-1), 1])
# Compute continuously compounded 1-month returns
sbux_ccret  
# Assign names to the continuously compounded 1-month returns
names(sbux_ccret) 
# Show sbux_ccret
Submit Answer
>  
  
  
  Introduction to Computational Finance and Financial Econometrics
Lab 1 - Return calculations
Lab 2 - Random variables and probability distributions
Lab 3 - Bivariate distributions
Lab 4 - Simulating time series data
Lab 5 - Analyzing stock returns
Lab 6 - Constant expected return model
Lab 7 - Introduction to portfolio theory
Lab 8 - Computing efficient portfolios using matrix algebra




# The sbux_df data frame is already loaded in your work space
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]

# Denote n the number of time periods:
n = nrow(sbux_prices_df)
sbux_ret = ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n-1), 1])/sbux_prices_df[1:(n-1), 1])

# Compute continuously compounded 1-month returns
sbux_ccret  
# Assign names to the continuously compounded 1-month returns
names(sbux_ccret) 
# Show sbux_ccret


##############################
Compare simple and continuously compounded returns

You would like to compare the simple and the continuously compounded returns. 
In the next exercise, you will do that by generating two graphs. In this exercise,
you will just have a quick look at the data. It would be nice to have the simple
and continuously compounded return next to each other in a matrix, with n rows and 
two columns. You can use the cbind function to paste the two vectors that contain 
both types of returns next to each other in a matrix.
Instructions

Use the cbind and head function to display the simple and continuously compounded
returns next to each other for the first time periods. What do you notice?



# The sbux_df data frame is already loaded in your work space
sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]

# Denote n the number of time periods:
n = nrow(sbux_prices_df)
sbux_ret = ((sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n-1), 1])/sbux_prices_df[1:(n-1), 1])

# Compute continuously compounded 1-month returns
sbux_ccret = log(sbux_prices_df[2:n,1]) - log(sbux_prices_df[1:(n-1),1])
names(sbux_ccret) = sbux_df[2:n,1]
head(sbux_ccret)

# Compare the simple and cc returns
