
library(docxtractr)
library(data.table)
library(lubridate)
library(dplyr)
library(dendextend)
library(rpart)
library(rpart.plot)
library(tidyverse)
library(sp)
library(stringr)
library(stringi)
library(mapproj)

setwd("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari")


#Setting details of or set aspects of the locale for the R process.
Sys.setlocale(category = "LC_ALL", locale = "Turkish")

#Extracting tables from EPDK reports
extract_table_22 <- function(reports,report_name){
  
  reports_table <- paste(reports,"_table")
  
  reports_table <- docx_extract_all_tbls(reports)
  
  reports_table <- sapply(reports_table,as.data.frame)
  
  reports_table <- sapply(reports_table, setDT)
  
  reports_table <-reports_table[[22]]
  
  reports_table$report_year <- report_name
  
  colnames(reports_table) <- c("Cities", "Lightening", "Dwelling", "Industry","Agricultural_Irrigation", 
                               "Businesses", "Sectors_Total", "Share","report_year")
  
  reports_table <- reports_table[-82,]
  
  return(reports_table)
}


extract_table_21 <- function(reports,report_name){
  
  reports_table <- paste(reports,"_table")
  
  reports_table <- docx_extract_all_tbls(reports)
  
  reports_table <- sapply(reports_table,as.data.frame)
  
  reports_table <- sapply(reports_table, setDT)
  
  reports_table <- reports_table[[21]]
  
  reports_table$report_year <- report_name
  
  colnames(reports_table) <- c("Cities", "Lightening", "Dwelling", "Industry","Agricultural_Irrigation", 
                               "Businesses", "Sectors_Total", "Share", "report_year")
  
  reports_table <- reports_table[-82,]
  
  return(reports_table)
}


april_2019 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Nisan_2019.docx")

april_2019 <- extract_table_21(april_2019,deparse(substitute(april_2019)))

march_2019 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Mart_2019.docx")

march_2019 <- extract_table_21(march_2019,deparse(substitute(march_2019)))

february_2019 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/February_2019.docx")

february_2019 <- extract_table_21(february_2019,deparse(substitute(february_2019)))

january_2019 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Ocak_2019.docx")

january_2019 <- extract_table_21(january_2019,deparse(substitute(january_2019)))

december_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/december_2018.docx")

december_2018 <- extract_table_21(december_2018,deparse(substitute(december_2018)))

november_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Kasim_2018.docx")

november_2018 <- extract_table_21(november_2018,deparse(substitute(november_2018)))

october_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Ekim_2018.docx")

october_2018 <- extract_table_21(october_2018,deparse(substitute(october_2018)))

september_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Eylül_2018.docx")

september_2018 <- extract_table_21(september_2018,deparse(substitute(september_2018)))

august_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/august_2018.docx")

august_2018 <- extract_table_21(august_2018,deparse(substitute(august_2018)))

july_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Temmuz_2018.docx")

july_2018 <- extract_table_21(july_2018,deparse(substitute(july_2018)))

june_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Haziran_2018.docx")

june_2018 <- extract_table_21(june_2018,deparse(substitute(june_2018)))

may_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/may_2018.docx")

may_2018 <- extract_table_21(may_2018,deparse(substitute(may_2018)))

april_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Nisan_2018.docx")

april_2018 <- extract_table_21(april_2018,deparse(substitute(april_2018)))

march_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Mart_2018.docx")

march_2018 <- extract_table_21(march_2018,deparse(substitute(march_2018)))

february_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/february_2018.docx")

february_2018 <- extract_table_21(february_2018,deparse(substitute(february_2018)))

january_2018 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Ocak_2018.docx")

january_2018 <- extract_table_21(january_2018,deparse(substitute(january_2018)))

december_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/december_2017.docx")

december_2017 <- extract_table_22(december_2017,deparse(substitute(december_2017)))

november_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/november_2017.docx")

november_2017 <- extract_table_22(november_2017,deparse(substitute(november_2017)))

october_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Ekim_2017.docx")

