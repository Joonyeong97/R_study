

#
# break / next
#
#
sum <- 0

for ( i  in 1:10 ) {
  sum <- sum + 1
  if (i >= 5 ) {
    cat(sum)
    break
  }
}


sum <- 0

for ( i in 1 : 10) {
  if ( i %% 2 == 0 ) {
    next
  }
  sum <- sum + 1
}
sum


#
# 산술 내장 함수
#

log( 10 ) +5      # Log함수
log( 10, base = 2 )
sqrt(25)          # 제곱근근
max(5,3,2)        # 가장 큰 수
min(3,9,2)        # 가장 작은 수
abs(-10)          # 절대값
factorial(5)      # 팩토리얼
sin(pi/2)         # 삼각 함수


#
# 사용자 정의 함수
#

mymax <- function(x, y){
  num.max <- x
if (y > num.max) {
  num.max <- y

}
  return( num.max )
}
mymax(10,15)
a <- 10
b <- 5
c <- 8
max <- mymax(a,b)
max <- mymax(max,c)
max

mymax(a,b)




# 사용자 정의 함수 매개변수 초기값 설정
 mydiv <- function(x,y = 2) {
   result <- x / y
   
   return( result )
 }

mydiv(x = 10, y=3)
mydiv(10,3)
mydiv(10)



# 외부 파일에 있는 함수 호출
setwd("D:/workR")     # 경로 지정
source("mylib.R")     # Lib 파일 지정

my_max(10,5)
my_div(10)


#
# Vector 도입
#
a <- 10
b <- 5
c <- 8
d <- 15
e <- 22
f <- 18
g <- 19
h <- 32
i <- 28
j <- 65
k <- 75


max <- a
if (b>max) { max <- b }
if (c>max) { max <- c }
if (d>max) { max <- d }
if (e>max) { max <- e }
if (f>max) { max <- f }
if (g>max) { max <- g }
if (h>max) { max <- h }
if (i>max) { max <- i }
if (j>max) { max <- j }
if (k>max) { max <- k }
max


#
# Vector 사용
#

v <- c(10,5,8,7,15,56,213,45,98,102)
max <- v[1]
for ( i in 2:length(v) ) {

  if (v [i] > max) {
    max <- v[i]
  }
}
max

# vector 생성
x <- c(1,2,3)
y <- c("a","b","c")
z <- c(TRUE,TRUE,FALSE,TRUE)
x;y;z

class(x); class(y);class(z)



w <- c(1,2,3,"a")
w
class(w)


v1 <- 0.1; v1
v2 <- c(1:3,50:90) ; v2
class(v1);class(v2)


v3 <- seq(1,101,3); v3
v4 <- seq(0.1,1.0,0.1); v4

v5 <- rep(1, times = 5); v5
v6 <- rep(1:5, times = 3); v6
v7 <- rep(c(1,5,9), times=3); v7


# 벡터 원소값에 이름 지정
score <- c(90,85,70); score
names(score)    # 이름 지정 함수
names(score) <- c("Lim","Yeong","Taeck")
names(score)
score


# vector 원 소 접 근
score[1]
score[2]
score[3]
score["Lim"]
score["Yeong"]
score["Taeck"]

d <- c(1,4,3,7,8)
d[1]; d[2]; d[3]; d[4]; d[5]; d[6]


score



for ( i  in 1:length( score )) {
  print(score[i])  
}


score_names <- c("Lim","Yeong","Taeck")
for (i in 1:length(score)) {
  print(score[score_names[i] ])
}





# 벡터에서 여러 개의 값을 한번에 추출
d <- c(1,4,3,7,8) # 벡터
d[c(1,3,5)]       # 첫번째 숫자 세번째 숫자 다섯번째 숫자 출력
d[1:3]            # 1~3번째 숫자까지 출력
d[seq(1,5,2)]     # 1~5번째 숫자까지 2개씩 건너서 출력
d[-2]             # 두번째 배열 삭제
d[-c(3:5)]        # 3~5번째 배열 삭제
d



GNP <- c(2090,2450,960); GNP
names(GNP) <- c("Korea","Japan","Nepal"); GNP
GNP[1]
GNP["Korea"]
GNP[c("Korea","Nepal")]



# Vector 요소값 변경 
v1 <- c(1,5,7,8,9); v1
v1[2] <-3; v1
v1[ c(1,5)] <- c(10,20); v1


# Vector 간 연산 단! 인덱스간 길이가 같아야됨.
x <- c(1,2,3)
y <- c(4,5,6)
x+y
x*y
z <- x+y
z


# Vector 에 적용가능한 함수
d <- c(1,2,3,4,5,6,7,8,9,10)
sum(d) # 합계
sum(2*d)
length(d) # 벡터의 요소 개수(길이)
mean(d[1:5]) # 평균
mean(d)
median(d[1:5]) # 중앙값
median(d)
max(d) # 최대값
min(d) # 최소값
sort(d) # 정렬
sort(d, decreasing = FALSE)
sort(d, decreasing = TRUE)
range(d) # 값의 범위
var(d) # 분산
sd(d) # 표준 편차
rank(d) # 순위
order(d) # 색인



v <- sum(d) / length(d); v


# 벡터에 논리연산 적용
d <- c(1,2,3,4,5,6,7,8,9,10)
d>5 # 논리적으로 TRUE OR FALSE 판단해라
d[d>5] # 배열안에 5보다 큰수를 찾아라
sum(d>5) # d 안에있는 배열중에 5보다 작은수(True수) 더해라
sum(d[d>5]) # d 안에있는 d배열중에서 5보다 큰수를 더해라
d==5 # 논리적으로 d 안에있는 배열중에 5랑 같은수가 있는가?

cond <- d > 5 & d < 8; cond
d[cond]

all(d>5) # d에있는 배열이 전부다 5보다 크냐?
any(d>5) # d에있는 배열안에 5보다 큰수가 있느냐?


head(d) # 지정안하면 처음부터 6개 출력
tail(d) # 지정안하면 끝부터 6개 출력
head(d,3) # 처음부터 배열 3번째까지 출력
tail(d,3) # 끝에서 배열 3번째까지 역순으로 출력

x <- c(1,2,3)
y <- c(3,4,5)
z <- c(3,1,2)

w <- c(x,y); w

union(x,y)      # 합 집합
intersect(x,y)  # 교 집합
setdiff(x,y)    # 차 집합
setequal(x,y)   # x, y에 동일한 요소가 있는지?
setequal(x,z)   # x, z에 동일한 요소가 있는지?


# List
ds <- c(90,85,70,84)
my.info <- list(name = 'Hong', age = 30, status = TRUE,
score = ds)

my.info
my.info[1] # 키값과 밸류값 같이 표현
my.info[[1]] # 키값 안에 밸류값만 표현
my.info$name  # ex) $name 은 name(key) 안에 밸류값을 표현
my.info[[4]]
my.info[[4]][1]



# Factor 형
bt <- c('A','B','B','O','AB','A')
bt.new <- factor(bt)
bt # 문자형 자료 6개 출력
bt.new  # 팩터 함수사용
bt[5] # 백터형 5번째 단어 출력
bt.new[5] # 팩터형 5번째 단어 출력
levels(bt.new) # 팩터형 함수안에 값의 범위
as.integer(bt.new) # as.* 은 함수안의 정의를 변경.
bt.new[7] <- 'B' # B 는 현재 선언된 함수에 포함되어있으니 가능
bt.new[8] <- 'C' # C 는 현재 선언된 함수에 미포함 대신 NA가 입력
bt.new




d <- c(50:99)

d[d>60]

sum(d<=60)




































