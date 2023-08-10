
"""
Useful functions, structures and type aliases, common to the SDD packages ecosystem.
"""
module SDDCore

#using Reexport

#@reexport using StaticArrays


#include("tuples.jl")
include("functionutils.jl")
#include("fixedpoints.jl") # Future, using interval arithmetics
include("iterates.jl")
include("sweepregions.jl")

export
    #PairInteger, # ???
    #PairReal,
    functionkind2D,
    functionkind3D,
    createtopoint2D,
    vectorize,
    abs, abs2,
    #fixedpoints,
    #periodicpoints,
    foriteratef,
    foriteratefR,
    foriteratefC,
    foriteratefR2,
    iteratef,
    ^,
    #@iterative, iterative, # deprecated macros
    #@iterativeR2, iterativeR2,
    @sweeprectregion, sweeprectregion

end # module
