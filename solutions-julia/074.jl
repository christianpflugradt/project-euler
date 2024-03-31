function successor(n)
    digits = string(n)
    res = 0
    for digit in digits
        res += factorial(parse(Int, string(digit)))
    end
    return res
end

function solve()
    total = 0
    factorials = []
    for i in 0:9
        push!(factorials, factorial(i))
    end
    for n in 1:999_999
        set = Set{Int}([])
        nxt = n
        c = 0
        while !(nxt in set)
            push!(set, nxt)
            nxt = successor(nxt)
            c += 1
        end
        if c == 60
            total += 1
        end
    end
    return total
end

println(@time solve())
