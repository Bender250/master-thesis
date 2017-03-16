# LTS learning

x = rep(0, 30*100)
base = 0.99
m1 = 0.9
m2 = 0.99
for(i in 0:29) {
  tmp = base
  for (j in 1:100) {
    x[i*100 + j] = 1-tmp
    tmp = tmp*m2
  }
  base = base * m1
}

# plot probability density as a line
plot(1:3000, y=x, type='l', ylab='fitness', xlab='iteration')

# SA probability

x = rep(0, 30*100)
base = 1
m1 = 0.9
m2 = 0.9
for(i in 0:29) {
  tmp = base
  for (j in 1:100) {
    x[i*100 + j] = tmp
    tmp = tmp*m2
  }
  base = base * m1
}

# plot probability density as a line
plot(1:3000, y=x, type='l', ylab='probability', xlab='iteration')