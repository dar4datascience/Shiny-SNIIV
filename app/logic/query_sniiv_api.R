
# Financiamiento ----------------------------------------------------------

library(httr)
library(jsonlite)
library(dplyr)
library(janitor)

get_financiamiento_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetFinanciamiento/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  # Execute the API request
  response <- GET(url)
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a dataframe
  df <- fromJSON(rawToChar(response$content)) %>%
    arrange(año)
  
  return(df)
}

# 
# # Example usage:
# anios <- "2019,2021"
# clave_estado <- "09"
# clave_municipio <- "002"
# dimensiones <- "anio,estado,municipio,monto,rango_edad"
# 
# result_df <- get_financiamiento_data(anios, clave_estado, clave_municipio, dimensiones)
# print(result_df)
# 
# # Example usage for the provided URL
# anios <- "1973,2023"
# clave_estado <- "0"
# clave_municipio <- "0"
# dimensiones <- "anio,organismo,modalidad"
# 
# result_df <- get_financiamiento_data(anios, clave_estado, clave_municipio, dimensiones)
# print(result_df)



# Conavi ------------------------------------------------------------------

library(httr)
library(jsonlite)
library(dplyr)

get_conavi_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetCONAVI/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  # Execute the API request
  response <- GET(url)
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a dataframe
  df <- fromJSON(rawToChar(response$content)) %>%
    arrange(año)
  
  return(df)
}

# Example usage for the provided CONAVI API parameters
# anios <- "2018,2021"
# clave_estado <- "19"
# clave_municipio <- "000"
# dimensiones <- "anio,estado,municipio,poblacion_indigena,modalidad"
# 
# result_df_conavi <- get_conavi_data(anios, clave_estado, clave_municipio, dimensiones)
# print(result_df_conavi)
# 

library(httr)
library(jsonlite)
library(dplyr)


# Fovissste ----------------------------------------------------------------



get_fovisste_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetFOVISSSTE/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  # Execute the API request
  response <- GET(url)
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a dataframe
  df <- fromJSON(rawToChar(response$content)) %>%
    arrange(año)
  
  return(df)
}

# # Example usage for the provided FOVISSSTE API parameters
# anios <- "2020,2021"
# clave_estado <- "08"
# clave_municipio <- "005"
# dimensiones <- "anio,municipio,genero"
# 
# result_df_fovisste <- get_fovisste_data(anios, clave_estado, clave_municipio, dimensiones)
# print(result_df_fovisste)


# Infonavit ----------------------------------------------------------------

library(httr)
library(jsonlite)
library(dplyr)

get_infonavit_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetINFONAVIT/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  # Execute the API request
  response <- GET(url)
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a dataframe
  df <- fromJSON(rawToChar(response$content)) %>%
    arrange(año)
  
  return(df)
}

# Example usage for the provided INFONAVIT API parameters
# anios <- "2018"
# clave_estado <- "08"
# clave_municipio <- "005"
# dimensiones <- "anio,municipio,genero"
# 
# result_df_infonavit <- get_infonavit_data(anios, clave_estado, clave_municipio, dimensiones)
# print(result_df_infonavit)


# CNBV --------------------------------------------------------------------

library(httr)
library(jsonlite)
library(dplyr)

get_cnbv_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetCNBV/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  # Execute the API request
  response <- GET(url)
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a dataframe
  df <- fromJSON(rawToChar(response$content)) %>%
    arrange(año)
  
  return(df)
}

# Example usage for the provided CNBV API parameters
# anios <- "2018"
# clave_estado <- "08"
# clave_municipio <- "005"
# dimensiones <- "anio,municipio,genero"
# 
# result_df_cnbv <- get_cnbv_data(anios, clave_estado, clave_municipio, dimensiones)
# print(result_df_cnbv)


# INSUS -------------------------------------------------------------------

library(httr)
library(jsonlite)
library(dplyr)

get_insus_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetInsus/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  # Execute the API request
  response <- GET(url)
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a dataframe
  df <- fromJSON(rawToChar(response$content)) %>%
    arrange(año)
  
  return(df)
}

# Example usage for the provided INSUS API parameters
# anios <- "2022"
# clave_estado <- "02"
# clave_municipio <- "006"
# dimensiones <- "anio,municipio"
# 
# result_df_insus <- get_insus_data(anios, clave_estado, clave_municipio, dimensiones)
# print(result_df_insus)


# FONHAPO CONNECTION REFUSED (weird local host address) -----------------------------------------------------------------


library(httr)
library(jsonlite)
library(dplyr)

get_fonhapo_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://localhost:44369/api/CuboAPI/GetFONHAPO/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  # Execute the API request
  response <- GET(url)
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a dataframe
  df <- fromJSON(rawToChar(response$content)) 
  
  return(df)
}

# Example usage for the provided FONHAPO API parameters
# anios <- "2018"
# clave_estado <- "08"
# clave_municipio <- "005"
# dimensiones <- "anio,municipio,genero"
# 
# result_df_fonhapo <- get_fonhapo_data(anios, clave_estado, clave_municipio, dimensiones)
# print(result_df_fonhapo)


# Inventario de Vivienda Solo hay 2022? --------------------------------------------------

library(httr)
library(jsonlite)
library(dplyr)

get_inventario_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetInventario/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  # Execute the API request
  response <- GET(url)
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a dataframe
  df <- fromJSON(rawToChar(response$content)) %>%
    arrange(año)
  
  return(df)
}

# Example usage for the provided Inventario de Vivienda API parameters
# anios <- "2022,2"
# clave_estado <- "09"
# clave_municipio <- "0"
# dimensiones <- "anio,estado,segmento,tipo_vivienda"
# 
# result_df_inventario <- get_inventario_data(anios, clave_estado, clave_municipio, dimensiones)
# 
# 
# print(result_df_inventario)


# Registro de Vivienda ----------------------------------------------------


library(httr)
library(jsonlite)
library(dplyr)

get_registro_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetRegistro/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  # Execute the API request
  response <- GET(url)
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a dataframe
  df <- fromJSON(rawToChar(response$content)) %>%
    arrange(año)
  
  return(df)
}

# Example usage for the provided Registro de Vivienda API parameters
# anios <- "2022,2023"
# clave_estado <- "10"
# clave_municipio <- "000"
# dimensiones <- "anio,estado,segmento_uma,tipo_vivienda"
# 
# result_df_registro <- get_registro_data(anios, clave_estado, clave_municipio, dimensiones)
# print(result_df_registro)

