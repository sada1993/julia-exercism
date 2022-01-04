import Base.show
using Printf

import Base.+
import Base.-
import Base.*
import Base./
import Base.^
import Base.conj
import Base.abs
import Base.real
import Base.imag
import Base.exp
import Base.isapprox

struct ComplexNumber <: Number
    re::Number
    im::Number
end

const ij = ComplexNumber(0,1)

function show(io::IO, x::ComplexNumber)
    if x.im < 0
        str = string(x.re," - i",-x.im)
    else
        str = string(x.re," + i",x.im)
    end

    @printf(io,"%s", str)
end

function +(x::ComplexNumber, y::ComplexNumber)
    ComplexNumber(x.re + y.re, x.im+y.im)
end

function +(x::ComplexNumber, y::ComplexNumber)
    ComplexNumber(x.re + y.re, x.im+y.im)
end

function +(x::Real, y::ComplexNumber)
    ComplexNumber(x+y.re, y.im)
end

function -(x::ComplexNumber, y::ComplexNumber)
    ComplexNumber(x.re - y.re, x.im-y.im)
end

function *(x::ComplexNumber, y::ComplexNumber)
    ComplexNumber(x.re*y.re - x.im * y.im, x.im*y.re + x.re*y.im)
end

function *(x::Real, y::ComplexNumber)
    ComplexNumber(x,0) * y
end

function *(x::ComplexNumber, y::Real)
    ComplexNumber(y,0) * x
end

function /(x::ComplexNumber, y::ComplexNumber)
    result = x * reciprocal(y)
    if rem(result.re,1) != 0
        result_re = round(result.re, digits = 2)
    elseif rem(result.re,1) == 0
        result_re = round(Int, result.re)
    else
        result_re = result.re
    end

    if rem(result.im,1) != 0
        result_im = round(result.im, digits = 2)
    elseif rem(result.im,1) == 0
        result_im = round(Int, result.im)
    else
        result_im = result.im
    end

    return ComplexNumber(result_re, result_im)

end

function reciprocal(x::ComplexNumber)
    ComplexNumber(x.re/(abs(x)^2), -x.im/(abs(x))^2)
end

function ^(x::ComplexNumber, y::Int)
    for i in 1:y-1
        x = x*x
    end
    return x
end

function conj(x::ComplexNumber)
    ComplexNumber(x.re, -x.im)
end

function abs(x::ComplexNumber)
    sqrt(x.re ^ 2 + x.im^2)
end

function real(x::ComplexNumber)
    x.re
end

function imag(x::ComplexNumber)
    x.im
end

function exp(x::ComplexNumber)
    exp(x.re) * ComplexNumber(cos(x.re), sin(x.im))
end

function isapprox(x::ComplexNumber, y::ComplexNumber)
    isapprox(x.re, y.re) && isapprox(x.im, y.im)
end