october_2017 <- extract_table_21(october_2017,deparse(substitute(october_2017)))

september_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Eylül_2017.docx")

september_2017 <- extract_table_21(september_2017,deparse(substitute(september_2017)))

august_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/august_2017.docx")

august_2017 <- extract_table_21(august_2017,deparse(substitute(august_2017)))

july_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Temmuz_2017.docx")

july_2017 <- extract_table_21(july_2017,deparse(substitute(july_2017)))

june_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Haziran_2017.docx")

june_2017 <- extract_table_21(june_2017,deparse(substitute(june_2017)))

may_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/may_2017.docx")

may_2017 <- extract_table_21(may_2017,deparse(substitute(may_2017)))

april_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Nisan_2017.docx")

april_2017 <- extract_table_21(april_2017,deparse(substitute(april_2017)))

march_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Mart_2017.docx")

march_2017 <- extract_table_21(march_2017,deparse(substitute(march_2017)))

february_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/february_2017.docx")

february_2017 <- extract_table_21(february_2017,deparse(substitute(february_2017)))

january_2017 <- read_docx("C:/Users/sena/Desktop/Algopoly/EPDK_Aylik_Sektor_Raporlari/Ocak_2017.docx")

january_2017_table <- docx_extract_all_tbls(january_2017)

january_2017_table <- sapply(january_2017_table,as.data.frame)

january_2017_table <- sapply(january_2017_table, setDT)

january_2017_table <- january_2017_table[[21]]



january_2017_table$report_year <- "january_2017"

colnames(january_2017_table) <- c("Cities", "Lightening", "Dwelling", "Industry","Agricultural_Irrigation", 
                                  "Businesses", "Sectors_Total", "Share", "report_year")

january_2017_table <- january_2017_table[-c(41,83),]



#Combined all tables in one table

all_data <- rbind(january_2017_table,january_2018,january_2019,february_2017,february_2019,february_2018,march_2017,march_2018,march_2019,
                  april_2017,april_2018,april_2019,may_2017,may_2018,june_2017,june_2018,july_2017,july_2018,august_2017,august_2018,
                  september_2017,september_2018,october_2017,october_2018,november_2017,november_2018,december_2017,december_2018)


all_data <- data.frame(apply(all_data, 2, gsub, patt="\\.", replace=""))

all_data <- data.frame(apply(all_data, 2, gsub, patt=",", replace="\\."))



all_data$Cities <- as.character(as.factor(all_data$Cities))

all_data$report_year <- as.character(as.factor(all_data$report_year))

all_data[,c(2:8)] <- sapply(all_data[,c(2:8)], as.character)

all_data[,c(2:8)] <- sapply(all_data[,c(2:8)], as.numeric)

all_data <- setDT(all_data)

#Creating date column

all_data <- all_data %>% mutate(year = gsub(".*_","",report_year))

all_data <- all_data %>% mutate(month = gsub("_.*","",report_year))

all_data <- setDT(all_data)

month_number_first_4 <- as.data.frame(rep(1:4,each = 243))

colnames(month_number_first_4) <- "month_number"

month_number_8 <- as.data.frame(rep(5:12,each = 162))

colnames(month_number_8) <- "month_number"

month_number <- rbind(month_number_first_4,month_number_8)

all_data <- cbind(all_data, month_number)

all_data$day <- 1

all_data <- all_data[,date:=paste0(year,"/",month_number,"/",day)]

all_data$date <- as_date(all_data$date)

all_data_characters <- all_data[,c("Cities","date","report_year","year","month")]

all_data[,c("Cities","date","report_year","year","month")]=NULL

#There are some negative values. Their absolute values are accurate.

all_data <- abs(all_data)

#there are NA values, it is assigned 0

all_data[is.na(all_data),] <- 0

all_data <- cbind(all_data_characters,all_data)

all_data <- setDT(all_data)

#Due to errors in data, all share values are calculated again

all_data[,Sectors_Total:=Agricultural_Irrigation+Businesses+Dwelling+Industry+Lightening]

all_data[,Lightening_share:=Lightening/Sectors_Total]

