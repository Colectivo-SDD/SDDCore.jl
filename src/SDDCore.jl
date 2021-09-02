
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
    foriterative,
    foriterativeR,
    foriterativeC,
    foriterativeR2,
    compose,
    @iterative, iterative,
    @iterativeR2, iterativeR2,
    @sweeprectregion, sweeprectregion

end # module
