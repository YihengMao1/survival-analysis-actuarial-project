# Load packages
library(survival)
library(ggplot2)

# Load built-in dataset
lung <- survival::lung

# View dataset
summary(lung)

# Kaplan-Meier model
km_fit <- survfit(Surv(time, status) ~ sex, data = lung)

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

# Create survival curve
km_plot <- ggsurvplot(
  km_fit,
  data = lung,
  risk.table = TRUE,
  pval = TRUE,
  conf.int = TRUE
)

# Display plot
km_plot

# Save Kaplan-Meier plot
ggsave("km_curve.png", plot = km_plot$plot, width = 8, height = 6)

