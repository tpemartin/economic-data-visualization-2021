econDV2::Object(electronics)
electronics$source[[1]] <- "http://www.trade.gov.tw/OpenData/getOpenData.aspx?oid=AC5D691AC64B971D"
electronics$data <- {
  library(readr)
  getOpenData <- read_csv("http://www.trade.gov.tw/OpenData/getOpenData.aspx?oid=AC5D691AC64B971D")
  getOpenData
}
b <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point()

df <- data.frame(x1 = 2.62, x2 = 3.57, y1 = 21.0, y2 = 15.0)
b +
  geom_curve(aes(x = x1, y = y1, xend = x2, yend = y2, colour = "curve"), data = df) +
  geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2, colour = "segment"), data = df)

  