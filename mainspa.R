D <- read.csv("C:/Users/LOQ/OneDrive/Desktop/sanyamr/student_pe_performance.csv")
set.seed(1)
summary(D)
#--------------------------
top_student <- subset(D, Overall_PE_Performance_Score == max(D$Overall_PE_Performance_Score))
print(top_student[, c("ID","Age","Gender","Grade_Level","Overall_PE_Performance_Score","Performance")])

high_count <- nrow(subset(D, Performance == "High Performer"))
cat("Total High Performers:", high_count, "\n")

sample_rows <- D[sample(1:nrow(D), 10), ]
print(sample_rows)
mean(D$Overall_PE_Performance_Score)
mean(sample_rows$Overall_PE_Performance_Score)
#---------------------------
dev.off()
avg_scores <- aggregate(Overall_PE_Performance_Score ~ Grade_Level, D, mean)
counts <- table(D$Grade_Level)
x_pos <- 1:nrow(avg_scores)
symbols(x = x_pos,
        y = avg_scores$Overall_PE_Performance_Score,
        circles = as.numeric(counts),   # bubble sizes
        inches = 0.2,
        fg = "blue", bg = "skyblue",
        xlab = "Grade Level", 
        ylab = "Average Performance Score",
        main = "Bubble Chart of Average Performance by Grade")
text(x = x_pos, 
     y = avg_scores$Overall_PE_Performance_Score,
     labels = avg_scores$Grade_Level, pos = 3)
#-------------------------------------------------------------------
#(motivation = high then pob. of high performence)
D$Motivation_Level <- as.character(D$Motivation_Level)
D$Performance <- as.character(D$Performance)

print(unique(D$Motivation_Level))
print(unique(D$Performance))

A <- D$Performance == "High Performer"
B <- D$Motivation_Level == "High"

if(sum(B) > 0) {
  P_A_given_B <- sum(A & B) / sum(B)
  cat("P(High Performer | High Motivation) =", P_A_given_B, "\n")
} else {
  cat("No students with High Motivation found.\n")
}

#-------------------------------------
if("Performance" %in% names(D)) {
  D$Performance <- trimws(as.character(D$Performance))
}
if("Class_Participation_Level" %in% names(D)) {
  D$Class_Participation_Level <- trimws(as.character(D$Class_Participation_Level))
}

D_low <- D$Performance == "Low Performer"
E_low <- D$Class_Participation_Level == "Low"


P_D <- sum(D_low) / nrow(D)
P_E <- sum(E_low) / nrow(D)

if(sum(E_low) > 0 && P_D > 0) {
  P_D_given_E <- sum(D_low & E_low) / sum(E_low)
  P_E_given_D <- (P_D_given_E * P_E) / P_D
  cat("P(Low Participation | Low Performer) =", P_E_given_D, "\n")
} else {
  cat("No students found in one of the categories (Low Performer or Low Participation).\n")
}

#------------------------

p_hat <- 0.64
n<- 100
SE <- sqrt(p_hat * (1 - p_hat) / n) 
z <- 1.96   
ME <- z * SE
lower1 <- p_hat - ME
upper1 <- p_hat + ME
print(lower1)
print(upper1)

#-------------------------------

D <- read.csv("C:/Users/LOQ/OneDrive/Desktop/sanyamr/student_pe_performance.csv", stringsAsFactors = FALSE)

D$Performance <- trimws(as.character(D$Performance))
D$Motivation_Level <- trimws(as.character(D$Motivation_Level))

high_yes <- sum(D$Performance == "High Performer" & D$Motivation_Level == "High", na.rm = TRUE)
high_total <- sum(D$Motivation_Level == "High", na.rm = TRUE)

low_yes <- sum(D$Performance == "High Performer" & D$Motivation_Level == "Low", na.rm = TRUE)
low_total <- sum(D$Motivation_Level == "Low", na.rm = TRUE)


if(high_total > 0 && low_total > 0) {
  p1 <- high_yes / high_total
  p2 <- low_yes / low_total
  p_pool <- (high_yes + low_yes) / (high_total + low_total)
  SE <- sqrt(p_pool * (1 - p_pool) * (1/high_total + 1/low_total))
  Z <- (p1 - p2) / SE
  p_value <- 2 * (1 - pnorm(abs(Z)))
  
  cat("High Motivation proportion:", p1, "\n")
  cat("Low Motivation proportion:", p2, "\n")
  cat("Difference:", p1 - p2, "\n")
  cat("Z-stat:", Z, "p-value:", p_value, "\n")
} else {
  cat("One of the groups has zero students.\n")
}