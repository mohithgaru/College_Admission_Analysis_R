# --------------------------------------------------
# Project : College Admission
# Step 1: Install Packages, Load Data, Check NA, and Transform
# --------------------------------------------------

# Install all necessary packages for the *entire* project
install.packages(c("dplyr", "ggplot2", "caTools", "rpart", "rpart.plot", "e1071"))

# Load libraries
library(dplyr)
library(ggplot2)
library(caTools)
library(rpart)
library(rpart.plot)
library(e1071)

# Load the dataset
file_path <- "/content/College_admission.csv"
df <- read.csv(file_path)
cat("--- Data loaded successfully ---\n\n")


# Predictive Task 1: Find Missing Values (and treat)
# --------------------------------------------------
cat("--- Task 1: Missing Value Check ---\n")
missing_count <- sum(is.na(df))
cat(paste("Total number of missing values (NA):", missing_count, "\n"))

# Treat missing values by removing the rows
df_cleaned <- na.omit(df)
cat(paste("Total rows in original data:", nrow(df), "\n"))
cat(paste("Total rows after NA removal:", nrow(df_cleaned), "\n\n"))


# Predictive Task 3: Find Structure of Data and Transform
# --------------------------------------------------
cat("--- Task 3: Data Structure Transformation ---\n")
cat("Original data structure:\n")
str(df) # Show original structure

# Transform numeric data types to factors (categorical)
# This is crucial for our regression and classification models
df_cleaned$admit <- as.factor(df_cleaned$admit)
df_cleaned$ses <- as.factor(df_cleaned$ses)
df_cleaned$Gender_Male <- as.factor(df_cleaned$Gender_Male)
df_cleaned$Race <- as.factor(df_cleaned$Race)
df_cleaned$rank <- as.factor(df_cleaned$rank)

cat("\n--- Transformed data structure (df_cleaned) ---\n")
str(df_cleaned)

-----------------------------------------------------------------------------------------------------------------------------------
# --------------------------------------------------
# Step 2: Find and Treat Outliers
# --------------------------------------------------

# We will use the 'df_cleaned' data frame from Step 1

# --- 1. Find Outliers Visually (Boxplots) ---
cat("--- 2.1: Creating Boxplots to Find Outliers ---\n")

# Save boxplot for 'gre'
png("gre_boxplot_before.png")
boxplot(df_cleaned$gre, main="Boxplot for GRE Scores (Before Treatment)", ylab="GRE Score")
dev.off() # Closes the PNG device

# Save boxplot for 'gpa'
png("gpa_boxplot_before.png")
boxplot(df_cleaned$gpa, main="Boxplot for GPA (Before Treatment)", ylab="GPA")
dev.off()

cat("Plots 'gre_boxplot_before.png' and 'gpa_boxplot_before.png' saved.\n")
cat("Check the file explorer to download and view them.\n\n")

# --- 2. Identify Outliers Programmatically ---
cat("--- 2.2: Identifying Outlier Values ---\n")
gre_outliers <- boxplot.stats(df_cleaned$gre)$out
cat("GRE Outliers:\n")
print(gre_outliers)

gpa_outliers <- boxplot.stats(df_cleaned$gpa)$out
cat("\nGPA Outliers:\n")
print(gpa_outliers)
cat("\n")


# --- 3. Treat Outliers (Capping) ---
# We will cap the outliers by replacing them with the 5th and 95th percentile values.
cat("--- 2.3: Treating Outliers by Capping ---\n")

# Capping for 'gre'
gre_quantiles <- quantile(df_cleaned$gre, probs=c(0.05, 0.95))
gre_low_cap <- gre_quantiles[1]  # 5th percentile
gre_high_cap <- gre_quantiles[2] # 95th percentile

df_cleaned$gre <- ifelse(df_cleaned$gre < gre_low_cap, gre_low_cap, df_cleaned$gre)
df_cleaned$gre <- ifelse(df_cleaned$gre > gre_high_cap, gre_high_cap, df_cleaned$gre)

# Capping for 'gpa'
gpa_quantiles <- quantile(df_cleaned$gpa, probs=c(0.05, 0.95))
gpa_low_cap <- gpa_quantiles[1]  # 5th percentile
gpa_high_cap <- gpa_quantiles[2] # 95th percentile

df_cleaned$gpa <- ifelse(df_cleaned$gpa < gpa_low_cap, gpa_low_cap, df_cleaned$gpa)
df_cleaned$gpa <- ifelse(df_cleaned$gpa > gpa_high_cap, gpa_high_cap, df_cleaned$gpa)

cat("Outliers in 'gre' and 'gpa' have been capped.\n\n")


# --- 4. Verify Treatment (New Boxplots) ---
cat("--- 2.4: Creating Boxplots After Treatment ---\n")

# Save boxplot for 'gre' AFTER
png("gre_boxplot_after.png")
boxplot(df_cleaned$gre, main="Boxplot for GRE Scores (After Treatment)", ylab="GRE Score")
dev.off() # Closes the PNG device

# Save boxplot for 'gpa' AFTER
png("gpa_boxplot_after.png")
boxplot(df_cleaned$gpa, main="Boxplot for GPA (After Treatment)", ylab="GPA")
dev.off()

cat("Plots 'gre_boxplot_after.png' and 'gpa_boxplot_after.png' saved.\n")
cat("View them to see the 'before' and 'after' effect.\n")