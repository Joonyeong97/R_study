#
# 5일차 문제 해결

#

# 문제 1
gender <- c('F','F','F','M','M','F','F','F','M','M')

gender2 <- table(gender)
gender2

barplot(gender2, main = "남녀 성별 갯수파악")

pie(gender2, main = "남녀 성별 갯수 파악")

# 문제 2

season <- c('여름','겨울','봄','가을','여름','가을','겨울',
            '여름', '여름', '가을')

season <- table(season)
season

barplot(season, main = '계절 빈도'
        , las =1)

pie(season , main = "계절 빈도수")


# 문제 3

score <- c(90,85,73,80,85,65,78,50,68,110)
names(score) <- c ('KOR','ENG','ATH','HIST','SOC','MUSIC','BIO',
                 'EARTH','PHY','ART')
score


mean(score) # 평균값
median(score) # 중간값
sd(score) # 표준편차
max(score) # MAX값
names(score[score == max(score)])

boxplot(score, main = '점수표',
        las = 1, xlab = '과목', ylab = '점수')


summary(score)

hist(score, main = '학생 성적', 
     col = 'violet', xlab = '점수표', ylab = '비율',
     las = 1)

#문제 4번

mt2 <- mtcars[,'wt']
mtcars


mean(mt2) # 평균값
median(mt2) # 중앙값
mean(mt2,trim = 0.15) # 절사평균값 15%
sd(mt2) # 표준편차

summary(mt2) # summary 값

cyl2 <- table(mtcars$cyl)
barplot(cyl2, main = '각 실린더의 도수분포표', las = 1,
        xlab = 'x 개의 실린더')


hist(mt2, main = '중량', las = 1)


# 6번문제
par(mfrow = c(1,1)) # 화면분할
boxplot(mt2, main = 'mtcars 중량표', las=1,
        xlab = '중량')
boxplot.stats(mt2)


# 7번문제
disp2 <- mtcars[,'disp']
disp2


par(mfrow = c(1,1)) # 화면분할

boxplot(disp2, main = 'mtcars의 배기량', las=1,
        xlab = '배기량')
boxplot.stats(disp2)


# 8번 문제

gear1 <- mtcars$gear
table(gear1)

par(mfrow = c(1,1)) # 화면분할


# 4 단이좋음
summary(mtcars$mpg)
summary(mtcars$mpg[mtcars$gear ==3])
summary(mtcars$mpg[mtcars$gear ==4])
summary(mtcars$mpg[mtcars$gear ==5])



















