library(tidyverse)

# What is the median of diamond prices across cut categories?
ggplot(diamonds) + 
  aes(x = cut, y = price, fill = cut) + 
  geom_boxplot(outlier.size = 0.3, alpha = 0.6)


ggplot(diamonds) + 
  aes(x = cut, y = price, fill = cut) + 
  geom_violin(alpha = 0.6) + 
  stat_summary()

diamonds %>%
  group_by(cut) %>%
  summarize(mean_cut = mean(price, na.rm=FALSE)) %>%
  arrange(mean_cut)



ggplot(diamonds) +
  aes(x = price) + 
  geom_density(alpha = 0.6, 
                 fill = "darkred", 
                 color = "black") +
  scale_x_continuous(breaks = seq(1, 20000,1000))


ggplot(diamonds) + 
  aes(x = carat, 
      y = price,
      color = cut) + 
  geom_text(label = "x")




ggplot(diamonds) + 
  aes(x = cut) + 
  geom_bar()




# What is roughly the range of the data?
# What is the most common price of diamonds in the data?


# range?
# modality?
# shape?
# counts?
# relationships?
# values of a numeric across categories?