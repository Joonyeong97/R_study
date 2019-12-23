#
# 10일차
#

install.packages("tidyverse")
library(tidyverse)


z <- c(1,2,3,4,5,6,7,8,9)
c <- c(2,3,4,5,6,7,8,9,10)

q <- tibble(z,c)

dim(mpg)
str(mpg)
head(mpg)
View(mpg)



# + 연산으로 연결해야됨
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))



month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)
df

ggplot(df,aes(x = month, y=rain)) + # ggplot에 aes(x,y) 입력가능
  geom_bar(stat = 'identity', # y값을 가지고 그래프를 그려라
           width = 0.7, # 폭
           fill = 'steelblue') # 색상


ggplot(df,aes(x = month, y=rain)) +
  geom_bar(stat = 'identity',
           width = 0.7,
           fill = 'steelblue') +
ggtitle('월별 강수량')  + # 제목 넣는거
theme(plot.title = element_text(size = 25, #글자사이즈
                                face = "bold", # 글자 폰트
                                colour = "steelblue")) + # 글자 색상
labs(x="월", y="강수량") + # x , y 레이블값 넣는거
  coord_flip() # 가로로 눕히기


# histogram 그리기 : 연속형 변수에 대한 빈도 체크
ggplot(iris, aes(x = Petal.Length)) + 
  geom_histogram(binwidth = 0.5) # 값의 단위를 0.5 씩으로 해라


ggplot(iris, aes(x = Sepal.Width , fill = Species,
                   color= Species)) + # fill : 막대를 채우는 색, Species = 3가지 범주형
    geom_histogram(binwidth = 0.5, position = "dodge") + # position = 품종별로 각각 그래프를 그림
    theme(legend.position = "top") # 범례를 top 에 작성해라


ggplot(iris, aes(x = Sepal.Width , fill = Species,
                 color= Species)) + # fill : 막대를 채우는 색, Species = 3가지 범주형
  geom_histogram(binwidth = 0.5, position = "identity") + # position = 품종별로 각각 그래프를 그림
  theme(legend.position = "top") # 범례를 top 에 작성해라

ggplot(iris, aes(x = Sepal.Width , fill = Species,
                 color= Species)) + # fill : 막대를 채우는 색, Species = 3가지 범주형
  geom_histogram(binwidth = 0.5, position = "fill") + # position = 품종별로 각각 그래프를 그림
  theme(legend.position = "top") # 범례를 top 에 작성해라

ggplot(iris, aes(x = Sepal.Width , fill = Species,
                 color= Species)) + # fill : 막대를 채우는 색, Species = 3가지 범주형
  geom_histogram(binwidth = 0.5, position = "jitter") + # position = 품종별로 각각 그래프를 그림
  theme(legend.position = "top") # 범례를 top 에 작성해라



ggplot(iris, aes(x = Sepal.Width , fill = Species,
                 color= Species)) + # fill : 막대를 채우는 색, Species = 3가지 범주형
  geom_histogram(binwidth = 0.5, position = "nudge") + # position = 품종별로 각각 그래프를 그림
  theme(legend.position = "top") # 범례를 top 에 작성해라


ggplot(iris, aes(x = Sepal.Width , fill = Species,
                 color= Species)) + # fill : 막대를 채우는 색, Species = 3가지 범주형
  geom_histogram(binwidth = 0.5, position = "stack") + # position = 품종별로 각각 그래프를 그림
  theme(legend.position = "top") # 범례를 top 에 작성해라



# ggplot2 Scatter chart (산점도)
ggplot(data = iris, mapping = aes (x = Petal.Length, 
                                   y = Petal.Width)) +
  geom_point()

ggplot(data = iris ) +
  geom_point(mapping = aes (x = Petal.Length, 
                            y = Petal.Width))

ggplot(data = iris ,mapping = aes (x = Petal.Length, 
                                  y = Petal.Width,
                                  color = Species, 
                                  shape = Species)) + # shape 는 색상 1~3 까지 RGB = RED,GREEN,BLUE
                                                      # AGB = Alpha +RGB / RGB를 16진수로
                                                      # 2진수 4자리는 16진수 
                                                      # 1바이트는 8비트
  geom_point(size = 3) + # size = 3 은 점의 크기
  ggtitle("꽃잎의 길이와 폭") + # 제목
  theme(plot.title = element_text(size = 25, #제목의 형식들 사이즈
                                  face = "bold", #폰트
                                  colour = "red")) #색상
# 같은 결과값
# ggplot은 데이터값 (dataframe) 하고 aes() 맵핑 x,y 값은 필수적으로 해야됨
# + 는 레이어 판마다 역할 분리를 하는거임.



#
# ggplot Box plot
# 박스플롯은(boxplot)은 y값만 적용
ggplot(data = iris, aes(y = Petal.Length)) +
  geom_boxplot(fill = "yellow")


ggplot(data = iris, aes(y = Petal.Length,
                        fill = Species)) +
  geom_boxplot()

# fill : 막대 채움색, color : 막대경계색
# posision : dodge 범례별 각각 그리기



# ggplot Line chart ( 시계열 그래프 )
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year, cnt)
head(df)

