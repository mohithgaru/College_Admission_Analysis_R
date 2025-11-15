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