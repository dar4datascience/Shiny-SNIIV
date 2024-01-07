# library(testthat)
# library(httr)
# library(jsonlite)
# library(dplyr)
# library(janitor)
# 
# source('app/logic/query_sniiv_api.R')
# 
# # Test function for API calls
# test_that("API calls return a dataframe", {
#   # Get all API names
#   api_names <- get_sniiv_api_url("show")
#   
#   # Test each API URL
#   for (api_name in api_names) {
#     api_url <- get_sniiv_api_url(api_name)
#     df <- make_sniiv_api_call(api_url)
#     
#     # Assert that the result is a dataframe
#     expect_true(is.data.frame(df), sprintf("API %s did not return a dataframe.", api_name))
#   }
# })
