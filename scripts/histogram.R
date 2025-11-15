# --------------------------------------------------
# Step 3: Check Normal Distribution (Task 4)
# --------------------------------------------------

# We will use the 'df_cleaned' data frame from Step 2

cat("--- 4.1: Checking Normal Distribution for GRE --- \n")

# 1. Histogram for GRE
png("gre_histogram.png")
hist(df_cleaned$gre, main="Histogram for GRE Scores", xlab="GRE Score", col="skyblue")
dev.off() # Closes the PNG

# 2. Q-Q Plot for GRE
png("gre_qqplot.png")
qqnorm(df_cleaned$gre, main="Q-Q Plot for GRE Scores")
qqline(df_cleaned$gre, col="red", lwd=2) # Adds the reference line
dev.off()

cat("GRE plots 'gre_histogram.png' and 'gre_qqplot.png' saved.\n\n")


cat("--- 4.2: Checking Normal Distribution for GPA --- \n")

# 1. Histogram for GPA
png("gpa_histogram.png")
hist(df_cleaned$gpa, main="Histogram for GPA", xlab="GPA", col="lightgreen")
dev.off()

# 2. Q-Q Plot for GPA
png("gpa_qqplot.png")
qqnorm(df_cleaned$gpa, main="Q-Q Plot for GPA")
qqline(df_cleaned$gpa, col="red", lwd=2)
dev.off()

cat("GPA plots 'gpa_histogram.png' and 'gpa_qqplot.png' saved.\n\n")