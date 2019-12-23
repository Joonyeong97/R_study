#
#
#
# 15일차 문제
# 임영택 20191217
#
#

#문1)
#trees 데이터셋에 대해 다음의 문제를 해결하는 R 코드를 작성하시오.

#(1) 나무 둘레(Girth)와 나무의 키(Height)로 나무의 볼륨을 예측하는 다중선형 회귀
#모델을 만드시오.

#(2) 다중선형 회귀모델을 이용하여 trees 데이터셋의 나무 둘레(Girth)와 나무의 키
#(Height)로 나무의 볼륨을 예측하시오.

#(3) (2)에서 예측한 볼륨과 실제 trees 데이터셋의 볼륨(Volume)이 얼마나 차이가
#나는지 보이시오. (예측값, 실제값, 예측값-실제값을 나타낸다.)


tr <- trees
library(tidyverse)
library(MASS)

head(tr)
tail(tr)
plot(tr)

trmodel <- lm(Volume~. , data = tr)
trmodel


a <- predict(trmodel)
a
tr

b <- a - tr
b

#문2)
#mtcars 데이터셋에서 다른 변수들을 이용하여 연비(mpg)를 예측하는 다중 회귀모델을 만드시오.

#(1) 전체 변수를 이용하여 연비(mpg)를 예측하는 회귀모델을 만들고 회귀식을 나타
#내시오.

#(2) 연비(mpg)를 예측하는 데 도움이 되는 변수들만 사용하여 예측하는 회귀모델을
#만들고 회귀식을 나타내시오.

#(3) (1), (2)에서 만든 예측모델의 설명력(Adjusted R-squared)을 비교하시오.

mt <- mtcars
head(mt)

mtmpg <- lm(mpg~. , data = mt)
mtmpg

trmpg <- stepAIC(mtmpg)
plot(trmpg)

summary(mtmpg) # 안걸러진 데이터
summary(trmpg) # 걸러진 데이터

# 설명력이 0.03 더 높음

#문3) 
#UCLA 대학원의 입학 데이터를 불러와서 mydata에 저장한 후 다음 물음에 답하시오.

#mydata <- read.csv( "https://stats.idre.ucla.edu/stat/data/binary.csv" )

#(1) gre, gpa, rank를 이용해 합격 여부(admit)를 예측하는 로지스틱 모델을 만드시오(0: 불합격, 1:합격).

#(2) mydata에서 합격 여부(admit)를 제외한 데이터를 예측 대상 데이터로 하여 (1)에서 만든 모델에 입력하여 
#합격 여부를 예측하고 실제값과 예측값을 나타내시오.

#(3) 만들어진 모델의 예측 정확도를 나타내시오.


mydata <- read.csv( "https://stats.idre.ucla.edu/stat/data/binary.csv" )
head(mydata)

mydataz <- mydata[,-1]

mydata1 <- glm(admit~. , data = mydata)
mydata1
summary(mydata1)


test <- data.frame(rbind(c(753,3.2,2)))
test
names(test) <- names(mydata)[2:4]
test


t1 <- predict(mydata1, test)
t1 <- round(t1,0)
t1

# 정확도
tt <- predict(mydata1, mydataz)
tt <- round(tt, 0)
tt

t1 == tt
acc <- mean(t1 == tt)
acc


t2 <- predict(mydata1, mydataz)
t2 <- round(t2,0)

acc2 <- mean(mydata$admit == tt)
acc2

