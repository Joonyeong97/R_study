#
#
#
# 2019 12 10
# 임영택
# 11일차 문제
#



#문1)
#R에서 제공하는 state.x77 데이터셋을 차원 축소하여 2차원 산점도와 3
#차원 산점도를 작성하시오. (state.x77은 매트릭스 타입이기 때문에 데이터프레임
#으로 변환하여 실습한다.)

library(Rtsne)
library(ggplot2)

test1 <- data.frame(state.x77)
test1

joong1 = which(duplicated(test1))
joong1

str(test1)

test1 <- test1[-joong1,]
 # 중복데이터 삭제.
# 2차원
test2 <- Rtsne(test1,
               dim = 2,
               perplexity = 5)

test1_1 <- data.frame(test2$Y)
head(test1_1)

ggplot(test1_1, aes(x = X1, y = X2 )) +
  geom_point(size = 2)

#  3차원

test3 <- Rtsne(test1,
               dim = 3,
               perplexity = 5)
test3

test3_1 <- data.frame(test3$Y)

scatter3d(x = test3_1$X1, y = test3_1$X2, z = test3_1$X3)


# 문2)
# R에서 제공하는 swiss 데이터셋을 차원 축소하여 2차원 산점도와 3차원
# 산점도를 작성하시오.

str(swiss)

sw <- data.frame(swiss)

# 중복 데이터 제거
joongbok <- which(duplicated(sw))


sw1 <- Rtsne(sw,
             dim = 2,
             perplexity = 5)
sw1_1 <- data.frame(sw1$Y)

ggplot(sw1_1, aes(x = sw1_1$X1, y = sw1_1$X2)) +
  geom_point(size = 2) +
  labs(x = "X1", y = "X2")

# 3 차원
sw2 <- Rtsne(sw,
             dim = 3,
             perplexity = 5)
sw2_1 <- data.frame(sw2$Y)

scatter3d(x = sw2_1$X1, y = sw2_1$X2, z = sw2_1$X3)


#문3) 
#R을 이용하여 지도를 출력하시오.
#(1) 서울시청을 중심으로 지도 크기는 600x600, 지도 유형은 roadmap인 지도를 출력#
#하시오.
#(2) 금강산 지역을 근방으로 지도 크기는 500x500, 지도 유형은 hybrid, zoom은 8#
#인 지도를 출력하시오.
#(3) 강남역 근방으로 지도 크기는 640x640, 지도 유형은 roadmap, zoom은 16인 지#
#도를 출력하시오.
#(4) 지도 유형은 roadmap, zoom은 9인 경도 127.397692, 위도 36.337058 지역의 지
#도를 출력하시오.
#(5) 지도 유형은 roadmap, zoom은 10인 경도 135.502330, 위도 34.693594 지역의
#지도를 출력하시오.


library(ggmap)
# 1번
register_google( key = 'AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g')

gc <- geocode(enc2utf8("서울시청"))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen ,       # 지도 중심점 좌표
                     zoom = 15,           # 지도 확대 정도
                     size = c(600,600),   # 지도 크기
                     maptype = "roadmap") # 지도 유형
ggmap(map)

# 2번

gc1 <- geocode(enc2utf8("금강산"))
cen1 <- as.numeric(gc1)
map1 <- get_googlemap(center = cen1 ,       # 지도 중심점 좌표
                     zoom = 8,           # 지도 확대 정도
                     size = c(500,500),   # 지도 크기
                     maptype = "hybrid") # 지도 유형
ggmap(map1)

# 3번

gc2 <- geocode(enc2utf8("강남역"))
cen2 <- as.numeric(gc2)
map2 <- get_googlemap(center = cen2 ,       # 지도 중심점 좌표
                     zoom = 13,           # 지도 확대 정도
                     size = c(640,640),   # 지도 크기
                     maptype = "roadmap") # 지도 유형
ggmap(map2)

# 4번


map3 <- get_googlemap(center = c(127.397692,36.337058) ,       # 지도 중심점 좌표
                     zoom = 9,           # 지도 확대 정도
                     size = c(640,640),   # 지도 크기
                     maptype = "roadmap") # 지도 유형
ggmap(map3)


# 5번

map4 <- get_googlemap(center = c(135.502330,34.693594) ,       # 지도 중심점 좌표
                     zoom = 10,           # 지도 확대 정도
                     size = c(640,640),   # 지도 크기
                     maptype = "roadmap") # 지도 유형
