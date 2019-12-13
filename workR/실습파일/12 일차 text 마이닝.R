
#
# 워드클라우드 (Word Cloud)
#
# 한글 워드클라우드 절차
# 1. Java 실행환경 구축
# 2. 자료 수집 (Text 자료)
#   2.1 text file 형태로 수집
#   2.2 web scraping을 이용하여 수집
# 3. 명사 추출
Sys.setenv( JAVA_HOME = 'C:/Program Files/Java/jre1.8.0_231')

# 필요시 설치
install.packages("wordcloud")         # Word cloud
install.packages("wordcloud2")        # Word cloud
install.packages("KoNLP")             # 한국어 처리
install.packages("RColorBrewer")    # 색상 선택

library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)


library(dplyr)
library(ggplot2)


setwd('D:/lyt09/문제')
text <- readLines('mis_document.txt', encoding = 'UTF-8')
text

# 우리말씀 한글사전 로딩
buildDictionary(ext_dic =  ' woorimalsam') 
pal2 <- brewer.pal(8,'Dark2') # 색상 팔레트 설정
noun <- sapply(text, extractNoun, USE.NAMES = F) # 명사 추출
noun




# 4번 추출된 단어 (주로 명사)에 대한 빈도수 계산 및 시각화
noun2 <- unlist(noun) # list -> vector 로 변환
wordcount <- table(noun2)
sort.noun <- sort(wordcount,decreasing = T) [2:11]
sort.noun
sort.noun <- sort.noun[-1]
barplot(sort.noun, names.arg = names(sort.noun),
        col = 'steelblue', main = '빈도수 높은 단어',
        ylab = '단어 빈도수')


df <- as.data.frame(sort.noun)
df
ggplot(df, aes(x = df$noun2, y = df$Freq)) +
  geom_bar(stat = 'identity',
           width = 0.7,
           fill = 'steelblue') +
  ggtitle('빈도수 높은 단어') +
  theme(plot.title = element_text(size = 25,
                                  face = 'bold',
                                  colour = 'steelblue',
                                  hjust = 0,
                                  vjust = 1 )) +
  labs(x = '명사', y = '단어빈도수') +
  geom_text(aes(label = df$Freq), hjust = -0.3)+ # 빈도 표시
  coord_flip()


# 5. word cloud 작성
pal3 <- brewer.pal(9,'Blues')[5:9] # 색상 팔레트 설정
brewer.pal.info
wordcloud(names(wordcount),    # 단어
          freq = wordcount,    # 단어 빈도
          scale = c(6,0.7),    # 단어 폰트 크기(최대,최소)
          min.freq = 3,        # 단어 최소 빈도
          random.order = F,    # 단어 출력위치
          rot.per = .1,        # 90도 회전 단어 비율
          colors = pal3)       # 단어 색색



# 6. 전처리 과정 수행

#     6.1 생락된 단어를 사전에 등재
buildDictionary(ext_dic = 'woorimalsam',
                user_dic = data.frame('정치','ncn'), # 사전에 '정치'란 단어를 명사로 등록.
                replace_usr_dic = T)
noun <- sapply(text, extractNoun, USE,NAMES = F)
noun2 <- unlist(noun)

#     6.2 불필요한 단어 삭제
noun2 <- noun2[nchar(noun2) > 1] # 길이가 1글자 이하인것들 제외
noun2 <- gsub('하지', '', noun2) # 특정 단어를 공백으로 변경
noun2 <- gsub('때문', '', noun2) # 특정 단어를 공백으로 변경
noun2 <- gsub('들이', '', noun2)
wordcount <- table(noun2)
sort(wordcount)


wordcloud(names(wordcount),    # 단어
          freq = wordcount,    # 단어 빈도
          scale = c(6,0.7),    # 단어 폰트 크기(최대,최소)
          min.freq = 3,        # 단어 최소 빈도
          random.order = F,    # 단어 출력위치
          rot.per = .1,        # 90도 회전 단어 비율
          colors = pal3)       # 단어 색색


#
# 애국가 형태소 분석
#

library(KoNLP)
useSystemDic()
useSejongDic()
useNIADic()

#
#
# 애국가 가사 :
# https://mois.go.kr/frt/sub/a06/b08/nationalIcon_3/screen.do
#
# 1. 사전 설정
useSejongDic()

# 2. 텍스트 데이터 가져오기
word_data <- readLines('애국가(가사).txt')
word_data

# 3. 명사 추출
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

# 3.1  제대로 추출되징 않은 단어를 사용자 사전에 등록
add_words <- c('삼천리','백두산', '남산', '철갑', '가을', '하늘', '달')
buildDictionary( user_dic = 
                data.frame(add_words,
                 rep('ncn',length(add_words))),
                 replace_usr_dic = T)

get_dictionary('user_dic')


# 3.2 단어 추가 후 다시 명사 추출
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2


# 4. 행렬을 벡터로 변환
undata <- unlist(word_data2)
undata


# 5. 사용 빈도 확인
word_table <- table(undata)
word_table


# 6. 필터링 : 두 글자 이상 단어만 선별,
#             공백이나 한 자리 문자를 걸러냄
undata2 <- undata[nchar(undata) >= 2]
undata2
word_table2 <- table(undata2)
word_table2


# 7. 데이터 정렬
sort(word_table2, decreasing = T)


# 애국가 형태 분석 완료
# 가장 기본적인 전처리만 수행, 100% 정확한 데이터라 볼수 없음.

# 8. word cloud 작성
library(wordcloud2)
wordcloud2(word_table2,)


# 8.1 배경 및 색상 변경
wordcloud2(word_table2,
           color = 'random-light',
           backgroundColor = 'black')

# 8.2 모양 변경
wordcloud2(word_table2,
           fontFamily = '맑은고딕',
           size = 1.2, color = 'random-light',
           backgroundColor = 'black',
           shape = 'diamond')

# 8.3 선택 색상 반복
wordcloud2(word_table2, size = 1.6,
           color = rep_len(c('red','blue'),
                           nrow(word_table2)))
wordcloud2(demoFreq, size = 1.6,
           color = rep_len(c('red','blue'),
                           nrow(word_table2)),
           shape = 'diamond')

# 8.4 일정 방향 정렬
wordcloud2(word_table2,
           minRotation = -pi / 6,
           maxRotation = -pi / 6,
           rotateRatio =  1 )

wordcloud2(demoFreq,
           minRotation = -pi / 6,
           maxRotation = -pi / 6,
           rotateRatio =  1 )





















