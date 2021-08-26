ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() + 
  geom_segment(aes(
    x = 5, 
    xend = 7, 
    y = 2, 
    yend = 4
  ))


ggplot(iris, aes(x = Species)) + 
  geom_bar() + 
  geom_segment(color = "palegreen", aes(
    x = "setosa", 
    xend = "versicolor", 
    y = 0, 
    yend = 50
  ))