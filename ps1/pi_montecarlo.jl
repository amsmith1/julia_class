
using Statistics
N=100000
x=rand(N)
pi_approx = mean(4*sqrt.(1 .- x.^2))

error = pi - pi_approx
