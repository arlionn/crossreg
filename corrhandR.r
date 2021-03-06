# Fall 2017 - Adam Ross Nelson - Modified for R draft.
# Fall 2015 - Adam Ross Nelson - Originally exectued in Stata.
#           - See: https:github.com/adamrossnelson/crossreg/blob/master/corrhandStata.do
# Maintained at: https:github.com/adamrossnelson/crossreg

# Use this R file to calculate the correlation without using stndard packages.
# Can be used to assist when learning how to calculate by by hand. Or, useful
# when double checking hand

library(readr)

y <- c(3,7,6,6,6,3,3,6)
x <- c(2,10,9,5,8,2,4,8)
df <- data.frame(y, x)

# Display the original datafram
print(df)
cat(rep("\n",2))

# Individually calculate Y-bar (or Ysubi minus Ybar) | The error terms
df$ymybar <- df$y - mean(df$y)

# Individually calculate X-bar (or Xsubi minus Xbar) | The error terms
df$xmxbar <- df$x - mean(df$x)

# Generate the covariances; then use to calculate numerator
# This term is stated as sum of the error terms (from above) multiplied together
df$covxy <- df$ymybar * df$xmxbar
cov <- sum(df$covxy)

# Generate squared errors
# The sum of squared error of y is stored in variable -ymy-
df$ymybarsq <- df$ymybar * df$ymybar
ymy <- sum(df$ymybarsq)

# The sum of squared error of x is stored in variable -xmx-
df$xmxbarsq <- df$xmxbar * df$xmxbar
xmx <- sum(df$xmxbarsq)

# Display the datafram with additional variables.
print(df)
cat(rep("\n",2))

# Display the results
print('The data correlation hand calculated results : ')
print((cov)/(sqrt(ymy * xmx)))
cat(rep("\n",2))
print('Provide formula notes for reference : ')
print(cor(df$y, df$x))

print(readLines("https://raw.githubusercontent.com/adamrossnelson/crossreg/master/formulas.txt"))
