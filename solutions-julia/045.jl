function solve()
    # a limit of 10_000_000_000 is sufficient to find a hit
    # if nothing is found, -1 is returned
    limit = 10_000_000_000
    pentagonals = Set{Int}()
    hexagonals = Set{Int}()
    n = 166
    next = 1
    while next < limit
        next = n * (3 * n - 1) / 2
        push!(pentagonals, next)
        n += 1
    end
    n = 144
    next = 1
    while next < limit
        next = n * (2 * n - 1)
        push!(hexagonals, next)
        n += 1
    end
    n = 286
    next = 1
    while next < limit
        next = ceil(Int, n * (n + 1) / 2)
        if in(next, pentagonals) && in(next, hexagonals)
            return next
        end
        n += 1
    end
    return -1
end

println(@time solve())
