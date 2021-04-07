
"""
Useful functions, structures and type aliases, common to the SDD packages ecosystem.
"""
module SDDCore

include("tuples.jl")
include("iteratives.jl")
include("sweepregions.jl")

export
    PairInteger,
    PairReal,
    iterative,
    iterativeR,
    iterativeC,
    iterativeR2,
    @sweeprectregion, sweeprectregion

end # module
