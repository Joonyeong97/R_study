#
#
# 제주도 제일많은 탑승구간 / 제일많은 하차구간
# 제주도 9월달 일별 버스 이용량 분석
#


# install.packages("dplyr")

library(dplyr)

setwd("D:/lyt/lyt09/분석자료/lyt_project/jeju dacon")
# 집
setwd("C:/Users/82105/Desktop/빅데이터교육/r/lyt09/분석자료/lyt_project/jeju dacon")
jeju <- read.csv('출발지-도착지.csv', header = T)
jejufull <- read.csv('bus_bts12.csv', header = T)


head(jeju)
tail(jeju)

#
# 승차 일별 버스 이용량 분석데이터
head(jejufull)
tail(jejufull)

par(mfrow = c(1,1))

oopp <- jejufull %>% filter(jeju$날짜 == '2019-09-07')
jeju_mmdd <- jejufull %>% select('날짜')
jeju_mmdd_1 <- table(jeju_mmdd)

jejutest <- c(32355,58679,63338,56510,65622,58962,23717,25811,3569,8376,64187,31542,18158,394,
              4035,65689,67395,65104,57919,8074,27432,783,12236,64782,57778,8093,55065,5228,30370,7372)
names(jejutest) <- c('0901','0902','0903','0904','0905','0906','0907','0908','0909','0910',
                     '0911','0912','0913','0914','0915','0916','0917','0918','0919','0920',
                     '0921','0922','0923','0924','0925','0926','0927','0928','0929','0930')

test1_7 <- jejutest[c(1:7)]
test8_14 <- jejutest[c(8:14)]
test15_21 <- jejutest[c(15:21)]
test22_30 <- jejutest[c(22:30)]

jeju_mmdd1 <- jeju_mmdd %>% filter('2019-09-01')

table(jeju_mmdd)

par(mfrow = c(2,2))

barplot(test1_7, main = "9월 1일 ~ 9월 7일 승차인원", las = 1,
        col = 2:8 , names.arg = c('일','월','화','수','목','금','토'), xlab = ' ' ,  border = 'black')

barplot(test8_14, main = "9월 8일 ~ 9월 14일 승차인원", las = 1,
        col = 2:8 , names.arg = c('일','월','화','수','목','금','토'), xlab = ' ', border = 'black')

barplot(test15_21, main = "9월 15일 ~ 9월 21일 승차인원", las = 1,
        col = 2:8 , names.arg = c('일','월','화','수','목','금','토'), xlab = ' ', border = 'black')

barplot(test22_30, main = "9월 22일 ~ 9월 30일 승차인원", las = 1,
        col = 2:8 , names.arg = c('일','월','화','수','목','금','토','일','월'), xlab = ' ', border = 'black')


# Test, names.arg = c('일','월','화','수','목','금','토')
# 하차 모든데이터

# oopp1 <- jeju %>% filter(jeju$하차날짜== '2019-09-07')
jeju_mmdd1 <- jeju %>% select('하차날짜')
jeju_mmdd_2 <- table(jeju_mmdd1)

as <- (jejutest - jejutest1)
sum(as)

jejutest1 <- c(22155,35169,38285,33012,40133,36423,16011,17600,3088,5042,38653,21541,12593,274,2700,40182,
               41173,39965,35688,4940,17838,493,7560,39519,34997,4753,34359,3531,20704,4349)
names(jejutest1) <- c('0901','0902','0903','0904','0905','0906','0907','0908','0909','0910',
                     '0911','0912','0913','0914','0915','0916','0917','0918','0919','0920',
                     '0921','0922','0923','0924','0925','0926','0927','0928','0929','0930')

qtest1_7 <- jejutest1[c(1:7)]
qtest8_14 <- jejutest1[c(8:14)]
qtest15_21 <- jejutest1[c(15:21)]
qtest22_30 <- jejutest1[c(22:30)]


par(mfrow = c(2,2))

barplot(qtest1_7, main = "9월 1일 ~ 9월 7일 하차인원", las = 1,
        col = 2:8 , names.arg = c('일','월','화','수','목','금','토'), xlab = ' ' ,  border = 'black')

barplot(qtest8_14, main = "9월 8일 ~ 9월 14일 하차인원", las = 1,
        col = 2:8 , names.arg = c('일','월','화','수','목','금','토'), xlab = ' ', border = 'black')

barplot(qtest15_21, main = "9월 15일 ~ 9월 21일 하차인원", las = 1,
        col = 2:8 , names.arg = c('일','월','화','수','목','금','토'), xlab = ' ', border = 'black')

barplot(qtest22_30, main = "9월 22일 ~ 9월 30일 하차인원", las = 1,
        col = 2:8 , names.arg = c('일','월','화','수','목','금','토','일','월'), xlab = ' ', border = 'black')






#
jejusort <- sort(jejutest)

barplot(jejusort, main = "일별 버스이용량 분석", las = 1,
        col = 2:6)
legend('topleft', legend = row.names(test), fill = 2:8, cex = 0.65)

##########

str(jeju_mmdd_1)
tail(oopp)
#
#

top <- jeju %>% select('출발지')
ha <- jeju %>% select('도착지')
top.ha <- jeju %>% select('출발지','도착지')

str(ha)
head(top,20)
tail(top)
head(ha)
tail(ha)
head(top.ha)
tail(top.ha)
str(top.ha)



library(ggplot2)



asq <- table(top)
ha.1 <- table(ha)

asq.1 <- sort(asq, decreasing = T)
qq1 <- sort(ha.1,decreasing = T)

asq1 <- head(asq.1,10)
asq2 <- head(qq1,10)
asq0<- t(asq1)


point1 <- as.integer(asq1)
point2 <- as.integer(asq2)
point1
point2

barplot(asq1)

par(mfrow = c(1,2))
barplot(asq1,
        main = '제주도 버스탑승지 TOP 10',
        col = 2:6, las = 1)
legend('topright', legend = row.names(asq1), fill = 2:6, cex = 0.65)
barplot(asq2, 
        main = '제주도 버스하차지 TOP 10',
        col = 2:6, las = 1)
legend('topright', legend = row.names(asq2), fill = 2:6, cex = 0.65)








cor(mtcars      )
pairs(mtcars    )







