forbes <- read.table('./reg2020/forbes.txt', header = T)
t(forbes)

forbes$Lpress <- 100 * log10(forbes$press)

plot(forbes$Lpress, forbes$temp, pch = 19)

forbes.lm <- lm(forbes$Lpress ~ forbes$temp)
forbes.lm.summary <- summary(forbes.lm)
forbes.lm.summary

cbind(forbes, forbes.lm$residuals, forbes.lm$fitted.values)

plot(forbes$temp, forbes.lm$residuals, pch = 19)
abline(h = 0, lty = 2)

p.x <- data.frame(temp = forbes$temp)
pc <- predict(forbes.lm, int = 'c', newdata = p.x)
pred.x <- p.x$temp
plot(forbes$temp, forbes$Lpress, ylim = range(forbes$Lpress, pc))
matlines(pred.x, pc, lty = c(1, 2, 2), col = 'YELLOW')