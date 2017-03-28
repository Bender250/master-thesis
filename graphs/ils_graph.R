# # LTS learning
# 
# x = rep(0, 30*100)
# base = 0.99
# m1 = 0.9
# m2 = 0.99
# for(i in 0:29) {
#   tmp = base
#   for (j in 1:100) {
#     x[i*100 + j] = 1-tmp
#     tmp = tmp*m2
#   }
#   base = base * m1
# }
# 
# # plot probability density as a line
# plot(1:3000, y=x, type='l', ylab='fitness', xlab='iteration')

# SA probability

# x = rep(0, 30*100)
# base = 1
# m1 = 0.9
# m2 = 0.9
# for(i in 0:29) {
#   tmp = base
#   for (j in 1:100) {
#     x[i*100 + j] = tmp
#     tmp = tmp*m2
#   }
#   base = base * m1
# }

epochs = 30
len = 10

temp1 = 500
temp2 = 500
temp3 = 500
cool_ratio = 0.7
cool_ratio2 = 0.9
cool_ratio3 = 0.35

x = 1:(epochs*len)
y1 = rep(0, epochs*len)
y2 = rep(0, epochs*len)
y3 = rep(0, epochs*len)

for(i in 0:(epochs-1)) {
  tmp = temp1
  temp3 = 500
  for (j in 1:len) {
    y1[i*len + j] = exp(-1/temp1)
    y2[i*len + j] = exp(-1/temp2)
    y3[i*len + j] = exp(-1/temp3)
    temp1 = temp1 * cool_ratio
    temp2 = temp2 * cool_ratio2
    temp3 = temp3 * cool_ratio3
  }
  temp1 = tmp * cool_ratio
}

# plot probability density as a line
plot(x, y3, type='l', ylab='probability', xlab='epoch', col='gray')
lines(x, y2, type='l', col='red')
lines(x, y1, type='l', col='blue')