library(tidyverse)

msleep%>% 
  filter(vore %in% c("herbi", "omni", "carni")) %>%
  select(name, vore, awake, brainwt, bodywt) %>%
  mutate(vore = as.factor(vore)) %>%
  drop_na() -> msleep_subvore


# Make ALL THE PLOTS HERE
theme_set(theme_classic())
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
  scale_fill_viridis_d(option = "inferno") +
  theme(legend.position = "none") -> box_fill_cb

colorblindr::cvd_grid(box_fill_cb) -> box_fill_cb_cvd_grid
ggsave("box_fill_cb_cvd_grid.png", box_fill_cb_cvd_grid, width = 8, height = 6)


msleep_subvore %>%
  ggplot(aes(x = vore, y = awake)) + 
  geom_boxplot(fill = "cadetblue") -> box_single_fill

msleep_subvore %>%
  ggplot(aes(x = vore, y = awake, fill = vore)) + 
  geom_boxplot(color = "yellow", size=3) + 
  theme(legend.position = "none")-> box_color_yellow_ugly

msleep_subvore %>%
  ggplot(aes(x = awake)) + 
  geom_density(alpha = 0.6, fill = "orchid4") + 
  theme(legend.position = "top")  -> density_all



msleep_subvore %>%
  ggplot(aes(x = awake, fill = vore)) + 
  geom_density(alpha = 0.6) + 
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
  geom_histogram(color="grey30", fill = "cadetblue", bins = 5) + 
  facet_grid(~vore) + theme(legend.position = "none")-> hist_all_facet


msleep_subvore %>%
  ggplot(aes(x = awake, fill = vore)) + 
  scale_fill_brewer(palette = "Dark2") +
  geom_histogram(color="grey30", bins = 5) + 
  facet_grid(~vore) + theme(legend.position = "none")-> hist_fill_facet

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
  ggplot(aes(x = bodywt, y = brainwt, color = vore)) + geom_point(size = 4) + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight")+ theme(legend.position="right") -> scatter_color_discrete

msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt, color = awake)) + geom_point(size = 4) + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight") + theme(legend.position="right") -> scatter_color_cont

msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt, shape = vore)) + geom_point(color = "hotpink", size = 4) + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight") + theme(legend.position="right") -> scatter_single_color_shape_vore ## TOO MUCH

msleep_subvore %>%
  filter(bodywt <= 5) %>%
  ggplot(aes(x = bodywt, y = brainwt, shape = vore, color = awake)) + geom_point(size = 4) + 
  xlab("Body weight (kg)") + ylab("Brain weight (kg)") + ggtitle("Mammal brain vs. body weight") + theme(legend.position="right") -> scatter_crazytown ## TOO MUCH