using Distributions, Plots

# Take a value for α and perform the following random walk  x_t+1 = α*x_t+σ*ϵ_t+1
# return the vector of first passage times for 100 simulations
# and the mean first passage time

function rand_walk(α)

    #parameters
    σ = .2
    tmax = 200
    x= ones(tmax)
    dist = Normal(0,1)
    ϵ = ones(tmax)
    sims = 100
    t_0::Array{Float64, 1} = ones(sims)

    for i=1:100
        #random walk: x_t+1 = α*x_t+σ*ϵ_t+1
        for t=2:tmax-1
            ϵ[t]=rand(dist)
            x[t]=α*x[t-1] + σ*ϵ[t]
        end
        x[tmax]=0
        #first passage time: T_a = min{t|x_t < a}
        t_0[i] = findfirst(t->t<=0, x)
    end
    (t_0, mean(t_0))
end

histogram(rand_walk(1)[1]; bins = 0:25:200)
