library(htmltab)
url_dani <- "https://en.wikipedia.org/wiki/2008_Summer_Olympics_medal_table"
variable_to_save_table <- htmltab(doc=url_dani, which=3)
variable_to_save_table
head(variable_to_save_table, 10)
str(variable_to_save_table)
write.table(variable_to_save_table, file = "China2008.xls", sep="\t", row.names=FALSE)