health <- read.table('./reg2020/health.txt', header = T)
health <- health[, -1]
t(health)

cor(health)

h0.lm <- lm(Y ~ X1, data = health)
h1.lm <- lm(Y ~ X4, data = health)
h2.lm <- lm(Y ~ X4 + X1, data = health)
h3.lm <- lm(Y ~ X4 + X1 + X2, data = health)
h4.lm <- lm(Y ~ X4 + X1 + X2 + X3, data = health)

anova1 <- anova(h0.lm, h2.lm)
anova1
anova1$RSS[1] - anova1$RSS[2]

anova2 <- anova(h2.lm, h3.lm)
anova2
anova2$RSS[1] - anova2$RSS[2]

anova3 <- anova(h3.lm, h4.lm)
anova3
anova3$RSS[1] - anova3$RSS[2]

anova0 <- anova(h1.lm, h2.lm)
anova0
anova0$RSS[1] - anova0$RSS[2]

library(car)
avPlots(h2.lm)

health.lm.anova <- anova(h2.lm)
health.lm.anova

par(mfrow = c(1, 2))
plot(health$X1, as.vector(h2.lm$residuals))
plot(health$X4, as.vector(h2.lm$residuals))