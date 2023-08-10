
using Reexport

@reexport using StaticArrays


"""
Verifying if a given function is suitable for dynamics in the complex plane or
the cartesion plane, and the returning a symbol identifiying its domain.
"""
function functionkind2D(f::Function)
    try
        @assert f(1.0+1.0im) isa Number
        return :onnumbers
    catch
        try
            @assert f([1.0,1.0]) isa AbstractVector && length(f([1.0,1.0])) == 2
            return :onvectors
        catch
            @error "Non-suitable function for 2D dynamic."
        end
    end
    :error
end


"""
"""
function functionkind3D(f::Function)
    try
        @assert f([1.0,1.0,1.0]) isa Vector && length(f([1.0,1.0,1.0])) == 3
        return :onvectors
    catch
        @error "Non-suitable function for 3D dynamic."
    end
    :error
end


"""
Create a function "topoint" from a pair of real numbers to a complex or vector point.
"""
function createtopoint2D(kind::Symbol)
    if kind == :onvectors
        return (x::Real, y::Real) -> SVector(x,y)
    end
    (x::Real, y::Real) -> complex(x,y)
end



"""
Create a function `AbstractVector` \$\\mapsto\$ `SVector` from a function \$f(x,y)=(f_1(x,y),f_2(x,y))\$
(or \$f(x,y,z)=(f_1(x,y,z),f_2(x,y,z),f_3(x,y,z))\$ if is the case).
"""
function vectorize(f::Function)
    function fv(p::AbstractVector{T}) where {T<:Real}
        SVector(f(p...)...)
    end
end


import Base: abs, abs2

"""
Function norm \$||\\cdot||:\\mathbb{R}^n\\rightarrow\\mathbb{R}\$ given by

    \$||(x_1,\\dots,x_n)||=\\sqrt{x_1^2+\\dots+x_n^2}\$
"""
abs(p::AbstractVector{T}) where {T<:Real} = sqrt(sum(p.^2))

"""
Function squared norm \$||\\cdot||^2:\\mathbb{R}^n\\rightarrow\\mathbb{R}\$ giveb by

    \$||(x_1,\\dots,x_n)||^2=x_1^2+\\dots+x_n^2\$
"""
abs2(p::AbstractVector{T}) where {T<:Real} = sum(p.^2)
