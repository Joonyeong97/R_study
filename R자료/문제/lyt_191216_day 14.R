#
# 14일차 회귀식 문제
#
#
#
#
#
#
#
#

#문1)
#state.x77 데이터셋에서 문맹률(Illiteracy)을 이용해 범죄율(Murder)을 예측
#하는 단순선형 회귀모델을 만드시오. 그리고 문맹률이 0.5, 1.0, 1.5일 때 범
#죄율을 예측하여 보시오.

st <- data.frame(state.x77)
str(st)
head(st)
plot(Murder~Illiteracy, data = st)
gz <- lm(Murder~Illiteracy, data = st)
abline(gz)
plot(gz)

munmang <- data.frame(Illiteracy = c(0.5,1.0,1.5))

mmpr <- predict(gz, munmang)
plot(munmang$Illiteracy , mmpr, col = 'red' ,
     cex = 2, pch = 20)
abline(gz)


#문2)
#trees 데이터셋에서 나무둘레(Girth)로 나무의 볼륨(Volume)을 예측하는 단
#선형 회귀모델을 만드시오. 그리고 나무 둘레가 8.5, 9.0, 9.5일 때, 나무의
#볼륨(Volume)을 예측하여 보시오.

tr <- data.frame(trees)
str(tr)
head(tr)

plot(tr$Girth,tr$Volume)
trgz <- lm(Volume~Girth , data = tr)
abline(trgz)

gi <- data.frame(Girth = c(8.5,9.0,9.5))

gigz <- predict(trgz,gi)

plot(gi$Girth, gigz, col = 'red',
     cex = 2, pch = 20)
abline(trgz)

#문3) 
#pressure 데이터셋에서 온도(temperature)로 기압(pressure)을 예측하는 
# 단순선형 회귀모델을 만드시오. 그리고 온도가 65, 95, 155일 때 기압을 예측
#하여 보시오.

pr <- data.frame(pressure)
str(pr)
head(pr)

plot(pr$temperature,pr$pressure)
pr2 <- lm(pressure~temperature , data = pr)
abline(pr2)

prgz <- data.frame(temperature = c(65,95,155))

prgz2 <- predict(pr2,prgz)

plot(prgz$temperature, prgz2, col = 'red',
     cex = 2, pch = 20)
abline(pr2)












































