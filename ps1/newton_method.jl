function f(x)
    (x-1)^3
end

function fprime(x)
    3(x-1)^2
end

function g(x)
    x^2
end

function gprime(x)
    2x
end

function newton(x0, f, fprime, maxerror, maxiter)
    x1=x0-f(x0)/fprime(x0)
    error = abs(x1-x0)
    count=1
    while error>= maxerror
        x1=x0-f(x0)/fprime(x0)
        error = abs(x1-x0)
        x0 = x1
        count = count+1
        if count == maxiter
            break
        end
    end
    x1
end