ggplot(df, aes(x = year, y = cnt)) +
  geom_line(color = 'red')



# ggplot 작성  graph 꾸미기 (공통)
str(economics)


# 사선 , 회귀선
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  geom_abline(intercept = 12.18671, 
              slope = -0.0005444 ) # y값은 나중에 함수써서 구해야됨.

# intercept : y 절편값
# slope : 기울기

# 시계열
# 평행선 h 는 가로
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  geom_hline(yintercept = mean(economics$psavert))


# 시계열
# 수직선 v 는 수직 특정한날을 지정할때
x_inter <- filter(economics,
                  psavert == min(economics$psavert)) $date
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  geom_vline(xintercept = x_inter)



# 텍스트 추가
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point( ) +
  geom_text(aes(label = Temp,
                vjust = 0,
                hjust = 0))




# 영역 지정 및 화살표 표시
ggplot(mtcars, aes(x= wt, y=mpg)) +
  geom_point() +
  annotate("rect", # 사각형 표시
           xmin = 3,
           xmax = 4,
           ymin = 12,
           ymax = 21,
           alpha = 0.5, # 투명도
           fill = "skyblue") +
annotate("segment", x = 2.5, xend = 3.7, #화살표
         y=10, yend = 17, color = "red",
         arrow = arrow() ) +
annotate("text", x=2.5, y=10, # 텍스트입력
         label = "point")





# treemap 트리맵
install.packages("treemap")
library(treemap)


data(GNI2014)

dim(GNI2014)
str(GNI2014)
head(GNI2014)
View(GNI2014)

treemap(GNI2014,
        index = c("continent","iso3"), # 계층 구조
        vSize = "population",          # 타일 크기 size
        vColor = "GNI" ,               # 타일 컬러
        type = "value",                # 타일 컬러링 방법
        bg.labels = "yellow",          # 레이블 배경색
        title = "Worlds GNI" )         # 제목

st <- data.frame(state.x77)
st <- data.frame(st, stname = rownames(st))
treemap(st,
        index = c("stname"),
        vSize = "Area",
        vColor = "Income",
        type = "value",
        title = " 미국 주별 수입")


# 기본 툴
# 산점도에 Bubble 추가 (Bubble chart)
symbols(st$Illiteracy, st$Murder,  # 원의 x,y좌표
        circles = st$Population,   # 원의 반지름
        inches = 0.3,              # 원크기 조절값
        fg ="black",               # 원 테두리 색
        bg = "lightgray",          # 원 바탕색
        lwd = 1.5,                 # 원 테두리 선 두께
        xlab = "rate of Illiteracy",
        ylab = "crim(muder) rate",
        main = "Illiteracy and Crime")
text(st$Illiteracy, st$Murder,     # 텍스트 출력 x,y 좌표
     rownames(st),                 # 출력할 text
     cex = 0.6,                    # 폰트 크기
     col = "brown")                # 폰트 컬러


# 고급 시각화
# https://www.r-graph-gallery.com/ 여기서 뭐할건지 확인후 대체
install.packages("plotly")
install.packages("viridis")
install.packages("hrbrthemes")
install.packages("gapminder")
library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)


# 데이터 세트는 gapminder 라이브러리에서 제공됨
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Interactive version
p <- data %>%
  mutate(gdpPercap=round(gdpPercap,0)) %>%
  mutate(pop=round(pop/1000000,2)) %>%
  mutate(lifeExp=round(lifeExp,1)) %>%
  
  # Reorder countries to having big bubbles on top
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  
  # prepare text for tooltip
  mutate(text = paste("Country: ", country, "\nPopulation (M): ", pop, "\nLife Expectancy: ", lifeExp, "\nGdp per capita: ", gdpPercap, sep="")) %>%
  
  # Classic ggplot
  ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = continent, text=text)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(1.4, 19), name="Population (M)") +
  scale_color_viridis(discrete=TRUE, guide=FALSE) +
  theme_ipsum() +
  theme(legend.position="none")

# turn ggplot interactive with plotly
pp <- ggplotly(p, tooltip="text")
pp


# library World Cloud 글자로 표시
install.packages("wordcloud2")
library(wordcloud2) 

# Gives a proposed palette
wordcloud2(demoFreq, size=1.6, color='random-dark')

# or a vector of colors. vector must be same length than input data
wordcloud2(demoFreq, size=1.6, color=rep_len( c("green","blue"), nrow(demoFreq) ) )

# Change the background color
wordcloud2(demoFreq, size=1.6, color='random-light', backgroundColor="black")


# 지도 맵
install.packages("leaflet")
library(leaflet)

# Note: if you do not already installed it, install it with:
# install.packages("leaflet")

# Background 1: NASA
m <- leaflet() %>% 
  addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 5 ) %>% 
  addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")
m

# Background 2: World Imagery
m <- leaflet() %>% 
  addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
  addProviderTiles("Esri.WorldImagery")
m

# save the widget in a html file if needed.
# library(htmlwidgets)
# saveWidget(m, file=paste0( getwd(), "/HtmlWidget/backgroundMapTile.html", width="1000px"))




