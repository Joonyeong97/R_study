#
# 7일차
#
#
# 결측치 처리
#
#
#

# na.rm = T 이건 NA값 제외후 연산
# na.omit() 이건 NA값 삭제


# vector의 결측치 처리
z <- c(1,2,3,NA,5,NA,8)
sum(z)
is.na(z)
sum(is.na(z))
sum(z, na.rm = T ) # 결측치를 제외한 연산결과


# 결측치 대체 및 제거
z1 <- z
z2 <- c(5,8,1,NA,3,NA,7)

z1[ is.na(z)] <- 0 # 단순 대입법
z1

# Listwise delection
z3 <- as.vector(na.omit(z2))
z3



# Matrix / Data Frame 결측치 처리
x <- iris
x[1,2] <- NA
x[1,3] <- NA
x[2,3] <- NA
x[3,4] <- NA
head(x)


# Matrix/Data.Frame 열별 결측치 확인 
# for문 이용
for (i in 1:ncol(x)) {
  this.na <- is.na(x[,i])
  cat(colnames(x) [i],
      '\t', sum(this.na),
      '\n')
}


# apply() 이용
col_na <- function(y){
  return( sum (is.na (y) ) )
}
na_count <- apply(x,2,col_na)
na_count

na_count1 <- apply(x,2,
        function(y) sum(is.na(y) ) ) # 익명 함수
na_count1


# 결측치(NA) 자료 조합 확인용 시각화 도구 VIM 패키지 설치해야됨.

barplot(na_count[na_count > 0])

# install.packages("VIM")
require(VIM)


aggr(x,prop = FALSE, numbers = T)


# 두개의 변수간의 결측치 관계 확인 시각화 도구
marginplot(x[c('Sepal.Width','Petal.Width')],
           pch = 20,
           col = c('darkgray','red','blue'))



# Matrix/Data Frame의 행(data) 별 결측치 확인

rowSums(is.na(x))                 # 결측치가 포함된 행들 표시
sum( rowSums ( is.na( x ) ) > 0 ) # 결측치가 포함된 행이 몇줄이냐
sum(is.na(x))                     # 결측치가 몇개냐


# 결측치 제외한 새로운 데이터셋 생성
head(x)
x[ !complete.cases(x), ]  # NA가 포함된 행출력
y <- x[ complete.cases(x), ]
head(y)


# 이상치 (outlier)
# 1. 논리적으로 성립되지 않는 값 
# 2. 상식적으로 용인되지 않는값
# boxplot.stats 이걸 쓰든가 summary를 써야됨

# 특이값 , 이상치 (outlier)
st <- data.frame(state.x77)
summary(st$Income)
boxplot(st$Income)
boxplot.stats(st$Income)$out



# 특이값 처리 %in% 이건 포함되어있다면! 
# 데이터 정제!
out.val <- boxplot.stats(st$Income)$out
st$Income[st$Income %in% out.val] <- NA
head(st)
newdata <- st[ complete.cases(st), ]
head(newdata)

boxplot(newdata$Income)

#
#
# 데이터 가공
#
# 데이터 정렬
# Vector 정렬
# 
# sort 는 간단하게 순서 벡터할때
# order는 명확하게 순서 정할때
# split는 내부적으로 같은거끼리 분류할때

v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1)
v1
v2 <- sort(v1, decreasing = T)
v2

# Matrix/ Data frame 정렬

head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),] # Ascending
iris[order(iris$Sepal.Length,decreasing = T), ]
iris.new <- iris[order(iris$Sepal.Length), ]
head(iris.new)
iris[order(iris$Species, decreasing = T,
           iris$Sepal.Length), ] # 정렬기준을 2개설정




# 데이터 분리
sp <- split(iris, iris$Species)
sp
summary(sp)
summary(sp$setosa)
sp$setosa



# 데이터 선택
subset(iris, Species == 'setosa')
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 & Sepal.Width>3.9)
subset(iris, Sepal.Length > 7.6,
       select = c(Petal.Length, Petal.Width))


# 데이터 Sampling
# 숫자를 임의로 추출 (vector)
# sample(x, size = 10, replace =  FALSE) // 10개씩 추축 replace 는 비복원은 False 뽑은건 안뽑는다.
x <- 1:100
y <- sample(x, size = 10, replace =  FALSE)
y

# 행을 임의로 추출
idx <- sample( 1:nrow(iris), size = 50, replace = F)
iris.50 <- iris[idx,]
dim(iris.50)
head(iris.50)


sample(1:20, size = 5)
sample(1:20, size = 5)
sample(1:20, size = 5)

set.seed(16)
sample(1:20, size = 5)

set.seed(100)
sample(1:20, size = 5)

set.seed(100)
sample(1:20, size = 5)

# 데이터 조합
combn(1:5,3) # 조합함수 첫번째인수가 범위,두번째 인수가 몇개를 뽑을건지? 


x = c('red','green','blue','black','white')
com <- combn(x,3)
com
for (i in 1:ncol(com)) {
  cat(com[,i], "\n")
}











