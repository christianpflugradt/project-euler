function solve()
    # there is a hit in the first 10_000 numbers
    # the minimal absolute difference is smaller than 1_000_000_000
    # both can be tuned which obviously has an impact on this script's runtime
    pentagonals = Set{Int}()
    for i in 1:10_000
        push!(pentagonals, i * (3 * i - 1) / 2)
    end
    minimum = 1_000_000_000
    for a in pentagonals, b in pentagonals
        c = a + b
        d = a - b
        if d > 0
            if in(c, pentagonals) && in(d, pentagonals)
                minimum = min(minimum, a - b)
            end
        end
    end
    return minimum
end

println(@time solve())
