#
#
# 5일차
#

setwd("D:/lyt/lyt09/workR")
df <- read.table("airquality.txt", header = T)
df
class(df)
dim(df)
str(df)
head(df,3)
tail(df,3)



install.packages("xlsx")
install.packages("rJava")


library(rJava)
library(xlsx)


setwd("D:/lyt/lyt09/workR")
df.xlsx <- read.xlsx(file = "airquality.xlsx", sheetIndex = 1,
                     encoding = "UTF-8")

df.xlsx
class(df.xlsx)
str(df.xlsx)
head(df.xlsx)
tail(df.xlsx)
attach(df)
as.integer(Ozone)


score <- c(76,84,69,50,95,6,82,71,88,84)
which(score == 69) # 이데이터가 몇번째 위치에있는지 (Index)
which(score >= 85)
max(score)
which.max(score)
min(score)
which.min(score)


id <- which(score>=60)
score[id] <- 61
score

idx <- which(iris [ , 1:4] > 5.0, arr.ind = T)
idx


#
#
#
# 단일 변수 (일변량) 범주형 자료 탐석
#
#


favorite <- c('WINTER', 'SUMMER', 'SPRING',
              'SUMMER', 'SUMMER', 'FALL',
              'FALL', 'SUMMER', 'SPRING', 'SPRING')
favorite
class(favorite)
table(favorite)
table(favorite) / length(favorite)
ds <- table(favorite)
ds
barplot(ds, main = 'favorite season')




ds.new <- ds[c(2,3,1,4)]

ds.new
barplot(ds.new, main = 'Favorit season')



pie(ds,main = 'Favorit season')
pie(ds.new, main = '좋아하는 날씨')



favorite.color <- c(2,3,2,1,1,2,2,1,3,2,1,3,2,1,2)

ds <- table(favorite.color)
barplot(ds, main = 'favorite season')
colors <- c('Green', 'Red', 'blue')
names(ds) <- colors;   ds

barplot(ds, main = 'favorite season', col = colors)
pie(ds, main = 'favorite season', col = colors)



#
#
# 단일변수 (일변량) 연속형 자료 탐색
#
#

weight <- c(60,62,64,65,68,69); weight
weight.heavy <- c(weight, 120); weight.heavy


library(rJava)
library(xlsx)
library(xlsxjars)

# 평균값
mean(weight); mean(weight.heavy)
# 중앙값
median(weight); median(weight.heavy)
# 절사평균
mean(weight, trim = 0.2) # 하위 20% 제거
mean(weight.heavy, trim = 0.2) # 상위 20% 제거


names(weight) <-c('z','zz','aa','ss','dd','df' )
barplot(weight,main = 'test',col = colors)


# 사분위수 
# 1사분위 : 25%
# 2사분위 : 50%
# 3사분위 : 75%
quantile( weight.heavy )
quantile( weight.heavy, (0:10) / 10 )

summary(weight.heavy) # 제일 많이 쓰는 함수


# # # # 산포 # # # #
# 분산
var(weight)

# 표준편차
sd(weight)

# 값의 범위 (최소값과 최대값)
range(weight)

# 최대값과 최소값의 차이
diff(range (weight))

summary(weight)


# histogram : 연속형 자료의 분포를 시각화
# 연속형 자료에서는 구간을 나누고 구간에 속한 값들의 개수를 세는 방법으로 사용


str(cars)
dist <- cars[,2]
hist(dist,main = "Histogram for 제동거리",
     xlab = "제동거리", ylab = "빈도수",
     border = "blue", col = 'green',
     las =1 , breaks = 5)


# 상자그림 (boxplot, 상자수염 그림)
# 사분위수를 시각화하여 그래프 형태로 표시
# 상자그림은 하나의 그래프로 데이터의 분포형태를 포함한 다양한 정보를전달
# 자료의 전반적인 분포를 이해하는데 도움
# 구체적인 최소/최대/중앙/값을 알기는 어렵다.

boxplot(dist, main= '자동차 제동거리', las=1,
         ylab = "빈도수")



boxplot.stats(dist)
boxplot.stats(dist)$stats # 정상범위 사분위수
boxplot.stats(dist)$n     # 관측치 개수
boxplot.stats(dist)$conf  # 중앙값 신뢰구간
boxplot.stats(dist)$out   # 이상치(특이값)


# 일변량중 그룹으로 구성된 자료의 상자그림
boxplot(Petal.Length~Species,
        data = iris, 
        main = '품종별 꽃잎의 길이',
        las=1)

boxplot(iris$Petal.Length~iris$Species,
        main = '품종별 꽃잎의 길이',
        xlab = "꽃의 종류", ylab = "꽃의 길이")

# 한 화면에 여러 그래프를 그리는 방법
par(mfrow = c(1,3)) # 1 X 3 가상화면 분할
barplot(table(mtcars$carb), main = "c",
        xlab = "carburetors", ylab = 'freq',
        col = "blue", las=1)

barplot(table(mtcars$cyl), main = "cyl",
        xlab = "cyl", ylab = 'freq',
        col = "red", las=1)

barplot(table(mtcars$gear), main = "g",
        xlab = "gear", ylab = 'freq',
        col = "green", las=1)
par(mfrow = c(1,1))



















































