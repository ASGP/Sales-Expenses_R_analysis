install.packages("tidyr")
install.packages("ggplot2")
install.packages("GGally")
install.packages("broom")


library(tidyr)
library(ggplot2)
library(GGally) 
library(broom)

#create a dataframe
data <- data.frame( 
  Expend = c(100, 115, 120, 132, 144, 154, 158, 160, 170, 180, 181, 190, 200, 210, 220, 230, 240, 250, 260, 270), 
  Sales = c(522.3, 596.2, 617.7, 682.3, 740.2, 792.5, 806.4, 813.5, 871.0, 920.6, 927.9, 968.5, 1021.6, 1068.2, 1118.9, 1171.2, 1217.3, 1272.1, 1323.6, 1369.6))
summary(data)

data_long <- pivot_longer(data, cols = c(Expend, Sales),
                          names_to = "variable",
                          values_to = "value")
data_long$variable <- factor(data_long$variable,
                             levels = c("Expend", "Sales"),
                             labels = c("Marketing Expend (USD)", "Number of Sales"))

#box plot for distribution
ggplot(data_long, aes(y = value)) + geom_boxplot(aes(fill = variable), color = "black")+
  scale_fill_manual(values = c("lightblue", "lightgreen")) +
  facet_wrap(~ variable, scales = "free") +
  ggtitle("distribution of Marketing Expend and Sales") +
  ylab("values")

#histogram
ggplot(data_long, aes(x = value, fill = variable)) + 
  geom_histogram() +
  facet_wrap(~ variable, scales = "free") +
  ggtitle("Distribution of Marketing Expend and Sales") +
  xlab("values") +
  ylab("frequency")

ggplot(data, aes(x = Expend)) + 
  geom_density() +
  ggtitle("Distribution of Marketing Expend") +
  xlab("values") +
  ylab("Density") + scale_x_continuous(limits = c(0,500))

ggplot(data, aes(x = Expend, y = Sales)) +
  geom_point(color = 'blue') +                   
  geom_smooth(method = "lm", col = 'red') +      
  labs(title = "Sales vs Expend with Regression Line",
       x = "Expend",
       y = "Sales")

#pearson correlation 
cor(data$Expend, data$Sales)
#0.9999481 - positive and ~ 1 linear relationship one increase other increase also
   
ggpairs(data)

#linear regression model 
model1 <- lm( Sales ~ Expend, data = data)

summary(model1)

model1 %>% tidy(conf.int = TRUE)
tidy_model1 <- model1 %>% tidy(conf.int = TRUE)
ggplot(tidy_model1, aes(x = estimate, y = term, color = term)) +
  geom_point() + 
  geom_errorbarh(aes(xmin = conf.low, xmax = conf.high))+
  ggtitle("Coefficient plot")

ggplot(data = data, aes(x = Expend, y = Sales))+
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se=FALSE,
              col="forestgreen", lwd=2)


glance(model1)

glance(model1)$adj.r.squared #0.9998 better fit to the model
#df for fitted and residuals
model1_fitres <- augment(model1)

ggplot(model1_fitres, aes(x = .fitted, y = .resid)) +                           
  geom_point(color = "blue", alpha = 0.6) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red")+
  ggtitle("Residuals VS Fitted") + 
  xlab("Fitted values") + ylab("Residuals") +
  theme_minimal()

ggplot(model1_fitres, aes(x = .resid)) +                                           
  geom_histogram(color = "white")+
  ggtitle("Distribution of Residuals") + 
  xlab("reiduals") + theme_minimal()

ggplot(model1_fitres, aes(sample=.resid)) +
  stat_qq() + stat_qq_line() +
  labs( x = "Theoretical quantiles", y = "Sample quantiles") + 
  ggtitle("Q-Q plot of Residuals") + theme_minimal()

shapiro.test(model1_fitres$.resid)
# w = 0.93 ~ 1 can say normally distributed data










