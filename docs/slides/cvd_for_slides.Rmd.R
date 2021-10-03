
---
  
  # Want manual fills (colors)?
  
  
  ```{r, echo = T}
ggplot(msleep_subvore) + 
  aes(x = vore, y = awake, fill = vore) + 
  geom_violin() + 
  scale_fill_manual(values = c("cornflowerblue", #<<
                               "coral3",          #<<
                               "blueviolet"))        #<<
```

---
  
  # Want even MORE?
  
  > Hint: You absolutely do, especially since it's required for HW5.

#### `introverse` resources for styling your plots

+ [Customizing `ggplot2` axes](https://spielmanlab.github.io/introverse/articles/axes.html)
+ [Customizing `ggplot2` themes](https://spielmanlab.github.io/introverse/articles/themes.html)
+ [Customizing `ggplot2` colors and fills](https://spielmanlab.github.io/introverse/articles/color_fill_scales.html)



---
# How to check CVD friendliness

```{r include=FALSE, echo=TRUE}
library(colorblindr) # installed for you in our RStudio Cloud Workspace!!

# Save plot to variable:
my_plot <- ggplot(msleep_subvore) + 
  aes(x = vore, y = awake, fill = vore) + 
  geom_violin() + 
  scale_fill_manual(name = "Legend name",  #<<
                    values = c("cornflowerblue", #<<
                               "coral3",          #<<
                               "blueviolet"))        #<<

# Run it through `cvd_grid()`
cvd_grid(my_plot)
```

---


```{r, fig.width = 14, fig.height =9, echo = F}
cvd_grid(my_plot)
```



---
