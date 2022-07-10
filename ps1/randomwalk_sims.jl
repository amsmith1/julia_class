using Distributions, Plots

function rand_walk(α)

    #parameters
    σ = .2
    tmax = 200
    x= ones(tmax)
    dist = Normal(0,1)
    ϵ = ones(tmax)
    sims = 100
    t_0 = ones(sims)

    for i=1:100
        #random walk: x_t+1 = α*x_t+σ*ϵ_t+1
        for t=2:tmax-1
            ϵ[t]=rand(dist)
            x[t]=α*x[t-1] + σ*ϵ[t]
        end
        x[tmax]=0
        #first passage time: T_a = min{t|x_t < a}
        t_0[i] = convert(Float64, findfirst(t->t<=0, x))
    end
    (t_0, mean(t_0))
end

histogram(rand_walk(1)[1]; bins = 0:25:200)
