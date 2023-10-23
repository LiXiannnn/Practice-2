library(rvest)

help("read_html")

# Load in the html
csv_wiki <- read_html("https://en.wikipedia.org/wiki/Comma-separated_values")

# %>% pipe the link into nodes
csv_tables <- csv_wiki %>% 
  html_nodes(xpath = '//h2[contains(., "Example")]//following-sibling::pre') %>% 
  html_text()

csv_table1 <- csv_wiki %>%
  html_elements(xpath = '//*[@id="mw-content-text"]/div[1]/pre[1]/text()') %>%
  html_text()

csv_tables
csv_table <- csv_tables[1]

# Write to csv file
write.table(csv_table, file = "car.csv", quote = FALSE, col.names = FALSE, 
            row.names = FALSE)

write.table(csv_table, file = "car.csv", col.names = FALSE, row.names = FALSE)

table1a <- csv_wiki %>% 
  html_nodes(xpath = '//*[@id="mw-content-text"]/div[1]/table[2]/tbody') %>%
  html_table()
table1a

table1b <- csv_wiki %>% 
  html_elements(xpath = '//*[@id="mw-content-text"]/div[1]/table[2]') %>%
  html_table()
table1b