all_data[,Dwelling_share:=Dwelling/Sectors_Total]

all_data[,Industry_share:=Industry/Sectors_Total]

all_data[,agricultural_irrigation_share:=Agricultural_Irrigation/Sectors_Total]

all_data[,Businesses_share:=Businesses/Sectors_Total]

#Features' proportions are taken as reference

all_data_melted <- all_data[,c(1,4,5,16:19)]

all_data_melted <- melt(all_data_melted, id.vars = c("Cities","year","month"), measure.vars = c("Dwelling_share","Industry_share",
                                                                                                "agricultural_irrigation_share","Businesses_share"))

#Values in the same month in different years are taken average.

all_data[,c(3:5,12:14)]=NULL

all_data_dcasted <- dcast(all_data_melted, Cities+variable+month~year)

all_data_dcasted_2017 <- all_data_dcasted[,c(1:4)]

all_data_dcasted_2018 <- all_data_dcasted[,c(1:3,5)]

all_data_dcasted_2019 <- all_data_dcasted[,c(1:3,6)]

all_data_dcasted_numeric <- all_data_dcasted[,c(4:6)]

all_data_dcasted_numeric <- as.data.frame(rowMeans(all_data_dcasted_numeric,na.rm = TRUE))

all_data_dcasted[,c(4:6)] = NULL

all_data_dcasted <- cbind(all_data_dcasted,all_data_dcasted_numeric)

colnames(all_data_dcasted)[colnames(all_data_dcasted)=="rowMeans(all_data_dcasted_numeric, na.rm = TRUE)"] <- "value"

all_data_avg <- dcast(all_data_dcasted,Cities~month+variable,value.var = "value")

colnames(all_data_avg)[colnames(all_data_avg)=="all_data_avg$Cities"] <- "Cities"

#Cities are clustered by using all values with k-means algorithm

set.seed(50)

group_number_all_data <- kmeans(all_data_avg[,c(2:49)],7)

group_number_all_data <- as.data.frame(group_number_all_data$cluster)

group_numbers <- group_number_all_data

group_numbers <- cbind(all_data_avg$Cities,group_numbers)

#Cities are clustered by using agricultural share values with k-means algorithm

set.seed(5)


group_number_agricultural <- kmeans(all_data_avg[,c(seq(4,49,4))],7)

group_number_agricultural <- as.data.frame(group_number_agricultural$cluster)

group_numbers <- cbind(group_numbers,group_number_agricultural)

#Cities are clustered by using dwelling share values with k-means algorithm


set.seed(1)


group_number_Dwelling <- kmeans(all_data_avg[,c(seq(2,49,4))],7)

group_number_Dwelling <- as.data.frame(group_number_Dwelling$cluster)

group_numbers <- cbind(group_numbers,group_number_Dwelling)

#Cities are clustered by using industry share values with k-means algorithm


set.seed(2)

group_number_Industry <- kmeans(all_data_avg[,c(seq(3,49,4))],7)

group_number_Industry <- as.data.frame(group_number_Industry$cluster)

group_numbers <- cbind(group_numbers,group_number_Industry)


#Cities are clustered by using businesses share values with k-means algorithm

set.seed(3)

group_number_Businesses <- kmeans(all_data_avg[,c(seq(5,49,4))],7)

group_number_Businesses <- as.data.frame(group_number_Businesses$cluster)

group_numbers <- cbind(group_numbers,group_number_Businesses)

row.names(all_data_avg) <- all_data_avg$Cities

#Hierarchical clustering is applied

set.seed(90)

cluster <- hclust(dist(all_data_avg[,c(2:49)]), method = "complete")

cluster_cut <- cutree(cluster,7)

cluster_cut1 <- cutree(cluster,40)

cluster_cut1 <- as.data.frame(cluster_cut1)

cluster_cut1 <- cbind(all_data_avg$Cities,cluster_cut1)

dend <- as.dendrogram(cluster)

