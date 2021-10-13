## ----eval=T, echo=FALSE-----
klippy::klippy()


## ---- eval=T, echo=F--------
teachDS::img_centering("https://i0.wp.com/cmdlinetips.com/wp-content/uploads/2019/11/scatter_plot_with_ggplot_scale_xy_log10_color.png")


## ---- eval=T, echo=F--------
teachDS::img_centering("https://belayeth.com/wp-content/uploads/2021/06/Rplot.png")


## ---- eval=T, echo=F--------
teachDS::img_centering("https://www.r-graph-gallery.com/img/graph/50-51-52-scatter-plot-with-ggplot2.png")


## ---- eval=T, echo=F--------
teachDS::img_centering("https://www.economist.com/img/b/1280/755/90/sites/default/files/images/2021/09/articles/main/20210918_woc289.png")


## ---- eval=T, echo=F--------
teachDS::img_centering("https://www.economist.com/img/b/600/895/90/sites/default/files/images/2021/09/articles/body/20210918_woc287.png")


## ---------------------------
# take Colombia, Normway, and Gemany as an example
data4plot <- list()
data4plot$point$data <- {
  data.frame(
    x=c(52.5, 56, 58.5),
    y=c(48.6, 54.9, 58)
  )
}
data4plot$text$data <- {
  data.frame(
    x=c(52.5, 56, 58.5),
    y=c(48.6, 54.9, 58),
    label=c("Colombia", "Norway", "Germany")
  )
}


## ---------------------------
myplot <- {
  ggplot()+
    geom_point(
      data=data4plot$point$data,
      mapping=aes(
        x=x, y=y
      ),
      fill="blue", 
      shape=21,  
      color="black",
      stroke=1,
      size=1 
    )+
    geom_text(
      data=data4plot$text$data,
      mapping=aes(
        x=x, y=y, label=label
      ),
      hjust = 1, 
      size = 1 #input$size
    )
}
myplot



## ---------------------------
myplot <- {
  ggplot()+
    geom_point(
      data=data4plot$point$data,
      mapping=aes(
        x=x, y=y
      ),
      fill="blue", #input$fill_point
      shape=21, # default point is a circle without border, you need another type of point
      color="black", #input$color_point
      stroke=1, #input$stroke_point
      size=1 #input$size_point
    )+
    geom_text(
      data=data4plot$text$data,
      mapping=aes(
        x=x, y=y, label=label
      ),
      hjust = 1, #input$hjust_text
      size = 1 #input$size_text
    )
}
myplot



## ---------------------------
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


## ---------------------------
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


## ---------------------------
source("support/ggplots.R") # suppose this is where your script file is

data4plot <- list()
data4plot$point$data <- {
  data.frame(
    x=c(52.5, 56, 58.5),
    y=c(48.6, 54.9, 58)
  )
}
data4plot$text$data <- {
  data.frame(
    x=c(52.5, 56, 58.5),
    y=c(48.6, 54.9, 58),
    label=c("Colombia", "Norway", "Germany")
  )
}

myGoodPlot(data4plot)


## ---------------------------
dir.create("works")
ggsave(
  filename = "works/week1.png",
  plot=myGoodPlot(data4plot),
  width=930,
  height=400, 
  units="mm" # text size is default in mm unit
)



## ---------------------------
myplot2 <- {
  myshape = 21 #input$shape_point
  ggplot() +
    geom_point(
      data = data4plot$point$data,
      mapping = aes(
        x = x, y = y
      ),
      fill = "#2fc1d3",
      shape = myshape,
      color = "black",
      stroke = 1,
      size = 12
    ) +
    geom_text(
      data = data4plot$text$data,
      mapping = aes(
        x = x + 
          0, #input$x_text
        y = y, label = label
      ),
      hjust = 0,
      size = 12
    )
}
myplot2


## ---------------------------
data = data4plot$text$data

myplot <- {
  size = 12 #input$size_text
  ggplot(data = data) +
    geom_point(
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
      mapping = aes(
        x = x, y = y, label = label
      ),
      hjust = 0,
      size = size/.pt
    )
}



## ---------------------------
myplot <- {
  ggplot(
    data = data,
    mapping = aes(x=x, y=y)
) +
    geom_point(
      fill = "#2fc1d3",
      shape = 21,
      color = "black",
      stroke = 1,
      size = 12
    ) +
    geom_text(
      mapping = aes(
        label = label
      ),
      hjust = 0,
      size = 12
    )
}
myplot


## ---------------------------
plot_hightlightCountries <- function(data) {
  myplot <- {
    ggplot(data = data,
  ) +
      geom_point(
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
        # data = data4plot$text$data,
        mapping = aes(
          x = x, y = y, label = label
        ),
        hjust = 0,
        size = 12
      )
  }
  myplot
}


## ---------------------------
nonhighlightedCountries <-
  data.frame(
    x=c(48, 52, 53),
    y=c(48, 53, 54)
  )
highlightedCountries <- data4plot$text$data

plot_allCountries <- 
{
  plot_hightlightCountries(highlightedCountries) +
    geom_point(
      data = nonhighlightedCountries,
      aes(
        x=x,
        y=y
      ),
      size = 12,
      color= "#a4dce6"
    )
}

plot_allCountries


## ---------------------------
plot_allCountries <- function(highlightedCountries, nonhighlightedCountries) {
  plot_hightlightCountries(highlightedCountries) +
    geom_point(
      data = nonhighlightedCountries,
      aes(
        x=x,
        y=y
      ),
      size = 12,
      color= "#a4dce6"
    )
}



## ---------------------------
plot_obsessionWithBorders <- {
  plot_allCountries(
    hightlightedCountries = highlightedCountries,
    unhighlightedCountries = unhighlightedCountries
  )+
  geom_abline(
    aes(
      slope=1,
      intercept=0
    ),
    color = "#549ab6",
    linetype = 2,
    size=2
  )
}
plot_obsessionWithBorders

## ---------------------------
plot_obsessionWithBorders +
  geom_abline(
    aes(
      slope=1,
      intercept=0
    ),
    color = "#549ab6",
    linetype = 2,
    size=2
  )


## ---------------------------
hightlightXYequal <- function(plot_obsessionWithBorders) {
  plot_obsessionWithBorders +
    geom_abline(
      aes(
        slope=1,
        intercept=0
      ),
      color = "#549ab6",
      linetype = 2,
      size=2
    )
}

