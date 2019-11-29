#
#  R 프로그래밍 1일차
# 
# first.R
#
# 작성자 : 임영택
#
# 최초 작성일 : 2019.11.26
# 
#
print("Hello World!!!")

number <- 10
number2 = 100
number3 <- number

numberValue <- 1          # camel 표기법
str_value <- "R Language" # snake 표기법
booleanbalue <- TRUE


numberValue <- "R script"
numberValue <- 1

print(numberValue)
print(str_value)
print(booleanbalue)



cat("Numeric number :", numberValue, "\n")
cat("string : ", str_value, "\n")
cat("Boolean value : ", booleanbalue, "\n")


#numberValue <- scan()


cat("Numeric number : ", numberValue, "\n")

number1 <- 10
number2 <- 20
resultAdd <- number1 + number2
resultSub <- number1 - number2
resultMul <- number1 * number2
resultDiv <- number1 / number2
resultRem <- number1 %% number2
resultSec <- number2 ** 5

print(resultAdd)
print(resultSub)
print(resultMul)
print(resultDiv)
print(resultRem)
print(resultSec)

number1 <- 0
number1
number1 <- number1 + 10
number1
number1 <- number1 + 10
number1
number1 <- number1 + 10
number1


number2 <- 100
number1 <- number2 +10
number1
number2

print((number1 + 10) * number2 / 2)

number300 <- 0
number400 <- 0
number300 <- number400 + 10
number300

number301 <- number * 2
number301




number1 <- 10.5
number2 <- 10
print(number1 > number2)
print(number1 >= number2)
print(number1 < number2)
print(number1 <= number2)
print(number1 == number2)
print(number1 != number2)


print(number1 > 10 & number2 > 10)    # AND
print(number1 > 10 | number2 > 10)    # OR
print( !number1 > 10 )                # NOT



number <- 10
str <- "1"
result <- number + str
print(result)



# 제 어 구 조 - 선 택 구 조
#
#
job.type <- 'A'

if (job.type == 'B') {
  bonus <- 200        # 참 일 때
} else {
  bonus <- 100        # 거짓 일때

  }
cat("job type : ", job.type, "\t\tbonus :" , bonus)


job.type <- 'B'
if (job.type == 'A') {
bonus <- 200
}
cat("job type : ", job.type, "\t\tbonus :" , bonus)



score <- 85

if( score >= 90) {
  grade <- 'A'
} else if (score >= 80) {
  grade <- 'B'
} else if (score >= 70) {
  grade <- 'C'
} else if (score >= 60) {
  grade <- 'D'
} else {
  grade <- 'F'  
}
cat ("score : ", score, "\t\t grade : ", grade)



number <- 0

if ( number != 0 ) {
  if ( number %% 2 == 0 ) {
   cat (number, "짝수")
  } else {
   cat (number, "홀수")
  }
} else {
  cat ("0 입니다.")
}




a <- 5
b <- 20

if ( a > 5 & b > 5) {
  cat ( a, " > 5 and ", b, " > 5 " )
} else {
  cat ( a, " < = 5 or ", b, " < = 5 ")
}


a <- 10
b <- 20

if ( a > b ) {
  c <- a
} else {
  c <- b
}
cat (" a = ", a, "\t b = ", b, "\ c = ", c )


c <- ifelse( a > b, a, b)
cat (" a = ", a, "\t b = ", b, "\t c = ", c )





a <- 11
b <- 11
c <- 19
max1 <- 0

if ( a > b ) {
  max1 <- a
} else if ( b > c) {
  max1 <- b
} else {
  max1 <- c
}

max1


a <- 19
b <- 18
c <- 15
max1 <- a

if ( b > max1 ) {
  max1 <- b
}

if ( c > max1 ) {
  max1 <- c
}
max1


#
# 반복구조
#
# for문

for ( i in 1:10) {
  print( '*' )
}

multiple = 2
for ( multiple in 2:9) {
  for ( i in 1:9) {
    cat(multiple, ' X ', i, '=', multiple * i, '\n')
  }
}


# WHILE 문  
i <- 1
while ( i <= 10) {
  print(i)
  i <- i + 1
}


multiple <- 2
i <- 2
while (multiple <= 9) {
while ( i <= 9 ) {
  cat(multiple, ' X ', i, ' = ', multiple * i, '\n')
  i <- i + 1
}
  multiple <- multiple + 1
}



for ( i in 1:100) {
  cat(i,' ')
  if ( i %% 10 == 0 ) {
    print('\n')
  }
}


linecount <- 1
for ( i in 1:100 ) {
cat( i, ' ')
  linecount <- linecount + 1
 if (linecount > 10) {
   print( '\n' )
   linecount <- 1
 }
}

a <- 0
b <- 0
c <- 1
count <- 0
for ( i in 1:1000) {

  a <- i %% 3
  b <- i %% 5
  
  if ( a == 0 | b == 0 ) {
    count <- count + 1
    cat( i , ' ')
    c <- c + 1
  }
  
  if ( c > 10 ) {
    c <- 1
    cat ('\n')
  }
  if ( i == 1000 ) {
    cat ("\n 총 카운트 숫자는",count , "개 입니다.")
  }
  }



