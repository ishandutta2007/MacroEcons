library("rvest")
url <- "https://www.cbinsights.com/research-unicorn-companies"
unicorns <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="element-32"]/div/table') %>%
  html_table(fill = TRUE)
unicorns <- unicorns[[1]]
#table.wikitable:nth-child(14)
#head(unicorns)
# -fo//*[@id="element-32"]/div/table


