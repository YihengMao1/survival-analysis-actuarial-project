# Load packages
library(survival)

# Load dataset
data(lung)

# View dataset
summary(lung)

# Kaplan-Meier model
km_fit <- survfit(Surv(time, status) ~ 1, data = lung)

# Print result
summary(km_fit)

# Cox proportional hazards model
cox_model <- coxph(Surv(time, status) ~ age + sex, data = lung)

# Model summary
summary(cox_model)

# Install package if needed
install.packages("survminer")

# Load package
library(survminer)

# Plot Kaplan-Meier curve
km_plot <- ggsurvplot(
  km_fit,
  data = lung,
  risk.table = TRUE,
  pval = TRUE,
  conf.int = TRUE
)

# Save plot
ggsave("km_curve.png", plot = km_plot$plot)
