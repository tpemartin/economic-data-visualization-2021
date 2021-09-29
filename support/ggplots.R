myGoodPlot <- function(data4plot) {
  myplot <- {
    ggplot() +
      geom_point(
        data = data4plot$point$data,
        mapping = aes(
          x = x, y = y
        ),
        fill = "#2fc1d3",
        shape = 21,
        color = "black",
        stroke = 1,
        size = 12
      ) +
      geom_text(
        data = data4plot$text$data,
        mapping = aes(
          x = x, y = y, label = label
        ),
        hjust = 0,
        size = 12
      )
  }
  myplot
}
