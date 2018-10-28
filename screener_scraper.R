library("rvest")
library("quantmod")
library("httr")
page_no <- 2
profit_growth_3yr <- 40
min_market_cap <- 100

#login
login_url <- "https://www.screener.in/login/"
session <- html_session(login_url)
form <- html_form(read_html(login_url))[[1]]
filled_form <- set_values(form,
                          username = "ishandutta2007@gmail.com",
                          password = "notmyrealpassword")
submit_form(session, filled_form)

screen_url <- "https://www.screener.in/screen/raw/?"
screen_url <- paste0(screen_url, "page=")
screen_url <- paste0(screen_url, page_no)
screen_url <- paste0(screen_url, "&query=")
screen_url <- paste0(screen_url, "Profit+growth+3Years+>+")
screen_url <- paste0(screen_url, profit_growth_3yr)
screen_url <- paste0(screen_url, "+AND%0D%0A%0D%0A")
screen_url <- paste0(screen_url, "Market+Capitalization+>+")
screen_url <- paste0(screen_url, min_market_cap)
session <- html_session("https://www.screener.in/dash/")
jump_to(session, screen_url)
# techpicks <- screen_url %>%
#   read_html() %>%
#   html_nodes(xpath='table') %>%
#   html_table(fill = F)

screen <- read_html(screen_url, encoding = "ISO-8859-1")
screen %>% xml_structure()
screen %>% html_nodes("div")
