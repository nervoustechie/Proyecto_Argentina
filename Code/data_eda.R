library(ggplot2)

data <- read.csv("Datasets/costo-del-nivel-de-vida-caba.csv")
data$indice_tiempo <- as.Date(data$indice_tiempo)
data$nivel_general_excluidos_alimentos_frescos_serv_aloj[is.na(data$nivel_general_excluidos_alimentos_frescos_serv_aloj)]<-mean(data$nivel_general_excluidos_alimentos_frescos_serv_aloj,na.rm=TRUE)

# Define colors
colors <- c("green", "red", "blue", "purple", "magenta", "cyan", "yellow", "darkgreen")

ggplot(data) +
  geom_line(aes(x = indice_tiempo, y = nivel_general, color = "nivel_general"), size = 1.5) +
  geom_line(aes(x = indice_tiempo, y = alimentacion, color = "alimentacion"), size = 1.5) +
  geom_line(aes(x = indice_tiempo, y = indumentaria, color = "indumentaria"), size = 1.5) +
  geom_line(aes(x = indice_tiempo, y = gastos_generales, color = "gastos_generales"), size = 1.5) +
  geom_line(aes(x = indice_tiempo, y = alojamiento, color = "alojamiento"), size = 1.5) +
  geom_line(aes(x = indice_tiempo, y = menaje, color = "menaje"), size = 1.5) +
  labs(x = "Tiempo", y = "Nivel de Vida", color = "Variable") +
  ggtitle("Nivel De Vida Buenos Aires 1960-1975") +
  theme_minimal() +
  scale_color_manual(values = colors,
                     labels = c("Nivel general", "Alimentacion", "Indumentaria", 
                                "Gastos Generales", "Alojamiento", "Menaje"),
                     name = "Variables")

