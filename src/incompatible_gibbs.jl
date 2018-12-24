std_rnorm = Normal()

abstract type ConditionalDistribution end

struct GaussianConditional <: ConditionalDistribution
    mu_intercept::Real
    mu_slope::Real
    sigma::Real
end

struct DiscreteConditional <: ConditionalDistribution
    p_0::Real
end

function sample(conditional::GaussianConditional, condition)
    x = rand(std_rnorm, 1)
    return x[1] * conditional.sigma + conditional.mu_intercept +
        conditional.mu_slope * condition
    return x
end

function sample(conditional::DiscreteConditional, condition)

end


function gibbs_sampler(px_y, py_x; y0=0, num_samples=10000, burn_in=100, thin=10)
    x_vec = zeros(0)
    y_vec = zeros(0)
    y = y0
    for i in 1:num_samples
        x = sample(px_y, y)
        y = sample(py_x, x)
        if((i > burn_in) && (i % thin == 0))
            push!(x_vec, x)
            push!(y_vec, y)
        end
    end
    return x_vec, y_vec
end

function check_discrete_compatibility(px_y, py_x)

end

function check_gaussian_compatibility(px_y, py_x)

end


function inconsistent_gaussian_gibbs()
    px_y = GaussianConditional(0, 1.5, 2)
    py_x = GaussianConditional(0, 0.5, 1)
    x,y = gibbs_sampler(px_y, py_x)
    p = plot(x, y, seriestype=:scatter, xlabel="X", ylabel="Y", legend=false)
    display(p)
    return x,y
end
