library(ggplot2)
library(dplyr)
library(viridis)


df <- tibble(x = c(1:6), y = c(1, 2, 5, 3, 4, 6), col = "1") %>% 
  bind_rows(tibble(x = c(1:6), y = c(6, 4, 3, 4, 1, 0), col = "2"))


ggplot(df, aes(x = x, y = y, col = col)) +
  geom_point(size = 14) +
  geom_line(size = 10, alpha = 0.7) +
  theme_minimal() +
  scale_y_continuous(breaks = NULL, minor_breaks = NULL) + 
  scale_x_continuous(breaks = NULL, minor_breaks = NULL) + 
  scale_color_manual(values = c("#ff471a", "#4191E4")) +
  theme(legend.position = "none", axis.text = NULL) +
  labs(x = "", y = "")

ggsave("static/img/logo.png", dpi = 330, width = 5, height = 5)
