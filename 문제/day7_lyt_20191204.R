#
#
#
#  7일차 문제
# 임영택 20191204/20191204
#
#
#

#문제 1
install.packages("VIM")
require(VIM)

ds <- state.x77
ds[2,3] <- NA; ds[3,1] <- NA; ds[2,4] <- NA; ds[4,3] <- NA



sum(is.na(ds))

col_na <- function(y){
  return( sum (is.na (y) ) )
}
na_count <- apply(ds,2,col_na) 
na_count
#열별로 NA값 개수파악


rowSums(is.na(ds))                 # 결측치가 포함된 행
sum(is.na(ds))                     # 결측치의 개수

ds1 <- ds[ complete.cases(ds), ] #na값 삭제후 ds1에 대입

ds1



# 문제 2번
st <- data.frame(state.x77)

summary(st$Income)
boxplot(st$Income)
boxplot( st[, 1 ] )     # 특이값 있음
boxplot( st[, 2 ] )     # 특이값 있음
boxplot( st[, 3 ] )     # 특이값 없음
boxplot( st[, 4 ] )     # 특이값 없음
boxplot( st[, 5 ] )     # 특이값 없음
boxplot( st[, 6 ] )     # 특이값 없음
boxplot( st[, 7 ] )     # 특이값 없음
boxplot( st[, 8 ] )     # 특이값 있음
boxplot.stats(st$Income)$out


na.out <- boxplot.stats(st$Income)$out
st$Income[st$Income %in% na.out] <- NA # Income안에 이상치값을 NA로 변경

st2 <- st[ complete.cases(st), ]

st2


# 문제 3번

AQ <- data.frame(airquality)
AQ2 <- data.frame(airquality)

# 열별로 NA개수 파악
col_na <- function(y){
  return( sum (is.na (y) ) )
}
na_count1 <- apply(AQ,2,col_na) 
na_count1


# 행별로 NA개수 파악
rowSums(is.na(AQ))                 # 결측치가 포함된 행
sum(is.na(AQ))                     # 결측치의 개수

AQ1 <- AQ[ complete.cases(AQ),]   # 결측치가 포함되지 않은 것들만 출력


AQ_1 <- AQ1 %>% summarise(mean_Ozone = mean(Ozone))
AQ_2 <- AQ1 %>% summarise(mean_Solar.R = mean(Solar.R))


AQ$Ozone[AQ$Ozone %in% NA] <- AQ_1
AQ$Solar.R[AQ$Solar.R %in% NA] <- AQ_2


AQ2 <- AQ
AQ2

# 문제 4번

st <- data.frame(state.x77)
require( dplyr )
st %>% arrange(Population) # 오름차
st %>% arrange(desc(Income)) # 내림차

st %>% arrange(Illiteracy) %>% 
               head(10)

# 문제 5번


car <- data.frame(mtcars)

# 1
mt.gear <- split(car, car$gear)


# 2
subset(car, gear == 4)


# 3
mt.gear.35 <- car %>% filter(gear == 3 | gear == 5)

mt.gear.35


# 4

car %>% filter(wt >=1.5 & wt <= 3.0)




# 문제 6번

authors <- data.frame( surname = c( "Twein", "Venables", "Tierney", "Ripley", "McNeil" ),
                       nationality = c( "US", "Australia", "US", "UK", "Australia" ),
                       retired = c( "yes", rep( "no", 4 ) ) )
books <- data.frame( name = c( "Johns", "Venables", "Tierney", "Ripley", "Ripley", "McNeil" ),
                     title = c( "Exploratory Data Analysis", 
                                "Modern Applied Statistics ...",
                                "LISP-STAT",
                                "Spatial Statistics", "Stochastic Simulation",
                                "Interactive Data Analysis" ),
                     other.author = c( NA, "Ripley", NA, NA, NA, NA ) )




# 1

z <- merge(authors,books,by.x =c("surname"),
                          by.y = c("name"))

# 2

z1 <- merge(authors,books,by.x =c("surname"),
                by.y = c("name"),
            all.x = T)
z1

# 3

z2 <- merge(authors,books,by.x =c("surname"),
            by.y = c("name"),
            all.y = T)
z2

# 4

z3 <- merge(authors,books,by.x =c("surname"),
            by.y = c("other.author"),
            all = T)
z3




