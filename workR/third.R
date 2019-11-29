#
# 4 일차
#
#
# 함수 반환값 (return값)이 여러 개 일때의 처리법

myfunc <- function(x,y) {
  val.sum <- x+y
  val.mul <- x*y
  
  return( list(sum=val.sum, mul = val.mul))

}


result <- myfunc(5,8)
s <- result$sum
m <- result$mul
cat( '5 + 8 = ', s, '\n')
cat( '5 * 8 = ', m, '\n')



# Matrix 생성 열 우선으로 값이 채워짐
z <- matrix(1:20, nrow = 4)       # 행 4개 (관측치 4개)
z


z <- matrix(1:20, ncol = 4)       # 열 4개 (변수,특성 4개)
z


z <- matrix( 1:20, nrow = 4 , ncol = 5) # 행 4개, 열 5개
z


z <- matrix(1:20, nrow = 4, ncol = 5, byrow = T) # 행우선으로 먼저 채움
z

x <- 1:4
x

y <- 5:8
y

z <- matrix(1:20, nrow = 4, ncol = 5)
z

m1 <- cbind(x,y) # x,y가 열로 진행
m1
m2 <- rbind(x,y) # x,y가 행으로 진행
m2
m3 <- rbind(m2,x) # m2 함수 출력후 , x 출력
m3
m4 <- cbind(z,x) # z 매트릭스 함수 출력후 , x 출력
m4




# Matrix 에서 Cell의 값 추출
z

z[2,3]
z[1,4]

z

z[2,] # 2행에 있는 소스 다
z[,4] # 4열에 있는 소스 다


z[2,1:3]
z[1,c(1,2,4)]
z[1:2,]
z[, c(1,4)]


# Matrix 에서 행/열에 이름 지정
score <- matrix( c(90,85,69,78,
                   85,96,49,95,
                   90,80,70,70),
                 nrow = 4, ncol = 3 )

score
rownames(score) <- c("Hong","Kim","Lee","Yoo")
colnames(score) <- c("English","Math","Science")
score

score['Hong','Math']
score['Kim', c('Math','Science') ]
score['Lee',]
score[ , 'English']
rownames(score)
colnames(score)
colnames(score)[2]


# Data Frame 생성
city <- c("Seoul","Tokyo", "Washington")
rank <- c(1,3,2)
city.info <- data.frame(city, rank)
city.info

name <- c("Hong","Kim","Lee")
age <- c(22,20,25)
gender <-  factor(c("M","F","M") )
blood.type <-  factor(c("A","O","B") )
person.info <- data.frame(name,age,gender,blood.type)
person.info

length(name)
length(age)
length(gender)
length(blood.type)


person2.info <- data.frame( name2 = c ("Hong","Kim","Lee") ,
                            age2 = c (22,20,25) ,
                            gender2 =  factor(c("M","F","M") ) ,
                            blood.type2 =  factor(c("A","O","B") ) )
person2.info



city.info[1,1]
city.info[1,]
city.info[,1]
city.info[city.info$city, ]
city.info[, "rank"]


person.info$name
person.info[person.info$name == "Hong", ]
person.info[person.info$name == "Hong", c("name","age")]




iris[ , c(1:2)]
iris[ , c(1,3,5)]
iris[ , c("Sepal.Length","Species")]
iris[1:5,] ;    iris[1:5, c(1,3)]

# data()

# iris

# mtcars

# state.x77

# 데이터셋에 미리 적용된 함수들


# Matrix와 Data Frame에서 사용하는 함수
person.info

dim(person.info)
nrow(m3) # 행의갯수
nrow(person.info)
ncol(m3) # 열의갯수
head(iris) # 앞에서 6개
tail(iris) # 뒤에서 6개개
str(iris) # 정보
str(city.info)
str(person.info)

iris[, 5]
unique(iris[, 5]) # 5번째부터의 열안에 종류를 하나씩 표기

table( iris[, "Species"]) # iris 안에있는 열중에 Species 파악 단, 팩터함수만 가능

table(person.info[ , "blood.type"])

table(person.info[ , "gender"]) # person.info 안에 gender 파악 단, 팩터함수만 가능



# Matrix / Data Frame 사용 함수
# 행별/ 열별 합계와 평균 계산
str(iris)
colSums(iris[, -5]);          apply(iris[, 1:4], 2, sum) # 열마다 계산
colMeans(iris[,-5]);          apply(iris[, 1:4], 2, mean) # 열마다 계산
rowSums(iris[,-5]);           apply(iris[, -5], 1, sum) # 행 마다 계산  -5 는 5번째 열(변수)제거후 계산
rowMeans(iris[,-5]);          apply(iris[, -5], 1, mean) # 행 마다 계산

# 행 / 열 방향 전환
z <- matrix(1:20 , nrow = 4, ncol = 5) ; z
t(z) # 전치 함수 t

# 조건에 맞는 행과 열의 값 추출(Data Frame만 가능)
IR.1 <- subset(iris, Species == "setosa"); IR.1
IR.2 <- subset(iris, Sepal.Length > 5.0 & Sepal.Width > 4.0); IR.2
IR.2[, c(2,4)]


# Matrix/Data Frame 산술연산


a <- matrix(1:20 , 4,5) ; a
b <- matrix(21:40 , 4,5); b

2*a
b-5
2*a+3*b

a+b
b-a
b/a
a*b











