dend <- color_labels(dend, k = 7, col =c("black", "red", "blue", "brown", "darkolivegreen","gold4", "gray27",
                                         "mediumvioletred","lightsteelblue4","seagreen","slateblue4",
                                         "darkmagenta", "sienna4","orangered3","darkorchid4"))

dend <- set(dend,"labels_cex",.7)

labels(dend) <- all_data_avg$Cities[labels(dend)]

group_numbers <- cbind(group_numbers,as.data.frame(cluster_cut))

colnames(group_numbers)[colnames(group_numbers)=="all_data_avg$Cities"] <- "Cities"

#Creating similarity matrix with 81x81

similarity_matrix <- matrix(0, nrow=81, ncol=81)

rownames(similarity_matrix) <- all_data_avg$Cities

colnames(similarity_matrix) <- all_data_avg$Cities

#Cells equal to -1 when row's and column's names are the same, which means they belong to same city.
for(i in 1:81){
  similarity_matrix[i,i] <- -1
}

#Cells belonging to cities which are in the same cluster increases 1. There are 6 clustering method.

for(i in 2:7){
  for(j in 1:81){
    for(k in 1:81){
      if(j+k<=81){
        if(group_numbers[j,i]==group_numbers[j+k,i]){
          similarity_matrix[j,j+k] = similarity_matrix[j,j+k] + 1
        }
      }
    }
  }
}

similarity_matrix <- melt(similarity_matrix)

#Cities which are in the same cluster whenever a clustering method is applied are closest cities.

closest_cities <- similarity_matrix %>% filter( value == 6 )

colnames(closest_cities) <- c("Cities 1", "Cities 2")

closest_cities <- paste0(closest_cities$`Cities 1`,"-",closest_cities$`Cities 2`)

#Reference date is transformed months into seasons

set.seed(20)


Summer <- all_data_avg[,c(1,6:9,22:29)]

Summer$Dwelling = rowMeans(Summer[,c(2,6,10)])

Summer$Businesses = rowMeans(Summer[,c(5,9,13)])

Summer$Industry = rowMeans(Summer[,c(3,7,11)])

Summer$Agricultural_Irrigation = rowMeans(Summer[,c(4,8,12)])

Summer[,c(2:13)]=NULL

Summer$report_period = "Summer"

set.seed(60)

Fall <- all_data_avg[,c(1,38:49)]

Fall$Dwelling = rowMeans(Fall[,c(2,6,10)])

Fall$Businesses = rowMeans(Fall[,c(5,9,13)])

Fall$Industry = rowMeans(Fall[,c(3,7,11)])

Fall$Agricultural_Irrigation = rowMeans(Fall[,c(4,8,12)])

Fall[,c(2:13)]=NULL

Fall$report_period <- "Fall"

set.seed(70)

Winter <- all_data_avg[,c(1,10:21)]

Winter$Dwelling = rowMeans(Winter[,c(2,6,10)])

Winter$Businesses = rowMeans(Winter[,c(5,9,13)])

Winter$Industry = rowMeans(Winter[,c(3,7,11)])

Winter$Agricultural_Irrigation = rowMeans(Winter[,c(4,8,12)])

Winter[,c(2:13)]=NULL

Winter$report_period = "Winter"

set.seed(80)

Spring <- all_data_avg[,c(1:5,30:37)]

Spring$Dwelling = rowMeans(Spring[,c(2,6,10)])

Spring$Businesses = rowMeans(Spring[,c(5,9,13)])

Spring$Industry = rowMeans(Spring[,c(3,7,11)])

Spring$Agricultural_Irrigation = rowMeans(Spring[,c(4,8,12)])

Spring[,c(2:13)]=NULL

Spring$report_period = "Spring"

all_data_terms <- rbind(Fall,Winter,Spring,Summer)

all_data_terms <- melt(all_data_terms,id.vars = c("Cities","report_period"))

all_data_terms <- dcast(all_data_terms,Cities~report_period+variable)

#Cities arranged in seasonal format are clustered by using k-means algorithm

set.seed(7)

all_data_terms_kmeans <- kmeans(all_data_terms[,c(2:17)],7)

