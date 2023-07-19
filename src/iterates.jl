
"""
    foriteratef(T,f,n) -> Function

Create the \$n\$-iteratef of an one-valuated function \$f\$.
"""
@inline function foriteratef(::Type{T}, f::Function, n::Integer) where {T <: Number}
    function fn(t::T)
        tn = t
        for i in 1:n
            tn = f(tn)
        end
        tn
    end  # function
end # function

"""
    foriteratef(f,n) -> Function

Create the \$n\$-iteratef of a function \$f:\\mathbb{C}\\rightarrow\\mathbb{C}\$,
receiving any numerical type.
"""
foriteratef(f::Function, n::Integer) = foriteratef(Number,f,n)

"""
    foriteratefR(f,n) -> Function

Create the \$n\$-iteratef of a function \$f:\\mathbb{R}\\rightarrow\\mathbb{R}\$.
"""
foriteratefR(f::Function, n::Integer) = foriteratef(Real,f,n)

"""
    foriteratefC(f,n) -> Function

Create the \$n\$-iteratef of a function \$f:\\mathbb{C}\\rightarrow\\mathbb{C}\$.
"""
foriteratefC(f::Function, n::Integer) = foriteratef(Complex,f,n)

"""
    foriteratefR2(f,n) -> Function

Create the \$n\$-iteratef of a function \$f:\\mathbb{R}^2\\rightarrow\\mathbb{R}^2\$.
"""
@inline function foriteratefR2(f::Function, n::Integer)
        function fn(x::Real, y::Real)
        xn, yn = x, y
        for i in 1:n
            xn, yn = f(xn,yn)
        end
        xn, yn
    end # function
end # function


"""
    iteratef(f,n) -> Function

Create the \$n\$-th iteratef of a given function \$f\$.
The function \$f\$ must receive and return the same data type.
"""
function iteratef(f::Function, n::Int)
    fn = f
    for i in 2:n
        fn = f∘fn
    end
    fn
end # function


#=
"""
    @iteratef(f,n)

Create the \$n\$-iteratef of an one-valuated function \$f\$.
"""
macro iteratef(f,n)
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
    @iteratefR2(f,n)

Create the \$n\$-iteratef of a function \$f:\\mathbb{R}^2\\rightarrow\\mathbb{R}^2\$.
"""
macro iteratefR2(f,n)
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
function iteratef_ex(f::Function, n::Int)
    expr_fx = :($f(x))
    for i in 2:n
        expr_copy = copy(expr_fx)
        expr_fx.args[2] = expr_copy
    end
    return :(x->$expr_fx)
end


function iteratefR2_ex(f::Function, n::Int)
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
function iteratef_evex(f::Function, n::Int)
    expr_fx = :($f(x))
    for i in 2:n
        expr_copy = copy(expr_fx)
        expr_fx.args[2] = expr_copy
    end
    return eval( :(x->$expr_fx) ) # Useless evak in module SDDCore...
end


function iteratefR2_evex(f::Function, n::Int)
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
