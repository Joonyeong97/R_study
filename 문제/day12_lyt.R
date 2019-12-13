#
#
# day12 
# 임영택 20191211
#
#
#

# 문1)
# 20대 국회 개원 여·야 3당 대표 국회연설문에 대해 각각 워드클라우드를
# 작성하시오.
# 예제소스 파일은 ‘ex_10-1.txt’, ‘ex_10-2.txt’, ‘ex_10-3.txt’이다.

library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)


library(dplyr)
library(ggplot2)


setwd('D:/lyt09/문제/1211')
mun1 <- readLines("ex_10-1.txt", encoding = "UTF-8")
mun2 <- readLines("ex_10-2.txt", encoding = "UTF-8")
mun3 <- readLines("ex_10-3.txt", encoding = "UTF-8")

buildDictionary(ext_dic = 'woorimalsam')
col1 <- brewer.pal(8,"Dark2")


mun1_1 <- sapply(mun1, extractNoun,USE.NAMES = F)
mun1_1 <- unlist(mun1_1)
mun1_1 <- mun1_1[nchar(mun1_1) > 1] # 1글자 이하 제외

wordmun1 <- table(mun1_1)
sort(wordmun1)

wordcloud2(wordmun1)

# 1-2
mun2_2 <- sapply(mun2, extractNoun,USE.NAMES = F)
mun2_2 <- unlist(mun2_2)
mun2_2 <- mun2_2[nchar(mun2_2) > 1]
mun2_2 <- gsub("들이", "" , mun2_2)
mun2_2 <- gsub("해서", "" , mun2_2)

wordmun2 <- table(mun2_2)

wordcloud2(wordmun2)

# 1-3
mun3_1 <- sapply(mun3, extractNoun, USE.NAMES = F)
mun3_1 <- unlist(mun3_1)
mun3_1 <- mun3_1[nchar(mun3_1) > 1]


wordmun3 <- table(mun3_1)

wordcloud2(wordmun3)


# 문2)
# 스티브 잡스의 스탠포드 대학 졸업식 연설문에 대해 워드클라우드를 작성
# 하시오.
# Tip. 예제소스 파일은 ‘ex_10-4.txt’이다.

steve <- readLines("ex_10-4.txt", encoding = "UTF-8")
st1 <- sapply(steve, extractNoun, USE.NAMES = F)
st1 <- unlist(st1)
st1 <- st1[nchar(st1) > 1]

stword <- table(st1)

wordcloud2(stword)


#문3) 
#오바마 대통령의 데통령 당선 연설문에 대해 워드클라우드를 작성하시오
#Tip. 예제소스 파일은 ‘ex_10-5.txt’이다.

obama <- readLines("ex_10-5.txt", encoding = "UTF-8")
ob <- sapply(obama, extractNoun,USE.NAMES = F)
ob <- unlist(ob)
ob <- ob[nchar(ob)>1]

obword <- table(ob)

palz <- brewer.pal(9,'Blues')[3:9]
brewer.pal.info
wordcloud2(obword,
           color = rep_len( c('red','blue') ),
           nrow(ob()))















