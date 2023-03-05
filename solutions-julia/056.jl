function solve()
    maximum = 0
    for a in 1:99, b in 1:99
        a = big(a)
        b = big(b)
        c = a^b
        str = string(c)
        sum = 0
        for chr in str
            sum += parse(Int, chr)
        end
        maximum = max(maximum, sum)
    end
    return maximum
end

println(@time solve())
