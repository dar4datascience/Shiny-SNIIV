
library(httr)
library(jsonlite)
library(dplyr)
library(janitor)

safely_get <- function(api_url) {
  tryCatch(
    {
      # Execute the API request
      response <- GET(api_url)
      
      # Check if the request was successful; if not, an error will be thrown
      stop_for_status(response)
      
      # Other processing if needed
      
      # Return the response object or any specific value you need
      return(response)
    },
    error = function(e) {
      # Handle connection error or other exceptions
      if (grepl("Failed to connect", e$message)) {
        cat("Connection error: Unable to connect to the server.\n")
        # Handle or return an appropriate value
      } else {
        # Handle other errors
        stop(e)
      }
    }
  )
}

#response <- safely_get(api_url)

# API Constructor ---------------------------------------------------------


# Function to get the SNIIV API URL by name
get_sniiv_api_url <- function(api_name) {
  
  # Create the named list variable sniiv_apis_list with API URLs
  sniiv_apis_list <- list(
    financiamiento = "https://sniiv.sedatu.gob.mx/api/CuboAPI/GetFinanciamiento/%s/%s/%s/%s",
    conavi = "https://sniiv.sedatu.gob.mx/api/CuboAPI/GetCONAVI/%s/%s/%s/%s",
    fovisste = "https://sniiv.sedatu.gob.mx/api/CuboAPI/GetFOVISSSTE/%s/%s/%s/%s",
    infonavit = "https://sniiv.sedatu.gob.mx/api/CuboAPI/GetINFONAVIT/%s/%s/%s/%s",
    cnbv = "https://sniiv.sedatu.gob.mx/api/CuboAPI/GetCNBV/%s/%s/%s/%s",
    insus = "https://sniiv.sedatu.gob.mx/api/CuboAPI/GetInsus/%s/%s/%s/%s",
    fonhapo = "https://localhost:44369/api/CuboAPI/GetFONHAPO/%s/%s/%s/%s",
    inventario = "https://sniiv.sedatu.gob.mx/api/CuboAPI/GetInventario/%s/%s/%s/%s",
    registro = "https://sniiv.sedatu.gob.mx/api/CuboAPI/GetRegistro/%s/%s/%s/%s"
  )
  
  
  
  if (api_name == "show") {
    return(names(sniiv_apis_list))
  } else if (api_name %in% names(sniiv_apis_list)) {
    return(sniiv_apis_list[[api_name]])
  } else {
    stop("Invalid API name. Please provide a valid API name or use 'show' to display all API names.")
  }
  
}

# Example usage:
#api_name <- "financiamiento"
#api_url <- get_sniiv_api_url(api_name)
#print(api_url)


# Function to make a generic API call
make_sniiv_api_call <- function(api_url) {
  
  # Execute the API request
  response <- safely_get()
  
  # Check if the request was successful; if not, an error will be thrown
  stop_for_status(response)
  
  # Parse JSON content into a variable
  api_response_content <- rawToChar(response$content) |> 
    fromJSON()
  
  # Check if the parsed content is a dataframe
  if (is.data.frame(api_response_content) ) {
    # If it's a dataframe, proceed with cleaning and arranging
    df <- api_response_content |> 
      clean_names() |> 
      arrange(ano)
  } else {
    # If it's not a dataframe, return the original content
    df <- api_response_content
  }
  
  
  return(df)
}



# Financiamiento ----------------------------------------------------------

get_financiamiento_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetFinanciamiento/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  df <- make_sniiv_api_call(url)
  
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

get_conavi_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetCONAVI/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  df <- make_sniiv_api_call(url)
  
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

# Fovissste ----------------------------------------------------------------

get_fovisste_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetFOVISSSTE/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  df <- make_sniiv_api_call(url)
  
  return(df)
}


# Infonavit ----------------------------------------------------------------

get_infonavit_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetINFONAVIT/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  df <- make_sniiv_api_call(url)
  
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

get_cnbv_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetCNBV/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  df <- make_sniiv_api_call(url)
  
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


# INSUS ------------------------------------------------------------------

get_insus_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetInsus/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  df <- make_sniiv_api_call(url)
  
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

get_fonhapo_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://localhost:44369/api/CuboAPI/GetFONHAPO/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  df <- make_sniiv_api_call(url)
  
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


get_inventario_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetInventario/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  df <- make_sniiv_api_call(url)
  
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

get_registro_data <- function(anios, clave_estado, clave_municipio, dimensiones) {
  
  # Construct the API URL
  url <- sprintf("https://sniiv.sedatu.gob.mx/api/CuboAPI/GetRegistro/%s/%s/%s/%s",
                 anios, clave_estado, clave_municipio, dimensiones)
  
  
  df <- make_sniiv_api_call(url)
  
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

