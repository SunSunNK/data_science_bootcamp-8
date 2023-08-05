# My first R Program

print("hello world")
print("SunSun is FPL King.")

library(dplyr)
mtcars %>%
  select(1:5) %>%
  filter(mpg > 30)
