# --------------------------------------------------
# Project 2: College Admission
# Step 9: Descriptive Task 1 - GPA Analysis
# --------------------------------------------------

cat("--- Descriptive Task 1: GPA Analysis ---\n\n")

# We must re-load the data to use the *original* GPA values
# before they were normalized.
df_desc <- read.csv("College_admission.csv")
df_desc <- na.omit(df_desc)

# 'admit' is already 0/1, so mean(admit) will give us the probability
    
# 1. Categorize GPA
# Let's define the breaks: Low (<3.0), Medium (3.0-3.5), High (>3.5)
df_desc <- df_desc %>%
  mutate(gpa_category = case_when(
    gpa < 3.0 ~ "Low",
    gpa >= 3.0 & gpa < 3.5 ~ "Medium",
    gpa >= 3.5 ~ "High"
  ))

# Make sure the categories are in the right order for the plot
df_desc$gpa_category <- factor(df_desc$gpa_category, levels = c("Low", "Medium", "High"))

# 2. Calculate Admission Probability for each category
gpa_analysis <- df_desc %>%
  group_by(gpa_category) %>%
  summarise(
    AdmissionProbability = mean(admit),
    Count = n()
  ) %>%
  mutate(AdmissionPercentage = round(AdmissionProbability * 100, 2))
      
cat("--- GPA Categories and Admission Probability ---\n")
print(gpa_analysis)
    
# 3. Plot on a point chart
gpa_plot <- ggplot(gpa_analysis, aes(x = gpa_category, y = AdmissionProbability)) +
  geom_point(aes(color = gpa_category), size = 4) +
  geom_text(aes(label = paste0(AdmissionPercentage, "%")), vjust = -1.5) + # Add percentage label
  labs(
    title = "Admission Probability by GPA Category",
    x = "GPA Category",
    y = "Admission Probability (0.0 to 1.0)"
  ) +
  theme_minimal()
    
# Save the plot
ggsave("gpa_admission_probability_plot.png", plot = gpa_plot)
    
cat("\nPlot 'gpa_admission_probability_plot.png' has been saved.\n")