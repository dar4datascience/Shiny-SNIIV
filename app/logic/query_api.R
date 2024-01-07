url="https://sniiv.sedatu.gob.mx/api/CuboAPI/GetFinanciamiento/1973,2023/0/0/anio,organismo,modalidad"


library(httr)
library(jsonlite)
library(dplyr)


#Ejectuar la petición
r <- GET(url)

df <- fromJSON(rawToChar(r$content)) |> 
  arrange(año)

df