#
#
# 임영택 20191129/20191202
#
#

# 1set
gender <- matrix(c(10,21,40,60,60,70,20,30),4,2) # 매트릭스함수 선언

colnames(gender) <- c("male","female") # 열 이름을 Male / Female 입력

gender[2,] # 2행에 있는 값 출력

gender[,"female"] # female 값 출력

gender[3,2] # 3행 2열 출력력


# 2set


st <- data.frame(state.x77) # Dataframe으로 선언
st # 내용출력


class(st) # 확인용
dim(st) # 확인용
str(st) # 확인용
head(st) # 확인용
tail(st) # 확인용


rownames(st) # 행 이름 보여주기
colnames(st) # 열 이름 보여주기

dim(st) # 행 , 열

str(st) # 요 약
# 8번 문제 행별 합계 / 평균
apply(st, 1, sum) ; apply(st,1, mean) 
apply(st,2,sum) ; apply(st, 2, mean) 

# 9번 문제
st1 <- subset( st ["Florida", ] ); st1

# 10번  50개주 Income만 출력
st2 <-  subset( st ["Income"] ); st2 

# 11번 Texas주 Area만 출력
st3 <- subset( st ["Texas",], 
               select = Area) ; st3 

#12번 문제 Ohio주의 인구 와 수입 만 출력
st4 <- subset( st['Ohio',],
               select = c(Population,Income) ) ; st4 

# 13번 문제
st5 <- subset(st,
              select = c(Population),
              subset = c(Population) > 5000) ; st5  
# 14번 문제
st6 <- subset(st,
              select = c(Population,Income,Area) ,
              subset = c(Income)>= 4500); st6

# 15번 문제
st7 <- subset(st,
              subset = c(Income)>= 4500) 
dim(st7)

# 16번 문제
st8 <- subset(st,
              subset = c(Area)>=100000 & c(Frost) >= 120); st8 


# 17 번 문제
st9 <- subset(st,
              subset = c(Population) <2000 | c(Murder) < 12); st9 


# 18번 문제
st10 <- subset(st,
              select = c(Income)  ,
               subset = c(Illiteracy) >= 2.0) 
mean(st10[,1])

# 19번 문제
st11 <- subset(st,
              select = c(Income),
              subset = c(Illiteracy) < 2.0)
st11_1 <- subset(st,
                 select = c(Income),
                 subset = c(Illiteracy) >= 2.0)

apply(st11,2,mean) - apply(st11_1,2,mean)

# 20번 문제
st12 <- subset(st,
               select = c(Life.Exp),
               subset = c(Life.Exp) >= max(Life.Exp) ); st12

# 21번 문제
st13 <- st[c("Pennsylvania"),c("Income")]
st13

st13_1 <- subset(st,
                 subset = c(Income) > st13); st13_1


# 3set


# 1번 문제

class(mtcars)

# 2번 문제

car <- data.frame(mtcars)
attach(car)

nrow(car) # 이름들 갯수(행)
ncol(car) # 이름들 갯수(열)


# 3번 문제

str(car)

# 4번 문제

car1 <- subset(car,
             # select = mpg, (mpg 만 출력하고 싶을때 적음.)
              subset = mpg >= max(mpg)); car1 

# 5번 문제


car2_1 <- subset(car,
              subset =  gear == 4) ; car2_1

car2_2 <- min(car2_1[,'mpg'])
car2_2

car2_3 <- subset(car,
                 subset = ( c(mpg) <= car2_2 & gear == 4 )); car2_3

#car2_4 <- subset(car,
#                 subset = ( c(mpg) <= min(car[,'mpg']) & gear == 4 )); car2_4
# min 함수로 하면 값이없다고 뜸.


# 6번 문제

car[c("Honda Civic"),c('mpg','gear') ]


# 7번 문제

firempg <- car[c("Pontiac Firebird"),c('mpg')]
firempg

car3 <- subset(car,
               subset = firempg < c(mpg)); car3
# 8번 문제

cat("자동차들의 평균 연비는", 
    mean(car[,1]),"입니다.")

# 9번 문제

unique(car[,c('gear')])




















