<!-- =========================
     ✨ SHOW-STOPPER HERO HEADER — R PROJECT ✨
     Paste this AT THE TOP of your README.md (no links, no images)
     A compact, high-impact visual that grabs attention instantly
========================= -->

<div align="center">

# 🎯 **College Admission Analysis** — *in R*
### *Predict • Explain • Recommend*

<p>
<span style="font-size:14px">━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</span>
</p>

<pre style="line-height:0.8; font-family: monospace;">
██████╗  ██████╗  ██╗     ██╗   ██╗ ██████╗  ██████╗ ███████╗██████╗ 
██╔══██╗██╔═══██╗ ██║     ██║   ██║██╔═══██╗██╔═══██╗██╔════╝██╔══██╗
██████╔╝██║   ██║ ██║     ██║   ██║██║   ██║██║   ██║█████╗  ██████╔╝
██╔═══╝ ██║   ██║ ██║     ██║   ██║██║   ██║██║   ██║██╔══╝  ██╔══██╗
██║     ╚██████╔╝ ███████╗╚██████╔╝╚██████╔╝╚██████╔╝███████╗██║  ██║
╚═╝      ╚═════╝  ╚══════╝ ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝
</pre>

<p>
**One-line mission:** <em>“Turn historical admissions data into clear decisions — models you trust, stories you act on.”</em>
</p>

<p>
🔎  **Focus:** Feature engineering · Model explainability · Robust validation  
⚙️  **Tech:** R • ggplot2 • caret • rpart  
📊  **Deliverables:** Clean dataset • 3 predictive models • 10+ publication-ready plots
</p>

<p>
<span style="font-size:14px">━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━</span>
</p>

</div>

> **"Unlocking the factors that drive college admissions — data, models, and decisions."**

**Quick snapshot:**  
- 🔍 Exploratory & descriptive analysis  
- 🧠 Predictive models: Logistic Regression, Decision Tree, SVM  
- ✅ Validation & model selection with clear metrics  
- 📊 10+ publication-ready visualizations (see `images/`)  

---

<!-- Compact project card -->
<table>
  <tr>
    <td align="center"><strong>📥 Dataset</strong><br/><a href="ADD_LINK_HERE">admissions.csv</a></td>
    <td align="center"><strong>🧾 Report</strong><br/><a href="ADD_LINK_HERE">Final Report (PDF)</a></td>
    <td align="center"><strong>🧰 Scripts</strong><br/><a href="ADD_LINK_HERE">/scripts (R)</a></td>
    <td align="center"><strong>📈 Visuals</strong><br/><a href="ADD_LINK_HERE">/images</a></td>
  </tr>
</table>

---

</div>

<!-- End hero header -->


## 🏛️ Background and Objective
Every year, thousands of applications are submitted by international students for admission to colleges in the USA. It becomes an iterative task for the Education Department to know the total number of applications received and then compare that data with the total number of applications successfully accepted and visas processed.

**The objective of this exercise is to analyze the historical data and determine the key drivers for admission.**

## 📊 Dataset Description
The analysis is based on the following dataset, which includes academic, demographic, and institutional factors.

| Attribute | Description |
| :--- | :--- |
| **GRE** | Graduate Record Exam Scores |
| **GPA** | Grade Point Average |
| **Rank** | Prestige of the undergraduate institution (1=Highest, 4=Lowest) |
| **Admit** | **Response Variable:** 1 = Admitted, 0 = Not Admitted |
| **SES** | Socioeconomic Status (1=Low, 2=Medium, 3=High) |
| **Gender_male** | 0 = Female, 1 = Male |
| **Race** | 1, 2, or 3 (representing Hispanic, Asian, and African-American) |

---

## 📈 Analysis Tasks & Methodology
The project is divided into predictive modeling and descriptive analysis.

### 1. Predictive Analysis
* **Data Cleaning:** Identified and treated missing values and outliers.
* **Data Transformation:** Converted data types, checked for normal distribution (using Q-Q plots), and applied normalization.
* **Feature Selection:** Used variable reduction techniques to identify significant predictors.
* **Modeling:**
    1.  **Logistic Regression:** Built a model to determine the core factors influencing admission.
    2.  **Decision Tree:** Built a tree-based model for interpretability.
    3.  **Support Vector Machine (SVM):** Built an SVM model.
* **Validation:** Calculated model accuracy, ran validation techniques, and selected the champion model.

### 2. Descriptive Analysis
* Categorized the average of grade point into High, Medium, and Low with admission probability percentages.
* Created a cross-grid for admission variables with GRE categorization:
    * **Low:** 0-440
    * **Medium:** 440-580
    * **High:** 580+

---

## 🖼️ Key Visualizations
Below are a few key plots from the analysis. All plots generated by the scripts are available in the `images/` folder.

**[➡️ Click here to see all 10 images](images/)**

| Decision Tree Model | GPA Admission Probability |
| :---: | :---: |
| ![Decision Tree Plot](images/decision_tree_plot.png) | ![GPA Probability Plot](images/gpa_admission_probability_plot.png) |

| Outlier Treatment (Example: GRE) | Data Distribution (Example: GPA) |
| :---: | :---: |
| ![GRE Boxplot Before](images/gre_boxplot_before.png) | ![GPA Histogram](images/gpa_histogram.png) |

---

## 📁 Repository Structure & File Links
* **[`data/`](data/):** Contains the raw data used for this analysis.
* **[`reports/`](reports/):** Contains the final project reports in PDF and DOCX format.
    * [`reports/College_Admission_Analysis_Report.pdf`](reports/College_Admission_Analysis_Report.pdf)
* **[`images/`](images/):** Contains all 10 plots and visualizations generated by the R scripts.
* **[`scripts/`](scripts/):** Contains all the R scripts for the analysis.
    * **[`scripts/00_run_all_analysis.R`](scripts/00_run_all_analysis.R):** A master script to run the entire analysis.
    * **[`scripts/01_plot_decision_tree.R`](scripts/01_plot_decision_tree.R):** Code to generate the decision tree plot.
    * **[`scripts/02_plot_gpa_prob.R`](scripts/02_plot_gpa_prob.R):** Code for the GPA probability plot.
    * *...and 8 other scripts for each specific plot.*

---

## 🚀 How to Run This Project
1.  Clone this repository to your local machine:
    ```bash
    git clone [https://github.com/mohithgaru/College_Admission_Analysis_R.git](https://github.com/mohithgaru/College_Admission_Analysis_R.git)
    ```
2.  Open the project in RStudio by double-clicking the `College_Admission_Analysis.Rproj` file.
3.  Install the required packages. You can do this by running:
    ```r
    install.packages(c("ggplot2", "dplyr", "rpart", "rpart.plot", "e1071", "caret"))
    ```
4.  Run the master script to perform the full analysis and generate all plots:
    ```r
    source("scripts/00_run_all_analysis.R")
    ```
5.  Alternatively, run each script in the `scripts/` folder in numerical order.


