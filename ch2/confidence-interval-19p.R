market <- read.csv('./ch2/ads.txt')
market.lm <- lm(Y ~ X, data = market)
data <- summary(market.lm)
data$coefficients[2,1]