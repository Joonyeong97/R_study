# Remove all objects from workspace.
remove (list = objects() )


install.packages("deSolve")
# Load add-on packages - deSolve - contains lsoda function - differential equation solver.
library (deSolve) 

seir_model = function (current_timepoint, state_values, parameters)
{
  # create state variables (local variables)
  S = state_values [1]        # susceptibles
  E = state_values [2]        # exposed
  I = state_values [3]        # infectious
  R = state_values [4]        # recovered
  
  with ( 
    as.list (parameters),     # variable names within parameters can be used 
    {
      # compute derivatives
      dS = (-beta * S * I)
      dE = (beta * S * I) - (delta * E)
      dI = (delta * E) - (gamma * I)
      dR = (gamma * I)
      
      # combine results
      results = c (dS, dE, dI, dR)
      list (results)
    }
  )
}


contact_rate = 21# 하루에 접촉된 사람수
transmission_probability = 0.008       # 전염율
infectious_period = 14                 # 전염기간
latent_period = 14                     # 잠복기간


beta_value = contact_rate * transmission_probability
gamma_value = 1 / infectious_period
delta_value = 1 / latent_period


Ro = beta_value / gamma_value
parameter_list = c (beta = beta_value, gamma = gamma_value, delta = delta_value)

gumsaing = 35555 #검사중
gumsaend = 85484 #검사완료
gyuki = 4750 #감염자
h = 62 #격리해제+사망자

result = gumsaing + gumsaend + gyuki + h


#W = gumsaing/result*1000        # S 감염대상자
#Z = gumsaend/result*1000           # E 접촉자
#X = gyuki/result*1000           # i 감염자
#Y = h/result*1000           # r 회복군

#W = 9990        # susceptible hosts
#X = 1           # infectious hosts
#Y = 0           # recovered hosts
#Z = 9           # exposed hosts

N = W + X + Y + Z

initial_values = c (S = W/N, E = X/N, I = Y/N, R = Z/N)

timepoints = seq (0, 50, by=1)
timepoints

output = lsoda(initial_values, timepoints, seir_model, parameter_list)

#plot (S ~ time, data = output, type='b', col = 'blue')       
#plot (E ~ time, data = output, type='b', col = 'pink')  
#plot (I ~ time, data = output, type='b', col = 'red') 
#plot (R ~ time, data = output, type='b', col = 'green')  
output

# susceptible hosts over time
plot (S ~ time, data = output, type='b', ylim = c(0,1), col = 'blue', ylab = 'S, E, I, R', main = 'SEIR epidemic') 
par (new = TRUE)    
plot (E ~ time, data = output, type='b', ylim = c(0,1), col = 'pink', ylab = '', axes = FALSE)
par (new = TRUE) 
plot (I ~ time, data = output, type='b', ylim = c(0,1), col = 'red', ylab = '', axes = FALSE) 
par (new = TRUE)  
plot (R ~ time, data = output, type='b', ylim = c(0,1), col = 'green', ylab = '', axes = FALSE)

