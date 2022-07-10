using Plots, Distributions

#variable draws
dist = Normal(0,1)
n = 50
x = rand(dist, n, 2)
x1 = x[:,1]
x2 = x[:,2]

#parameters
a = 0.1
b = 0.2
c = 0.5
d = 1
σ = 0.1
sims = 200

#draw simulations
w=rand(dist,n,sims)
for i=1:sims
    y[:,i]=a.*x1 .+ b.*x1.^2 .+ c.*x2 .+d + σ.*w[:,i]
end

#ols
X=hcat(x1, x1.^2, x2, ones(n))
β_ols = inv(X' * X) * X' * y

a_sim=β_ols[1,:]
b_sim=β_ols[2,:]
c_sim=β_ols[3,:]
d_sim=β_ols[4,:]

#histograms
histogram(a_sim)

histogram(b_sim)

histogram(c_sim)

histogram(d_sim)
