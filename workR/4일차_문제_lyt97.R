#
#
# 임영택 20191129/20191202
#
#

# 문제 1번
gender <- matrix(c(10,21,40,60,60,70,20,30),4,2) # 매트릭스함수 선언

colnames(gender) <- c("male","female") # 열 이름을 Male / Female 입력

gender[2,] # 2행에 있는 값 출력

gender[,"female"] # female 값 출력

gender[3,2] # 3행 2열 출력력

# 문제 2번


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

apply(st, 1, sum) ; apply(st,1, mean) # 행별 합계 / 평균
apply(st,2,sum) ; apply(st, 2, mean) # 행별 합계 / 평균

st[9,] # 플로리다의 정보 출력 
st1 <- subset( st ["Florida", ] ); st1 # 검색활용

st[,2] # 50개주 수입만 출력

st2 <-  subset( st ["Income"] ); st2 # 50개주 Income만 출력

st3 <- subset( st ["Texas",], 
               select = "Area") ; st3 # Texas주 Area만 출력

st4 <- subset( st["Ohio",],
               select = c("Population","Income") ) ; st4 # Ohio주의 인구 와 수입 만 출력


st5 <- subset(st["Population"]>5000,select = TRUE) # error
st5

























































