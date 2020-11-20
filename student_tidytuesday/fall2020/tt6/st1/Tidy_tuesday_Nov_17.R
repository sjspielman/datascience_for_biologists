library(tidyverse)
library(pROC)
tournament <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-10-06/tournament.csv')

tournament%>%
  mutate(outcome_01=if_else(tourney_finish=="Champ", 1, 0))->tournament_01


glm(outcome_01~ reg_w, data=tournament_01, family = "binomial")->model_1

#summary(model_1)

tournament_01%>%
  mutate(outcome_champ_or_no=if_else(tourney_finish=="Champ", "Champ", "Not Champ"))->tournament_01_champs


tibble(x=model_1$linear.predictors, y=model_1$fitted.values, Actual= tournament_01_champs$outcome_champ_or_no)->fit_tibble

#ggplot((fit_tibble), aes(x=x, y=y))+
  #geom_line()+
  #geom_point(aes(color=Actual), alpha=0.5)+
  #scale_color_brewer(palette = "Dark2")

roc(tournament_01$outcome_01, model_1$linear.predictors)->model_roc
model_roc$auc


tibble(TPR = model_roc$sensitivities,
       FPR = 1 - model_roc$specificities) %>%
  ggplot(aes(x = FPR, y = TPR)) +
  geom_line(color="darkgoldenrod", size=0.8)+
  theme_classic()+
  labs(title="ROC Curve For Regular Season Wins Predicting A Championship Win ", subtitle = "NCAA Women's Basketball Since 1982")+
  geom_abline(col = "black")+
  annotate("text", x=0.1, y=1.0, label="AUC=0.886")+
  theme(plot.title = element_text(face="bold"))-> ROC_figure.png

ggsave("ROC_figure.png", width=7, height=6)
