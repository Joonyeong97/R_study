# 분석 대상 데이터 준비
setwd("./")

library(ggplot2)
library(ggmap)
library(readxl)

files <- c("201512","201606","201612","201706","201712")
columns <- c( "상가업소번호", "상호명", "상권업종대분류명", "상권업종중분류명", 
              "상권업종소분류명", "시군구명", "행정동명", "경도", "위도")     
ds.total <- NULL

for (i in 1:length(files)) {
  filename <- paste("seoul_", files[i], ".xlsx", sep="")
  cat("read ", filename, "...\n")         # 읽을 파일 이름 출력
  
  ds <- read_excel(filename)              # 엑셀 파일 읽기
  ds <- data.frame(ds)                    # 데이터프레임으로 변환
  ds <- ds[,columns]                      # 분석에 필요한 변수만 추출
  ds$수집연월 <- rep(i, nrow(ds))         # 데이터 수집 시점
  ds.total <- rbind(ds.total,ds)          # 데이터 통합 
}

head(ds.total)