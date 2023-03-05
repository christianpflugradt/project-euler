function solve()
    n0 = big(17)
    n1 = big(7)
    n2 = big(3)
    d0 = big(12)
    d1 = big(5)
    d2 = big(2)
    count = 0
    for i in 4:1000
        d = n0 + d0
        n = d + d0
        if length(string(n)) > length(string(d))
            count += 1
        end
        n2 = n1
        n1 = n0
        n0 = n
        d2 = d1
        d1 = d0
        d0 = d
    end
    return count
end

println(@time solve())
