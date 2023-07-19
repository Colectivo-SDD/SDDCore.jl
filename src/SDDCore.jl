
"""
Useful functions, structures and type aliases, common to the SDD packages ecosystem.
"""
module SDDCore

#include("tuples.jl")
include("functionutils.jl")
include("iterates.jl")
include("sweepregions.jl")

export
    #PairInteger, # ???
    #PairReal,
    functionkind2D,
    functionkind3D,
    createtopoint2D,
    foriteratef,
    foriteratefR,
    foriteratefC,
    foriteratefR2,
    iteratef,
    #@iterative, iterative, # deprecated macros
    #@iterativeR2, iterativeR2,
    @sweeprectregion, sweeprectregion

end # module
