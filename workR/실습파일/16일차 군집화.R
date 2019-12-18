#
#
# 16 일차
# 
# 군집화 (Clustering)  /  분류 (classification)
# 
# 군집화 (Clustering): 주어진 대상 데이터들
#             유사성이 높은 것끼리 묶어주는 기술
#             (군집 , 범주, 그룹)
#
#
#
# k-means(평균) 군집화 알고리즘
mydata <- iris[, 1:4]
fit <- kmeans(x = mydata, center = 3) # 3개의 그룹으로 만들어라
fit


#K-means clustering with 3 clusters of sizes 62, 38, 50

#Cluster means:
#  Sepal.Length Sepal.Width Petal.Length Petal.Width - 중심좌표
#1     5.901613    2.748387     4.393548    1.433871
#2     6.850000    3.073684     5.742105    2.071053
#3     5.006000    3.428000     1.462000    0.246000

#Clustering vector: -> 각데이터에 대한 군집번호
#  [1] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 1 1 2 1 1 1 1 1 1 1 1 1
#[63] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 2 2 2 2 1 2 2 2 2 2 2 1 1 2 2 2 2 1 2 1 2 1
#[125] 2 2 1 1 2 2 2 2 2 1 2 2 2 2 1 2 2 2 1 2 2 2 1 2 2 1

#Within cluster sum of squares by cluster:
#  [1] 39.82097 23.87947 15.15100
#(between_SS / total_SS =  88.4 %)

#Available components:
  
#  [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss" "betweenss"    "size"         "iter"        
#[9] "ifault"      




fit$cluster
fit$centers



library(cluster)
clusplot(mydata,          # 군집대상
         fit$cluster,     # 군집번호
         color = T,       # 원의 색
         shade = T,       # 원의 빗금 표시 유무
         labels = 2,      # 관측값 출력 형태
         lines = 0)       # 중심선 연결 표시
subset(mydata, fit$cluster == 2) # 원본데이터를 군집화된것으로 추출

#
#
#  대상 데이터 정규화 후 군집화
# 
#
#       데이터와 데이터의 거리를 계산할 때 발생하는 문제
#       모든 변수가 거리 계산에 동등한 영향을 갖도록
#       하기 위해서 모든 변수의 자료 범위를 0~1로 설정
#       표준화한 후 거리 계산을 한다.
#
#       ( x - min( A )) / (max ( A )- min(A))
#       x : 변수 A의 임의의 관측값
#       max(A), min(A)는 변수 A 관측값중 최대/최소값
#
#


std <- function(x) {
  return((x-min(x)) / max(x) - min(x))
}
mydata <- apply(iris[,1:4], 2, std)
fit <- kmeans(x = mydata, center = 3)
fit

# 군집화 : 그룹정보가 없는 Data의 그룹을 알아내는 Model
# 분류 : 특정 Data가 어떤 그룹에 속하는지 알아내는 Model

#
# KNN (K - Nearest Neighbor, K - 최근접 이웃) 분류 알고리즘
#

library(class)

# 훈련용 / 테스트용 데이터 준비
tr.idx <- c(1:25,51:75,101:125)
ds.tr <- iris[tr.idx, 1:4]  # 훈련용
ds.ts <- iris[-tr.idx, 1:4] # 테스트용
cl.tr <- factor(iris[tr.idx, 5]) # 훈련용 그룹정보
cl.ts <- factor(iris[-tr.idx, 5 ]) # 테스트용 그룹정보
pred <- knn(ds.tr,ds.ts,cl.tr,k = 4, prob = T)
pred
acc <- mean(pred == cl.ts)
acc
table(pred,cl.ts)


#
# 교차 검증 방법 (K - fold cross validation)
#
install.packages("cvTools")
library(cvTools)


k = 16
folds <- cvFolds(nrow(iris), K = k)



acc <- c()
for (i in 1:k) {
  ts.idx <- folds$which == i
  ds.tr <- iris[ - ts.idx, 1:4]
  ds.ts <- iris[ts.idx, 1:4]
  cl.tr <- factor(iris[-ts.idx,5])
  cl.ts <- factor(iris[ts.idx,5])
  pred <- knn(ds.tr,ds.ts,cl.tr, k = 5)
  acc[i] <- mean(pred == cl.ts)
}
acc
mean(acc)












