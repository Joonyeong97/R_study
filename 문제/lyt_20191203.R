#
#
#
# 데이터 분석 
# 임영택 20191203
#
#
#
# 데이터 파악시 기본적으로 해봐야할것
# cor() 함수사용해서 상관관계 분석
# pairs(변수[,]) 다중 삼전도를 통해서 상관관계 분석!!
# plot() 함수로 산점도를 표시
# abline() 으로 회귀선을 표에 표시
# 

# 상관분석 순서
# 
# 1. 상관분석 대상 변수 선정
# 2. 산점도 작성 (관측값 분포 확인) : plot()
# 3. 회귀식 도출 : lm()
#   (회귀식 : 두 변수의 선형관계를 가장 잘나타낼수있는 선의식)
#    (y = xw + b)
# 4. 회귀선을 산점도에 표시 : abline()
#    회귀선 : 관측값들의 추세를 가장 잘 나타낼 수 있는 선
# 5. 상관계수 계산 : cor()
# 6. 상관분석 결과 해석



## 문제 1번
sq <- c(121,99,41,35,40,29,35,24,50,60)
tc <- c(19,20,16,16,18,12,14,12,16,17)

gg <- data.frame(sq,tc)
colnames(gg) <- c('수입','교육기간')



cor(gg) # 상관 관계 파악
plot(gg, main = '교육기간과 수입의 상관관계', las = 1,
     pch = 19 , col = 'red')

#  교육기간이 늘어날수록 수입이 증가



## 문제 2번


sj <- c(77.5,60,50,95,55,85,72.5,80,92.5,87.5)
sc <- c(14,10,20,7,25,9,15,13,4,21)

stu <- data.frame(sj,sc)
colnames(stu) <- c('성적','시청시간')
stu


cor(stu)
plot(stu, main = '한주당 TV 시청시간과 성적의 상관 관계', las = 1,
     pch = 19 , col = 'red')
#  TV시청이 늘어날수록 성적이 떨어지는 결과


## 문제 3번

cor(mtcars)
pairs(mtcars[,c(-2,-7:-11)])

fact <- mtcars[,c(-2,-7:-11)]
fact2 <- mtcars[,c('mpg','wt')]
cor(fact2)

plot(fact2, main = '연비와 중량의 상관관계', las = 1,
     pch = 19 , col = 'red')
# 중량이 높을수록 연비가 안좋다는것을 상관관계로
# 알수있습니다. 상관계수는 -0.86 입니다.

# 문제 4번

year <- c(2015,2016,2017,2018,2019,2020,2021,2022,
          2023,2024,2025,2026)

per <- c(51014,51245,51446,51635,51811,51973,52123,
         52261,52388,52504,52609,52704)


plot(year,per, main = '예상인구수 추계자료',
     type = 'l', lty = 1, lwd = 1 , las = 1,
     xlab = '연도', ylab = '총인구수(천명')

# 연도별로 예상인구가 증가하는것을 알수있습니다.

# lwd = 선의 두께
# lty = 선의 타입 (점선이냐 실선이냐)
# type = 선의 모양

## 문제 5번
trees


### 산점도
plot(trees$Height~trees$Girth,
     data = trees,
     main = '나무의 지름과 높이의 상관관계',
     las = 1 , xlab = '지름', ylab = '높이',
     pch = 19, col = 'red')

tree_1 <- trees[,c('Height','Girth')]
tree1 <- lm(trees$Height~trees$Girth)
abline(tree1)



### 상관계수
cor(tree_1)


### 5-2번
pairs(trees,
      cex = 1.5, main = "지름과 높이와 무게의 상관관계", pch = 24, bg = "red", horOdd=T,
      cex.labels = 3, font.labels = 4)
cor(trees)


boxplot(tree_1, main = ' 상관관계 ', las = 1)


# cex = 크기
# pch = 점의 모양
# bg = 점의 색상
# cex.labels = 열의 폰트크기
# font.labels = 열의 폰트



