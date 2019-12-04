#
#
#
# 2015~2018년도 제주도 교통사고 사망자 상관관계 분석
#
#
#
#

setwd("D:/lyt/lyt09/분석자료")
accident <- read.csv('2015_2018_traffic_accident_death1.csv', header = T)

class(accident)
dim(accident)
str(accident)
head(accident)
tail(accident)


accjuya <- table(accident[,3])

accbupgyu <- table(accident[,'법규위반'])


barplot(accjuya,accbupgyu , main = '법규 위반과 사망자수 상관관계') # 틀린문제임.























































