#
#
# 16일차 마지막 실습파일
#
# 임영택
# 20191218
#
#

#문1)
#R에서 제공하는 state.x77 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.

#• 군집의 수는 5로 한다.
#• state.x77은 각 변수(열)의 값들의 단위의 차이가 많이 나기 때문에 0~1 표준화를 실시한 후 군집화를 실행한다.
library(cluster)

st <- data.frame(state.x77)


clust <- qs$cluster
clust

std <- function(x) {
  return((x-min(x)) / max(x) - min(x))
}
mydata <- apply(st, 2, std)
fit <- kmeans(x = mydata, center = 5)
fit

clusplot(st,
         fit$cluster,
         color = T,
         shade = T,
         labels = 2,
         line = 0)
subset(st, clust == 1)




#문2)
#mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.

#• 군집의 수는 2로 한다.
#• Sonar 데이터셋에서 마지막에 있는 Class 열은 제외하고 군집화를 실행한다.

library( mlbench )
data( "Sonar" ) 			# 데이터셋 불러오기

so <- Sonar[,-61]
so

std <- function(x) {
  return((x-min(x)) / max(x) - min(x))
}

stdt <- apply(st, 2, std)
fit2 <- kmeans(x = so, center = 2)
fit2

clusplot(so,
         fit2$cluster)




#문3) 
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 
# k-최근접 이웃 알고리즘을 이용하여 모델을 만들고 예측 정확도를 측정하시오.

#. Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
#. Sonar 데이터셋에서 홀수 번째 데이터(관측값)를 훈련용 데이터로 하고, 짝수번째 데이터(관측값)를 테스트용 데이터로 한다.
# k-최근접 이웃에서 k를 3, 5, 7로 다르게 하여 예측 정확도를 비교한다.

library(mlbench)

head(Sonar)
nrow(Sonar)
sss <- Sonar[-61]

tr.idxz <- as.integer(rownames(Sonar))
tr.idxz
jj <- subset(tr.idxz, tr.idxz %% 2 != 0)

sn <- Sonar[jj,]

sn2 <- Sonar[-jj,]
dim(sn)
dim(sn2)

# 훈련용 / 테스트용 데이터 준비

ds.tr <- Sonar[jj, -61]  # 훈련용
ds.ts <- Sonar[-jj, -61] # 테스트용
cl.tr <- factor(Sonar[jj, 61]) # 훈련용 그룹정보
cl.ts <- factor(Sonar[-jj, 61]) # 테스트용 그룹정보

acc <- mean(pred == cl.ts)
acc
table(pred,cl.ts)

pred <- knn(ds.tr,ds.ts,cl.tr,k = 3, prob = T)
pred

pred <- knn(ds.tr,ds.ts,cl.tr,k = 5, prob = T)
pred

pred <- knn(ds.tr,ds.ts,cl.tr,k = 7, prob = T)
pred




#문4) 
#mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여 모델을 만들고 예측 정확도를 측정하시오.

#. Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
#. k-최근접 이웃에서 k는 3으로 한다.
# 5-fold 교차 검증 방법으로 예측 정확도를 측정한다.


# 훈련용 / 테스트용 데이터 준비

ds.tr <- Sonar[jj, -61]  # 훈련용
ds.ts <- Sonar[-jj, -61] # 테스트용
cl.tr <- factor(Sonar[jj, 61]) # 훈련용 그룹정보
cl.ts <- factor(Sonar[-jj, 61]) # 테스트용 그룹정보

acc <- mean(pred == cl.ts)
acc
table(pred,cl.ts)



library(cvTools)


k = 5
folds <- cvFolds(nrow(Sonar), K = k)

acc <- c()
for (i in 1:k) {
  ts.idx <- folds$which == i
  ds.tr <- Sonar[jj, -61]  # 훈련용
  ds.ts <- Sonar[-jj, -61] # 테스트용
  cl.tr <- factor(Sonar[jj, 61]) # 훈련용 그룹정보
  cl.ts <- factor(Sonar[-jj, 61]) # 테스트용 그룹정보
  pred <- knn(ds.tr,ds.ts,cl.tr, k = 3)
  acc[i] <- mean(pred == cl.ts)
}
acc
mean(acc)









