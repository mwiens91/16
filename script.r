#!/usr/bin/env Rscript

library(ggplot2)
library(reshape2)

# Personality test data
results <- data.frame(
  rbind(
    c(0,0,0,0),
    c(0,0,0,0),
    c(0,0,1,1),
    c(0,1,0,0),
    c(0,1,1,0),
    c(0,1,1,0),
    c(0,1,1,1),
    c(0,1,1,1),
    c(1,0,0,0),
    c(1,1,0,0),
    c(1,1,0,1),
    c(1,1,1,0),
    c(1,1,1,0),
    c(1,1,1,0),
    c(1,1,1,0),
    c(1,1,1,1),
    c(1,1,1,1),
    c(1,1,1,1),
    c(1,1,1,1),
    c(1,1,1,1),
    c(1,1,1,1)
  )
)
colnames(results) <- c("Q1", "Q2", "Q3", "Q4")

percent_answered <- data.frame(
  question=c(1,2,3,4),
  percent_yes=colSums(results) / nrow(results)
)

# Plot the percentage of yeses per question
p <- (
  ggplot(data=percent_answered, aes(x=question, y=percent_yes))
  + geom_bar(stat="identity")
  + ylim(0, 1)
)
x11()
print(p)

# Plot a heatmap of correlation values
correlation_matrix = cor(results)
melted_correlation_matrix = melt(correlation_matrix)

p <- (
  ggplot(
    data=melted_correlation_matrix,
    aes(x=Var1, y=Var2, fill=value)
  ) +
  geom_tile()
)
x11()
print(p)

# Wait for user to kill script
Sys.sleep(999999999999)
