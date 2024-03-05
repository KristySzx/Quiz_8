install.packages(lmtest)
# Load necessary library
library(lmtest)

# Simulate independent variables
set.seed(123) # for reproducibility
earth <- rnorm(100, mean = 50, sd = 10)
fire <- rnorm(100, mean = 30, sd = 5)
wind <- rnorm(100, mean = 20, sd = 8)
water <- rnorm(100, mean = 40, sd = 7)

# Simulate dependent variable 'heart' based on the other four
# We assume some arbitrary coefficients for the linear relationship
heart <- 3.5 * earth + 2.2 * fire + 5.1 * wind + 1.7 * water + rnorm(100, mean = 0, sd = 10)

# Combine the variables into a data frame
data <- data.frame(earth, fire, wind, water, heart)

# Fit linear regression model
model <- lm(heart ~ earth + fire + wind + water, data = data)

# Output the summary of the model
summary(model)

# Additional diagnostics
# Check for autocorrelation
durbinWatsonTest(model)

# Plot the residuals to check for homoscedasticity and normality
par(mfrow=c(2,2))
plot(model)


