
"""
    iterative(T,f,n) -> Function

Create the \$n\$-iterative of a function \$f\$.
"""
@inline function iterative(::Type{T}, f::Function, n::Integer) where {T <: Number}
    function fn(t::T)
        tn = t
        for i in 1:n
            tn = f(tn)
        end
        tn
    end  # function
end # function

"""
    iterative(f,n) -> Function

Create the \$n\$-iterative of a function \$f:\\mathbb{C}\\rightarrow\\mathbb{C}\$,
receiving any numerical type.
"""
iterative(f::Function, n::Integer) = iterative(Number,f,n)

"""
    iterativeR(f,n) -> Function

Create the \$n\$-iterative of a function \$f:\\mathbb{R}\\rightarrow\\mathbb{R}\$.
"""
iterativeR(f::Function, n::Integer) = iterative(Real,f,n)

"""
    iterativeC(f,n) -> Function

Create the \$n\$-iterative of a function \$f:\\mathbb{C}\\rightarrow\\mathbb{C}\$.
"""
iterativeC(f::Function, n::Integer) = iterative(Complex,f,n)

"""
    iterativeR2(f,n) -> Function

Create the \$n\$-iterative of a function \$f:\\mathbb{R}^2\\rightarrow\\mathbb{R}^2\$.
"""
@inline function iterativeR2(f::Function, n::Integer)
    function fn(x::Real, y::Real)
        xn, yn = x, y
        for i in 1:n
            xn, yn = f(xn,yn)
        end
        xn, yn
    end # function
end # function
