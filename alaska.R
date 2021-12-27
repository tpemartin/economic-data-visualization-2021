alaska <- world |> 
  dplyr::filter(
    subregion=="Alaska"
  )
alaska |> split(
  sign(alaska$long)
) -> list_alaska
# list_alaska[[1]] |>
  alaska |> 
  ggplot()+
  geom_polygon(
    aes(
      x=long, y=lat, group=group
    )
  ) + coord_map()
##
world |> 
  group_by(group) |> 
  summarise(
    region = region[[1]],
    subregion = subregion[[1]],
    changeSign = any(sign(long) == -1) && any(sign(long) == 1)
  ) -> world_sum
target_groups <- world_sum |>
  dplyr::filter(
    changeSign
  ) 

world |> 
  dplyr::filter(
    !(group %in% target_groups$group) &
      subregion != "Alaska"
  ) |> #View()
  ggplot() +
  geom_polygon(
    aes(x=long, y=lat, group=group)
  ) + coord_map()

usa <- world |> dplyr::filter(region=="USA")
library(dplyr)
usa |> 
  mutate(
    long_sign = sign(long)
  ) |>
  group_by(group) |>
  mutate(
    subgroup= if_else(long_sign>=0, 0, 0.5)
  ) |> 
  ungroup() -> usa2
View(usa2)  
