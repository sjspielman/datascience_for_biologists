library(tidyverse)
library(ggforce)
library(ggbeeswarm)


theme_set(theme_bw() + 
          theme(axis.text = element_text(size = rel(2)),
                axis.title = element_text(size = rel(2)),
                plot.title = element_text(size = rel(2)),
                strip.text = element_text(size = rel(1.5)),
                legend.text = element_text(size = rel(1.5)),
                legend.title = element_text(size = rel(1.5)))
          )
          
          
msleep%>% 
  filter(vore %in% c("herbi", "omni", "carni")) %>%
  select(name, vore, awake, brainwt, bodywt) %>%
  mutate(vore = as.factor(vore)) %>%
  drop_na() -> msleep_subvore

diamonds %>%
  ggplot(aes(x = cut, y = carat, color = cut)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_jitter(width = 0.2, size = 1) +
  theme(axis.text = element_text(size = rel(1.5)),
        legend.position = "none") -> stripd

diamonds %>%
  ggplot(aes(x = cut, y = carat, color = cut)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_point(size = 1)+
  theme(axis.text = element_text(size = rel(1.5)),
        legend.position = "none")  -> pointd

diamonds %>%
  ggplot(aes(x = cut, y = carat, color = cut)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_sina(size = 1) + ggtitle("Sina plot")+
  theme(axis.text = element_text(size = rel(1.5)),
        legend.position = "none")  -> sinad


diamonds %>%
  ggplot(aes(x = cut, y = carat, color = cut)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_quasirandom(size = 1) + ggtitle("Beeswarm plot") +
  theme(axis.text = element_text(size = rel(1.5)),
        legend.position = "none") -> beesd


diamonds %>%
  ggplot(aes(x = cut, y = carat, color = cut)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_jitter(size = 1, width = 0.2, alpha = 0.4) +
  theme(axis.text = element_text(size = rel(1.5)),
        legend.position = "none") -> stripda

diamonds %>%
  ggplot(aes(x = cut, y = carat, color = cut)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_point(size = 1, alpha = 0.4) +
  theme(axis.text = element_text(size = rel(1.5)),
        legend.position = "none") -> pointda

diamonds %>%
  ggplot(aes(x = cut, y = carat, color = cut)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_sina(size = 1, alpha = 0.4) + ggtitle("Sina plot") +
  theme(axis.text = element_text(size = rel(1.5)),
        legend.position = "none") -> sinada


diamonds %>%
  ggplot(aes(x = cut, y = carat, color = cut)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_quasirandom(size = 1, alpha = 0.4) + ggtitle("Beeswarm plot")+
  theme(axis.text = element_text(size = rel(1.5)),
        legend.position = "none")  -> beesda


diamonds %>%
  ggplot(aes(x = cut, y = carat, fill = cut)) + 
  scale_fill_brewer(palette = "Dark2") +
  geom_violin() +
  theme(axis.text = element_text(size = rel(1.5)),
        legend.position = "none")  -> violind






# Make ALL THE PLOTS HERE

msleep_subvore %>%
  ggplot(aes(x = vore, y = awake)) + 
  geom_boxplot()+
  theme(legend.position = "none") -> box_plain

msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, fill = vore)) + 
  geom_boxplot(size = 1)+
  theme(legend.position = "none") -> box_fill

colorblindr::cvd_grid(box_fill) -> box_fill_cvd_grid
ggsave("box_fill_cvd_grid.png", box_fill_cvd_grid, width = 8, height = 6)

msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, fill = vore)) + 
  geom_boxplot(size=1)+
  scale_fill_brewer(palette = "Dark2") +
  theme(legend.position = "none") -> box_fill_cb

colorblindr::cvd_grid(box_fill_cb) -> box_fill_cb_cvd_grid
ggsave("box_fill_cb_cvd_grid.png", box_fill_cb_cvd_grid, width = 8, height = 6)


msleep_subvore %>%
  ggplot(aes(x = vore, y = awake)) + 
  geom_boxplot(fill = "cadetblue") -> box_single_fill

msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, fill = vore)) + 
  scale_fill_brewer(palette = "Dark2") +
  geom_boxplot(color = "yellow", size=3) + 
  theme(legend.position = "none")-> box_color_yellow_ugly

msleep_subvore %>%
  ggplot(aes(x = awake)) + 
  geom_density(alpha = 0.5, fill = "cadetblue") + 
  theme(legend.position = "top")  -> density_all
  
  
  
msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, fill = vore)) + 
    scale_fill_brewer(palette = "Dark2") +
  geom_violin() -> violin
  
msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, color = vore)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_jitter(width = 0.2, size = 4) + theme(axis.text = element_text(size = rel(1.5)),
                                           legend.position = "none")-> strip

msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, color = vore)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_sina(size = 4) + ggtitle("Sina plot") +theme(axis.text = element_text(size = rel(1.5)),
                                                    legend.position = "none")-> sina


msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, color = vore)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_quasirandom(size = 4) + ggtitle("Beeswarm plot") +theme(axis.text = element_text(size = rel(1.5)),
                                                               legend.position = "none")-> bees

  
msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, color = vore)) + 
  scale_color_brewer(palette = "Dark2") +
  geom_point(size = 4) +theme(axis.text = element_text(size = rel(1.5)),
                              legend.position = "none")-> strip_points


msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, fill = vore)) + 
  scale_fill_brewer(palette = "Dark2") +
  geom_jitter(width = 0.2, size = 4, pch=21) +theme(axis.text = element_text(size = rel(1.5)),
                                                    legend.position = "none")-> strip_filled
  
  
msleep_subvore %>%
  ggplot(aes(x = awake, fill = vore)) + 
  geom_density(alpha = 0.5) + 
  facet_wrap(~vore)+
  scale_fill_brewer(palette = "Dark2") +
  theme(legend.position = "bottom")  -> density_facet



msleep_subvore %>%
  ggplot(aes(x = awake, fill = vore)) + 
  geom_density(alpha = 0.5) + 
  scale_fill_brewer(palette = "Dark2") +
  theme(legend.position = "bottom")  -> density_fill


msleep_subvore %>%
  ggplot(aes(x = awake, fill = vore)) + 
  geom_density() + 
  scale_fill_brewer(palette = "Dark2") +
  theme(legend.position = "bottom")  -> density_fill_noalpha

msleep_subvore %>%
  ggplot(aes(x = awake)) + 
  geom_histogram(color="grey30", fill = "cadetblue", binwidth=2) + 
  theme(legend.position = "none")-> hist_all
  
  
msleep_subvore %>%
  ggplot(aes(x = awake)) + 
  geom_histogram(color="grey30", fill = "cadetblue", binwidth=1) + 
  theme(legend.position = "none")-> hist_smaller
  
msleep_subvore %>%
  ggplot(aes(x = awake)) + 
  geom_histogram(color="grey30", fill = "cadetblue", binwidth=5) + 
  theme(legend.position = "none")-> hist_bigger
  
msleep_subvore %>%
  ggplot(aes(x = awake)) + 
  geom_histogram(color="grey30", fill = "cadetblue", binwidth=0.1) + 
  theme(legend.position = "none")-> hist_dumb1
  
msleep_subvore %>%
  ggplot(aes(x = awake)) + 
  geom_histogram(color="grey30", fill = "cadetblue", binwidth=20) + 
  theme(legend.position = "none")-> hist_dumb2

msleep_subvore %>%
  ggplot(aes(x = awake)) + 
  geom_histogram(color="grey30", fill = "cadetblue", bins = 5) + 
  facet_grid(~vore) + theme(legend.position = "none", axis.text = element_text(size = rel(1.3)))-> hist_all_facet


msleep_subvore %>%
  ggplot(aes(x = awake, fill = vore)) + 
  scale_fill_brewer(palette = "Dark2") +
  geom_histogram(color="grey30", bins = 5) + 
  facet_grid(~vore) + theme(legend.position = "none", axis.text = element_text(size = rel(1.3)))-> hist_fill_facet

msleep_subvore %>%
  ggplot(aes(x = awake, fill = vore)) + 
  scale_fill_brewer(palette = "Dark2") +
  geom_histogram(color="grey30", bins = 5) -> hist_fill_onepanel

msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt)) + 
  geom_point() +
  xlab("Body weight (kg)") + 
  ylab("Brain weight (kg)") + 
  ggtitle("Mammal brain vs. body weight") -> scatter_plain

msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt)) + 
  geom_point(size = 4) +
  xlab("Body weight (kg)") + 
  ylab("Brain weight (kg)") + 
  ggtitle("Mammal brain vs. body weight") -> scatter_bigpoint


msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt)) + 
  geom_point(shape = 17, size=4) + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight")+ theme(legend.position="right") ->scatter_bigpoint_pch17
  
msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt)) + 
  geom_point(shape = 21, size=4, fill = "aquamarine", color = "black") + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight")+ theme(legend.position="right") ->scatter_bigpoint_pch21

msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt, color = vore)) + geom_point(size = 4) + 
  scale_color_brewer(palette  = "Dark2") + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight")+ theme(legend.position="right") -> scatter_color_discrete


msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt, color = awake)) + geom_point(size = 4) + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight") + theme(legend.position="right") -> scatter_color_cont

msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt, shape = vore)) + geom_point(color = "orchid4", size = 4) + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight") + theme(legend.position="right") -> scatter_single_color_shape_vore ## TOO MUCH

msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt, shape = vore, color = awake)) + geom_point(size = 4) + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight") + theme(legend.position="right") -> scatter_crazytown ## TOO MUCH