# Load packages -----------------------------------------------------------
library(hexSticker)
library(ggplot2)
library(dplyr)
library(viridis)



# Generate dummy data -----------------------------------------------------


df <- tibble(x = c(1:6), y = c(1, 2, 5, 3, 4, 6), col = "1") %>% 
  bind_rows(tibble(x = c(1:6), y = c(6, 4, 3, 4, 1, 0), col = "2"))



# Plot data logo ----------------------------------------------------------


logo <- ggplot(df, aes(x = x, y = y, col = col)) +
  geom_point(size = 2.5) +
  geom_line(size = 2, alpha = 0.7) +
  theme_minimal() +
  scale_y_continuous(breaks = NULL, minor_breaks = NULL) + 
  scale_x_continuous(breaks = NULL, minor_breaks = NULL) + 
  scale_color_manual(values = c("#ff471a", "#4191E4")) +
  theme(legend.position = "none", axis.text = NULL, panel.background = element_blank()) +
  labs(x = "", y = "")


# Make sticker ------------------------------------------------------------

sticker(logo,
        package = "seabbs",
        p_size = 23,
        p_color = "#646770",
        s_x = 0.9,
        s_y= 0.9,
        s_width= 1.75,
        s_height= 1.4,
        h_fill = "#DCDCDC",
        h_color ="#646770",
        filename="./static/img/logo.png",
        url = "samabbott.co.uk",
        u_color = "#646770",
        u_size = 6)
