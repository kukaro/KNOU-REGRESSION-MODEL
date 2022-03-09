market <- read.table('./market-1.txt', header=T)
market.lm <- lm(Y ~ X, data = market)
market.lm.summary <- summary(market.lm)
plot(market$X, market$Y, xlab='Advertising Fee', ylab='Total Sales', pch=19)
title("Scatterplot of Advertising Fees and Sales ")
abline(market.lm)
identify(market$X, market$Y)
β0 <- market.lm.summary$coefficients[2, 1]
β1 <- market.lm.summary$coefficients[1, 1]
xbar <- mean(market$X)
ybar <- mean(market$Y)
text(xbar, ybar, paste0('(', xbar, ',', ybar, ')'))
fx <- paste0('Ŷ = ',β0,' + ',β1,'*X')
text(locator(1), fx)
