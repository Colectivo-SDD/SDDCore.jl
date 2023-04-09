
"""
Useful functions, structures and type aliases, common to the SDD packages ecosystem.
"""
module SDDCore

#include("tuples.jl")
include("functionutils.jl")
include("iteratives.jl")
include("sweepregions.jl")

export
    #PairInteger, # ???
    #PairReal,
    functionkind2D,
    functionkind3D,
    createtopoint2D,
    foriterative,
    foriterativeR,
    foriterativeC,
    foriterativeR2,
    iterative,
    #@iterative, iterative, # deprecated macros
    #@iterativeR2, iterativeR2,
    @sweeprectregion, sweeprectregion

end # module