all_data_terms_groups_number <- all_data_terms_kmeans$cluster

all_data_terms_groups <- cbind(all_data_terms,as.data.frame(all_data_terms_groups_number))

cities_of_classification <- all_data_terms_groups[,c(1,18)]

all_data_terms_groups$Cities = NULL

#Clusters in seasonal format are classified

set.seed(10)

classification_all_data_terms <- rpart(all_data_terms_groups_number~., all_data_terms_groups, 
                                       method = "class",control = rpart.control(minbucket = 5,cp=0))

classification_summary <- cbind(all_data_avg$Cities,as.data.frame(all_data_terms_groups_number))

colnames(classification_summary) <- c("Cities","Group_Number")

classification_summary$Cities <- as.character(classification_summary$Cities)


#Turkey map coordinates are extracted

turkey <- readRDS("gadm36_TUR_1_sp.rds")

#Since characters of names of cities in turkey map do not match with names of cities in our data, character transformations are applied

colnames(turkey@data)[colnames(turkey@data)=="NAME_1"] <- "Cities"

turkey@data$Cities <- gsub("g","ğ",turkey@data$Cities)

turkey@data$Cities <- stri_trans_toupper(turkey@data$Cities,locale = "tr")

turkey@data$Cities <- gsub("AFYON","AFYONKARAHİSAR",turkey@data$Cities)

turkey$Cities<-gsub("AĞRİ","AĞRI",turkey$Cities)

turkey$Cities<-gsub("ADİYAMAN","ADIYAMAN",turkey$Cities)

turkey$Cities<-gsub("BALİKESİR","BALIKESİR",turkey$Cities)

turkey$Cities<-gsub("BİNĞÖL","BİNGÖL",turkey$Cities)

turkey$Cities<-gsub("ÇANKİRİ","ÇANKIRI",turkey$Cities)

turkey$Cities<-gsub("DİYARBAKİR","DİYARBAKIR",turkey$Cities)

turkey$Cities<-gsub("ESKİSEHİR","ESKİŞEHİR",turkey$Cities)

turkey$Cities<-gsub("GÜMÜSHANE","GÜMÜŞHANE",turkey$Cities)

turkey$Cities<-gsub("K. MARAS","KAHRAMANMARAŞ",turkey$Cities)

turkey$Cities<-gsub("AYDİN","AYDIN",turkey$Cities)

turkey$Cities<-gsub("KİNKKALE","KIRIKKALE",turkey$Cities)

turkey$Cities<-gsub("KİRKLARELİ","KIRKLARELİ",turkey$Cities)

turkey$Cities<-gsub("KİRSEHİR","KIRŞEHİR",turkey$Cities)

turkey$Cities<-gsub("MUS","MUŞ",turkey$Cities)

turkey$Cities<-gsub("NEVSEHİR","NEVŞEHİR",turkey$Cities)

turkey$Cities<-gsub("ISTANBUL","İSTANBUL",turkey$Cities)

turkey$Cities<-gsub("IZMİR","İZMİR",turkey$Cities)

turkey$Cities<-gsub("USAK","UŞAK",turkey$Cities)

turkey$Cities<-gsub("ZİNĞULDAK","ZONGULDAK",turkey$Cities)

turkey$Cities<-gsub("SANLİURFA","ŞANLIURFA",turkey$Cities)

turkey$Cities<-gsub("SİRNAK","ŞIRNAK",turkey$Cities)

turkey$Cities<-gsub("YOZĞAT","YOZGAT",turkey$Cities)

#Cities' information is hold.

turkey_for <- fortify(turkey)

#Cluster numbers obtained from classification are merged with cities'coordinates

cities_and_id <- data_frame(id = rownames(turkey@data),
                                Cities = turkey@data$Cities) %>% 
  left_join(classification_summary, by = "Cities")

#Final map is obtained

final_map <- left_join(turkey_for, cities_and_id, by = "id")

save(dend,classification_all_data_terms,classification_summary,closest_cities,
     not_closest_but_very_close,not_close,final_map,file = ".rdata")



