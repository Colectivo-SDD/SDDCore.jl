
"""
    foriterative(T,f,n) -> Function

Create the \$n\$-iterative of an one-valuated function \$f\$.
"""
@inline function foriterative(::Type{T}, f::Function, n::Integer) where {T <: Number}
    function fn(t::T)
        tn = t
        for i in 1:n
            tn = f(tn)
        end
        tn
    end  # function
end # function

"""
    foriterative(f,n) -> Function

Create the \$n\$-iterative of a function \$f:\\mathbb{C}\\rightarrow\\mathbb{C}\$,
receiving any numerical type.
"""
foriterative(f::Function, n::Integer) = foriterative(Number,f,n)

"""
    foriterativeR(f,n) -> Function

Create the \$n\$-iterative of a function \$f:\\mathbb{R}\\rightarrow\\mathbb{R}\$.
"""
foriterativeR(f::Function, n::Integer) = foriterative(Real,f,n)

"""
    foriterativeC(f,n) -> Function

Create the \$n\$-iterative of a function \$f:\\mathbb{C}\\rightarrow\\mathbb{C}\$.
"""
foriterativeC(f::Function, n::Integer) = foriterative(Complex,f,n)

"""
    foriterativeR2(f,n) -> Function

Create the \$n\$-iterative of a function \$f:\\mathbb{R}^2\\rightarrow\\mathbb{R}^2\$.
"""
@inline function foriterativeR2(f::Function, n::Integer)
        function fn(x::Real, y::Real)
        xn, yn = x, y
        for i in 1:n
            xn, yn = f(xn,yn)
        end
        xn, yn
    end # function
end # function


"""
    iterative(f,n) -> Function

Create the \$n\$-th iterative of a given function \$f\$.
The function \$f\$ must receive and return the same data type.
"""
function iterative(f::Function, n::Int)
    fn = f
    for i in 2:n
        fn = f∘fn
    end
    fn
end # function
