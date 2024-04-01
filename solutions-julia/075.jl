function solve()
    L = 1_500_000
    l = Dict{Int, Int}()
    count = 0
    for a in 1:L-2, b in a+1:L-a-1
        c = sqrt(a^2 + b^2)
        if isinteger(c)
            c = ceil(Int, c)
            d = a + b + c
            if d < L
                if !(haskey(l, d))
                    push!(l, d => 0)
                end
                push!(l, d => l[d] + 1)
            end
        end
    end
    ones = 0
    for v in values(l)
        if v == 1
            ones += 1
        end
    end
    return ones
end

println(@time solve())
