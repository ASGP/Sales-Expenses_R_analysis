# Linear Regression Model for Sales & Expenses

### **A simple regression model is fit to get an idea about realtionship between Expenses and Sales of a certain company**


#### Independant variable - Expens
#### Dependant variable - Sales


### Boxplot for Expend and Sales

<img src="https://github.com/user-attachments/assets/157946be-953e-4397-8873-537c4a9b6321" alt="image" width="600" />



### Histogram for distribution of the vtwo variables

<img src="https://github.com/user-attachments/assets/fb7d2a48-54e4-4225-91de-289bc2015195" alt="image" width="600" />

### Sales vs Expend Regression Line

<img src="https://github.com/user-attachments/assets/e4754bcd-40c0-40a4-bf38-417883136429" alt="image" width="600" />

The pearson correlation calue is **0.9999481** _(+)_ which ~ 1 shows that the relationship is linear with dependant increases with independant increases 

### Coefficients

| **Coefficient**        | **Estimate** | **Std. Error** | **t-value** | **p-value**    |
|------------------------|--------------|----------------|-------------|-----------------|
| **(Intercept)**        | 19.67481     | 2.28922        | 8.595       | 8.7e-08 ***     |
| **Expenditures**       | 5.00220      | 0.01201        | 416.384     | < 2e-16 ***      |

### Model Performance

| **Performance Metric**           | **Value**         |
|----------------------------------|-------------------|
| Residual Standard Error          | 2.622 (on 18 DF)  |
| Multiple R-squared               | 0.97            |
| Adjusted R-squared               | 0.9699            |
| F-statistic                      | 1.734e+05 (on 1 and 18 DF) |
| p-value                          | < 2.2e-16        |

- The **high R-squared values** (0.9999) ~ 1 indicate that the model explains nearly sales based on expenditures.
- The **coefficients** suggest that for each unit increase in expenditures, sales are expected to increase by approximately 5 units.
- The **significant p-values** for both the intercept and expenditures indicate strong evidence against the null hypothesis, confirming that these variables are statistically significant.



adjusted r squared is 0.9998 ~ 1 better fit to the model (linear model of model1)

### Residuals vs Fitted

<img src="https://github.com/user-attachments/assets/6026f567-b685-49e0-97d7-8b7827b9b0b3" alt="image" width="600" />



### Q-Q Plot of residuals 

<img src="https://github.com/user-attachments/assets/28be589b-6bb9-4cb7-aa3d-503ca58fcf98" alt="image" width="600" />

Shapiro-Wilk test value is 0.93 ~ 1 can deerived that tthe data are normally ditributed 

