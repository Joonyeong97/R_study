#
# 11일차
# 
# mosic plot 
#     다중변수 범주형 데이터에 대한 각 변수의 그룹별 비율을 면적으로 표시
str(mtcars)
head(mtcars)
mosaicplot(~gear + vs,    # 대상 변수 ~다음이 X축 + 다음이 Y축
           data = mtcars, # 데이터셋
           color = T,     # y축 변수의 그룹별 음영 다르게 표시
           main = "Gear and Vs") # 제목


# Table 함수로 묶어서 내든 그냥하든 똑같음.
# 범주형끼리만 가능한 함수



mosaicplot(~gear + vs, data = mtcars,
           color = c('green','blue'),
           main = "Gear and vs")


tbl <- table(mtcars$gear, mtcars$vs)
tbl
mosaicplot(tbl, color = T, main = "Gear and Vs")


# 차원 축소
# 3~4 차원 함수들을 2차원형태로 축소시키는것.
# -t -SNE 기법
#

install.packages("Rtsne")
library(Rtsne)
library(ggplot2)

ds <- iris[,-5]

# 차원축소
# 중복 데이터 제거
dup = which(duplicated(ds)) # 중복데이터 찾는 함수 duplicated
dup

ds <- ds[-dup,]             # 중복데이터 제거
ds.y <- iris$Species[-dup]  # 품종별에도 중복데이터 행을 삭제.


# 차원 축소 수행 -t -SNE 실행
tsne <- Rtsne(ds,               # 차원 축소 대상 데이터 셋
              dim = 2,          # 축소할 차원 2/3차원
              perplexity = 10 ) # 차원 축소 과정에서
                                # 데이터 샘플링을 수행하는데
                                # 샘플의 갯수
                                # (대상데이터수) / 3 보다 작게 정의
tsne <- Rtsne(ds, dim = 2, perplexity = 10 )



# 차원축소 결과 시각화
# 2차원으로 표시
df.tens <- data.frame(tsne$Y)
head(df.tens)

ggplot(df.tens, aes(x = X1, y = X2, color = ds.y)) +
  geom_point( size = 2 )



install.packages(c("rgl","car"))
library(car)
library(rgl)
library(mgcv)

# 3차원으로 표시
tsne <- Rtsne(ds , dims = 3, perplexity = 10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)


scatter3d(x = df.tsne$X1, y = df.tsne$X2,
          z= df.tsne$X3)

# 3차원으로 표시
points <- as.integer(ds.y)
color <- c('red', 'green', 'blue')
scatter3d(x = df.tsne$X1, y = df.tsne$X2,
          z = df.tsne$X3,
          point.col = color[points],
          surface = F)


#
#  공간 시각화
#
# google map 사용
#
# 절차
#
# 1. R 최신버전 설치
# 2. ggplot2 최신버전 설치
# 3. ggmap 설치
# 4. 구글맵을 사용하기 위한 API key 획득
# 5. 구글맵을 이용한 공간 시각화 수행
#
#
#

install.packages("ggmap")
library(ggmap)

register_google( key = 'AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g')

gc <- geocode(enc2utf8("제주")) # 특정 경도 / 위도를 알아와줌
gc

cen <- as.numeric(gc)
cen

# 지도 표시
map <- get_googlemap(center = c(126.569879,33.452409))
ggmap(map)


gc <- geocode(enc2utf8("한라산"))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen ,       # 지도 중심점 좌표
                     zoom = 10,           # 지도 확대 정도
                     size = c(640,640),   # 지도 크기
                     maptype = "roadmap") # 지도 유형
ggmap(map)


cen <- c(126.561099, 33.253077)
map <- get_googlemap(center = cen,
                     zoom = 15,
                     maptype = "roadmap")
ggmap(map)

# 지도위 마커 표시

gc <- geocode(enc2utf8("경기광주 쌍령동 현대1차아파트"))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 15, 
                     markers = gc)
ggmap(map)


names <- c("용두암", "성산일출봉", "정방폭포",
           "중문관광단지", "한라산1100고지", "차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동 산 1-2",
          "제주시 한경면 고산리 125")
gc <- geocode(enc2utf8(addr))
gc


# 관광지 명칭과 좌표값으로 Data Frame 생성
df <- data.frame(name = names, lon = gc$lon,
                 lat = gc$lat)
df


cen <- c(mean(df$lon), mean(df$lat))

map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 10,
                     size = c(640,640),
                     marker = gc)

ggmap(map)



# 지도에 관광지 이름 추가
gmap <- ggmap(map)
gmap +
  geom_text(data = df,
            aes(
          x = df$lon, y = df$lat
            ),
            size = 5,
            label = df$name)


# 지도에 데이터 표시
dim(wind)
str(wind)


sp <- sample(1:nrow(wind), 50)
df <- wind[sp, ]
head(df)


cen <- c(mean(df$lon), mean(df$lat))
gc <- data.frame(lon = df$lon, lat = df$lat)
head(gc)


map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 6,
                     marker = gc)
ggmap(map)


# 지도의 풍속을 원의 크기로 표시

map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 6)


gmap <- ggmap(map)
gmap+
  geom_point(data = df,
             aes(x = lon, y = lat, size = spd),
             alpha = 0.5, col = "blue") +
  scale_size_continuous(range = c(1,14)) # 원크기 조절


# 단계 구분도
install.packages("ggiraphExtra")
library(ggiraphExtra)

dim(USArrests)
str(USArrests)
head(USArrests)

library(tibble)
crime <- rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state)
str(crime)

library(ggplot2)
install.packages("mapproj")
library(mapproj)

state_map <- map_data("state")
str(state_map)


ggChoropleth(data =crime,
             aes(fill = Murder,
                 map_id = state),
             map = state_map)

# 한국맵 
# http://rpubs.com/cardiomoon/222145
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
devtools::install_github("cardiomoon/moonBook2")

library(kormaps2014)
library(moonBook2)


areacode
str(kormap1)



library(ggplot2)
theme_set(theme_gray(base_family="NanumGothic"))

ggplot(korpop2,aes(map_id=code,fill=총인구_명))+
  geom_map(map=kormap2,colour="black",size=0.1)+
  expand_limits(x=kormap2$long,y=kormap2$lat)+
  scale_fill_gradientn(colours=c('white','orange','red'))+
  ggtitle("2015년도 시도별 인구분포도")+
  coord_map()

zz <- c(kormap1$long,kormap1$lat)
head(zz)


ggChoropleth(korpop2,kormap2,fillvar="남자_명")

ggChoropleth(korpop3,kormap3,fillvar="주택_계_호")


ggChoropleth(korpop3,kormap3,fillvar="총인구_명",subarea=c("전라","광주"))

ggChoropleth(korpop3,kormap3,fillvar="남자_명",interactive=TRUE,subarea=c("전라","광주"),tooltip="행정구역별_읍면동")





































