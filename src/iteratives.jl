
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

\$f\$ must receive and return the same data type.
"""
function iterative(f::Function, n::Int)
    fn = f
    for i in 2:n
        fn = f∘fn
    end
    fn
end # function


#="""
    @iterative(f,n)

Create the \$n\$-iterative of an one-valuated function \$f\$.
"""
macro iterative(f,n)
    expr_fx = Expr(:call, f, :x)
    #expr_fx = :(f(x))
    N = :($n)
    for i in 2:N
        expr_copy = copy(expr_fx)
        expr_fx.args[2] = expr_copy
    end
    :(x->$expr_fx)
end=#

#="""
    @iterativeR2(f,n)

Create the \$n\$-iterative of a function \$f:\\mathbb{R}^2\\rightarrow\\mathbb{R}^2\$.
"""
macro iterativeR2(f,n)
    expr_fxy = :($f(x,y))
    N = :($n)
    if N > 1
        expr_fxy = :(f(f(x,y)...))
        for i in 3:N
            expr_copy = copy(expr_fxy)
            expr_fxy.args[2] = expr_copy
        end
    end
    :((x,y)->$expr_fxy)
end
=#

#=
function iterative_ex(f::Function, n::Int)
    expr_fx = :($f(x))
    for i in 2:n
        expr_copy = copy(expr_fx)
        expr_fx.args[2] = expr_copy
    end
    return :(x->$expr_fx)
end


function iterativeR2_ex(f::Function, n::Int)
    expr_fxy = :(f(x,y))
    if n > 1
        expr_fxy = :(f(f(x,y)...))
        for i in 3:n
            expr_copy = copy(expr_fxy)
            expr_fxy.args[2] = expr_copy
        end
    end
    return :((x,y)->$expr_fxy)
end
=#

#=
function iterative_evex(f::Function, n::Int)
    expr_fx = :($f(x))
    for i in 2:n
        expr_copy = copy(expr_fx)
        expr_fx.args[2] = expr_copy
    end
    return eval( :(x->$expr_fx) ) # Useless evak in module SDDCore...
end


function iterativeR2_evex(f::Function, n::Int)
    expr_fxy = :(f(x,y))
    if n > 1
        expr_fxy = :(f(f(x,y)...))
        for i in 3:n
            expr_copy = copy(expr_fxy)
            expr_fxy.args[2] = expr_copy
        end
    end
    return eval( :((x,y)->$expr_fxy) ) # Useless evak in module SDDCore...
end
=#
