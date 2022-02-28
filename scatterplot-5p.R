market <- read.csv('./b1/ads.txt', header = T)
market.lm <- lm(Y ~ X, data = market)
market
market.predict <- predict(market.lm, newdata = market)
error <- market$Y - market.predict
sum(error)