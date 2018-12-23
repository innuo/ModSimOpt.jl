module ModSimOpt
        using Distributions

        export
        ConditionalDistribution,
        GaussianConditional,
        DiscreteConditional,

        ### methods
        inconsistent_gaussian_gibbs

        ### source files
        include("incompatible_gibbs.jl")
end # module