ggmap(map4)



# 문4)
# R을 이용하여 서울시 한강 이남의 구청들의 위치에 마커와 구청 이름을
# 지도 위에 표시하시오.

names1 <- c("강서구청", "동작구청", "강남구청",
           "광진구청", "송파구청")

cc1 <- c("강서구청","동작구청","강남구청","광진구청","송파구청")

gc1 <- geocode(enc2utf8(cc1))
gc1

gc2 <- data.frame(name = names1 ,gc1)

cen <- c(mean(gc1$lon), mean(gc1$lat))

map5 <- get_googlemap(center = cen ,       # 지도 중심점 좌표
                     zoom = 11,           # 지도 확대 정도
                     size = c(640,640),   # 지도 크기
                     maptype = "roadmap", # 지도 유형
                     markers = gc1)       # 마커
ggmap(map5)

gmap <- ggmap(map5)
gmap +
  geom_text(data = gc2,
            aes(
              x = lon, y = lat
            ),
            size = 5,
            label = gc2$name)



# 문5)
# R을 이용하여 대한민국의 광역시를 지도 위에 출력하시오. 단, 마커와 광
# 역시 이름을 함께 표시하시오.

name1 <- c("부산광역시","대구광역시","인천광역시","대전광역시","광주광역시","울산광역시")

ccz <- geocode(enc2utf8(name1))

cczname <- data.frame(name1,ccz)
cczname

cen <- c(mean(ccz$lon), mean(ccz$lat))


map1 <- get_googlemap(center = cen,
                     zoom = 7,
                     size = c(640,640),
                     maptype = "roadmap",
                     markers = ccz)

gmap2 <- ggmap(map1)

gmap2 +
  geom_text(data = cczname,
            aes(x = lon, y = lat),
            size = 7 ,
            label = cczname$name1)

#
#문6)
#R을 이용하여 서울, 경기, 강원 지역의 국립공원 위치를 지도 상에 마커로
#시하되 국립공원의 이름을 함께 표시하시오.


name2 <- c("북한산 국립공원", "설악산 국립공원", "태백산 국립공원", "오대산 국립공원", "치악산 국립공원")
str(name2)
ccz1 <- geocode(enc2utf8(name2))

cczname1 <- data.frame(name2,ccz1)
cczname1

cen <- c(mean(ccz1$lon), mean(ccz1$lat))


map1 <- get_googlemap(center = cen,
                      zoom = 8,
                      size = c(640,640),
                      maptype = "roadmap",
                      markers = ccz1)

gmap2 <- ggmap(map1)

gmap2 +
  geom_text(data = cczname1,
            aes(x = lon, y = lat),
            size = 5 ,
            label = cczname1$name2)

# 문7) 
# ‘2018년도 시군구별 월별 교통사고 자료’로부터 서울시의 각 구별 1년 교
# 통사고 발생건수를 지도상에 원의 크기로 나타내시오.

setwd("C:/Users/82105/Desktop/빅데이터교육/r/lyt09/문제")
setwd("D:/lyt09/문제")
pil <- read.csv("Report.csv")


str(pil)
asda <- pil[,'시군구']

str(asda)
xxx <- as.character(asda)

str(xxx)
zz11 <- geocode(enc2utf8(xxx))

cennam1 <-data.frame(zz11,pil)


cen <- c(mean(cennam1$lon), mean(cennam1$lat))


map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 11)
gmap <- ggmap(map)

gmap +
  geom_point(data = cennam1,
             aes(x = lon, y= lat , size = cennam1$X2018),
             alpha = 0.5, col = "blue") +
    scale_size_continuous(range = c(1,14))

  
# 제주도

setwd("D:/lyt09/문제")
jeju <- read.csv("jeju.csv")

si <- jeju[,'시군구']
char1 <- as.character(si)


xy <- geocode(enc2utf8(char1))
jejuxy <- data.frame(xy,jeju)

cen1 <- c(mean(xy$lon), mean(xy$lat))



map <- get_googlemap(center = cen1 ,
                     maptype = "roadmap",
                     zoom = 11)
gmap <- ggmap(map)

gmap +
  geom_point(data = jejuxy,
             aes(x = lon, y= lat , size = jejuxy$X2018),
             alpha = 0.5, col = "blue") +
  scale_size_continuous(range = c(6,14))





