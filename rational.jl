# Rational Example

struct RationalNumber
    n::Integer
    d::Integer
    function RationalNumber(n, d)
        (n, d) = _normalize(n, d)
        return new(n, d)
    end
end

function _normalize(n::Integer, d::Integer)
    g = gcd(n, d)
    m = d < 0 ? -1 : 1
    (m * n ÷ g, m * d ÷ g)
end

Base.:+(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.n+r2.n, r1.d+r2.d)
Base.:-(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.n-r2.n, r1.d-r2.d)
Base.:*(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.n*r2.n, r1.d*r2.d)
Base.:/(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.n*r2.d, r1.d*r2.n)

str(r::RationalNumber) = "$(r.n)/$(r.d)"

# Demonstration

x = half = RationalNumber(5, 10)
println("One half can be expressed as $(half.n)/$(half.d)")

y = two_thirds = RationalNumber(2,3)

ystr = str(y)
println("two thirds is $(ystr)")
println("two thirds is $(str(y))")

println("x+y = $(str(x+y))")
println("x-y = $(str(x-y))")
println("x*y = $(str(x*y))")
println("x/y = $(str(x/y))")
