market <- read.csv('./ch2/ads.txt')
market.lm <- lm(Y ~ X, data = market)
data <- summary(market.lm)
data$coefficients[2,1]
plot(market$X, market$Y, xlab='Advertising Fee', ylab='Total Sales', pch=19)
title("Scatterplot of Advertising Fees and Sales ")
abline(market.lm)
identify(market$X, market$Y)