#
#
# Day 10 문제풀이
# 임영택 
# 20191209

#문1)
#R에서 제공하는 mtcars 데이터셋에서 gear(기어의 수)에 대해 ggplot으로
#막대그래프를 작성하시오. 단, 제목과 x축 레이블은 ‘기어의 수’, y축 레이블
# 은 ‘빈도수’로 나타내시오.

ggplot(data = mtcars, aes( x=mtcars$gear)) +
  geom_bar(width = 0.7, # 폭
           fill = 'steelblue', ) + # 색상
  labs(x="기어의 수", y="빈도수")

# 문2)
# R에서 제공하는 mtcars 데이터셋에서 cyl(실린더의 수)에 대해 막대 색이
# 초록색인 막대그래프를 ggplot으로 작성하시오.

ggplot(data = mtcars, aes( x= cyl)) +
  geom_bar(width = 1, 
    fill = 'Green' ) 

# 문3) 
# R에서 제공하는 mtcars 데이터셋에서 mpg(연비)에 대해 구간 간격이 5.0
# 인 히스토그램을 ggplot으로 작성하시오.

ggplot(data = mtcars, aes( x= mpg)) +
 geom_histogram(binwidth = 5)


# 문4)
# R에서 제공하는 trees 데이터셋의 Girth(나무 둘레)에 대해 ggplot으로
# 히스토그램을 작성하시오. 여기에서는 히스토그램의 제목, x축 레이블, y축
# 레이블을 한글로 표시하시오. (구간 간격은 3.0, 막대의 색은 steelblue로 한다.)

ggplot(data = trees, aes(x = Girth))+
  geom_histogram(binwidth = 3.0,
                 fill = 'steelblue')+
  labs(x= "나무둘레", y= "빈도수")+
ggtitle("나무 둘레")

#문5)
#R에서 제공하는 mtcars 데이터셋에서 mpg(연비)를 x축으로 하고,
# wt(중량)를 y축으로 하는 산점도를 ggplot으로 작성하시오. 
#(단, 점의 색은 gear의수에 따라 다르게 표시한다.)

ggplot(data = mtcars, aes(x = mpg,
                          y = wt,
                          color = gear))+
  geom_point()


#문6)
#R에서 제공하는 mtcars 데이터셋에서 mpg(연비)에 대해 ggplot으로 
#상자그림을 작성하되, cyl(실린더 수)에 따라 그룹을 나누어 작성하시오.

ggplot(data = mtcars, aes(y = mpg, group = cyl,
                          fill = cyl)) +
geom_boxplot()

# 문제7번)
# 다음은 2015년부터 2026년도까지의 예상 인구수 추계 자료이다. 연도를
# x축으로 하여 ggplot으로 선그래프를 작성하시오.

year <- 2015:2026
popul <- c(51014,51245,51446,51635,51811,51973,52123,52261,52388,52504,
           52609,52704)
pp1 <- data.frame(year,popul)

ggplot(pp1, aes(x = year, y = popul)) +
  geom_line(color = 'red')



# 문제 8번

# 1 번 
#(1) 미국 50개 주에 대해 각각의 주들이 지역구분별로 묶인 트리맵을 작성하시오.
#또한, 타일의 면적은 Population(인구수), 타일의 색은 Income(소득)으로 나타내고,
#각각의 타일에는 주의 이름을 표시하시오. 마지막으로 이 트리맵에서 관찰할 수 있
#는 것이 무엇인지 설명하시오
us <- data.frame(state.x77, state.division)
st <- data.frame(st, stname = rownames(st))
qs <- data.frame(state.division, stname = rownames(us))


library(treemap)
treemap(st,
        index = c("state.division","stname"),
        vSize = "Population",
        vColor = "Income",
        type = "value",
        title = " 미국 주별 인구수")

# 면적이 큰도시일수록 소득도 높음

# 2 번
#(2) 미국 50개 주에 대해 각각의 주들이 지역구분별로 묶인 트리맵을 작성하시오.
#또한, 타일의 면적은 HS.Grad(고등학교 졸업률), 타일의 색은 Murder(범죄률)로 나타
#내고, 각각의 타일에는 주의 이름을 표시하시오. 마지막으로 이 트리맵에서 관찰할
#수 있는 것이 무엇인지 설명하시오.
treemap(st,
        index = c("stname"),
        vSize = "HS.Grad",
        vColor = "Murder",
        type = "value",
        title = " 미국 주별 고교졸업률 면적 대비 살인율")

# 고교 졸업률과 살인의 상관관계 거의 없는듯함.


# 3번
#Population(인구수), 원의 색은 green(초록색), 원 내부에는 주의 이름을 표시한 버
#블차트를 작성하시오. 또한 이 버블차트에서 관찰할 수 있는 것이 무엇인지 설명하
#시오.

symbols(us$Income, us$Illiteracy,  # 원의 x,y좌표
        circles = us$Population,   # 원의 반지름
        inches = 0.3,              # 원크기 조절값
        fg ="green",               # 원 테두리 색
        bg = "green",          # 원 바탕색
        lwd = 1.5,                 # 원 테두리 선 두께
        xlab = "수입 ",
        ylab = "문맹률",
        main = "문맹률 과 수입")
text(us$Income, us$Illiteracy,     # 텍스트 출력 x,y 좌표
     rownames(us),                 # 출력할 text
     cex = 0.6,                    # 폰트 크기
     col = "brown")                # 폰트 컬러
# 인구수가 많고 문맹률이 낮을수록 수입이 비교적 높은것을 확인가능함.


# 4번
#(4) us 데이터셋에 대해 x축은 Illiteracy(문맹률), y축은 Murder(범죄률), 원의 크기
#는 Area(면적), 원의 색은 green(초록색), 원 내부에는 주의 이름을 표시한 버블차트
#를 작성하시오. 또한 이 버블차트에서 관찰할 수 있는 것이 무엇인지 설명하시오.


symbols(us$Illiteracy, us$Murder,  # 원의 x,y좌표
        circles = us$Area,   # 원의 반지름
        inches = 0.5,              # 원크기 조절값
        fg ="black",               # 원 테두리 색
        bg = "green",          # 원 바탕색
        lwd = 1.5,                 # 원 테두리 선 두께
        xlab = "문맹률 ",
        ylab = "살인률",
        main = "문맹률과 살인률")
text(us$Illiteracy, us$Murder,     # 텍스트 출력 x,y 좌표
     rownames(us),                 # 출력할 text
     cex = 0.6,                    # 폰트 크기
     col = "brown")                # 폰트 컬러

# 문맹률이 높으면 살인률이 높은걸 확인가능함






