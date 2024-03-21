library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)
library(here)

here::i_am("analyses_R_scripts/experimental_warming.R")

warming_data <- read.csv(here("data", "experimental_warming.csv"))

warming_plot <- ggplot(data = warming_data, aes(x = Time, y = effective_quantum_yield, group = Condition, color = Condition, shape = significant_point_05)) +
  geom_line() +
  geom_point() +
  facet_grid(vars(Season), vars(Species)) +
  scale_color_manual(values=c("#1D02CF", "#CB0E26")) +
  scale_shape_manual(values = c("YES" = 16, "NO" = 1)) +
  ylim(0, 0.6) +
  ylab("effective quantum yield (dF/F'm)") +
  xlab("Hour (South African Standard Time)")

warming_plot

ggsave("warming_redraw.pdf", 
       plot = warming_plot, 
       device = "pdf",
       path = here("figures"),
       bg = "white"
)
