library(ggplot2)
library(showtext)
sysfonts::font_add_google('Noto Sans TC')
showtext_auto()
theme_set(
  theme(
    text=element_text(family = "Noto Sans TC")
  )+
    theme_classic()
)
library(econDV2)
gg <- list(
  dash = econDV2::ggdash,
  geom = econDV2::ggbrowse,
  aes = econDV2::ggaes
)
imgFolder = "/Users/martinl/Github/economic-data-visualization-2021/img"
teachDS::set_screenShotDir(imgFolder)
# img <- teachDS::Image()
