module ModSimOpt
        using Distributions
        using Plots

        export
        ConditionalDistribution,
        GaussianConditional,
        DiscreteConditional,

        ### methods
        inconsistent_gaussian_gibbs

        ### source files
        include("incompatible_gibbs.jl")
end # module
