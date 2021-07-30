# Create a Range object

struct Range{T}
    start::T
    step::T
    stop::T
end

function Base.getindex(r::Range, i::Int)
    start = r.start
    target = start + i*r.step
    if target <= r.stop
        return target
    else
        throw(DomainError("exceeding range limit $(target) > $(r.stop)"))
    end
end

r = Range(0.0,1.0,10.0)
for i in 1:10
    ri = r[i]
    println("r[$(i)] is $(ri)")
end

# Extension of the Exercise
Base.length(r::Range) = Int((r.stop - r.start) / r.step)

function Base.iterate(r::Range, state = 1)
target = r.start + state * r.step
if target <= r.stop
    return target, state+1
else
    return nothing
end
end

for i in r
    println("Next in range is $(i)")
end

# Whackadoodle

mutable struct MyIterator
    n::Int
    prev::Float64
end

aardvark = MyIterator(10,0.0)

println("The aardvark iterator has $(aardvark.n) elements")

function Base.iterate(i::MyIterator, s = 1)
s > i.n && return nothing
if s==1
    i.prev = rand()
    return i.prev, 2
elseif isodd(s)
    i.prev = i.prev/rand()
    return i.prev, s+1
else
    i.prev = i.prev*rand()
    return i.prev,s+1
end
end

for i in aardvark
    println("Next in aardvark is $(i)")
end

w= MyIterator(500,0.0)
using Statistics: mean, std
std(w)