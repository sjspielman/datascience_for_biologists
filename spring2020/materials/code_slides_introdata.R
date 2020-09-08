library(tidyverse)
library(ggforce)
library(patchwork)
library(cowplot)

d1 <- rnorm(100, 3, 2)
d2 <- rnorm(100, 3, 0.5)
d3 <- c( rnorm(50, 1, 0.5), rnorm(50, 5, 0.5))

theme_set(theme_classic() + theme(legend.position = "none"))
dat <- tibble(d1 = d1, d2 = d2, d3 = d3) %>% 
            pivot_longer(d1:d3, names_to = "dist", values_to = "value")
            
ggplot(dat, aes(x = value, fill = dist)) + 
    geom_histogram(bins = 10, color = "black") + 
    facet_wrap(~dist, scales="free_x") +
    scale_fill_brewer(palette = "Dark2") +
    panel_border()  -> p1
    
ggplot(dat, aes(x = value, fill = dist)) + 
    geom_histogram(bins = 30, color = "black") + 
    facet_wrap(~dist, scales="free_x") +
    scale_fill_brewer(palette = "Dark2") +
    panel_border() + theme(axis.text.x = element_text(size=9))  -> p1.5
    
ggplot(dat, aes(x = value, fill = dist)) + 
    geom_density(color = "black") + 
    facet_wrap(~dist, scales="free_x") +
    scale_fill_brewer(palette = "Dark2") +
    panel_border() + theme(axis.text.x = element_text(size=9)) -> p2
    

ggplot(dat, aes(x = value, fill = dist)) + 
    geom_density(color = "black", alpha=0.5) + 
    scale_fill_brewer(palette = "Dark2") +
    panel_border() + theme(axis.text.x = element_text(size=9)) -> p2.5
    
    
ggplot(dat, aes(y = value, x = dist, fill = dist)) + 
    geom_boxplot(color = "black") + 
    scale_fill_brewer(palette = "Dark2") +
    panel_border()  -> p3
    
    
ggplot(dat, aes(y = value, x = dist, fill = dist)) + 
    geom_violin(color = "black") + 
    scale_fill_brewer(palette = "Dark2") +
    panel_border()  -> p4
  
    
ggplot(dat, aes(y = value, x = dist, color = dist)) + 
    geom_jitter(width=0.1, size=0.5) + 
    scale_color_brewer(palette = "Dark2") +
    panel_border()  -> p5
    
    
ggplot(dat, aes(y = value, x = dist, color = dist)) + 
    geom_sina(size = 0.5) + 
    scale_color_brewer(palette = "Dark2") +
    panel_border()  -> p6

   
plot_grid(p1, p1.5, p2, p2.5, nrow=2) -> one
plot_grid(p3, p4, p5, p6, nrow=2) -> two

plot_grid(one, two, ncol=2) -> all
save_plot("dist_comparison.pdf", all, base_width = 16, base_height=6)

    
    
    
    