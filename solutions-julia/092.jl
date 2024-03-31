function successor(n)
    digits = string(n)
    res = 0
    for digit in digits
        res += parse(Int, string(digit))^2
    end
    return res
end

function solve()
    c = 0
    for n in 2:9_999_999
        nxt = successor(n)
        while !(nxt in [1, 89])
            nxt = successor(nxt)
        end
        if nxt == 89
            c += 1
        end
    end
    return c
end

println(@time solve())
