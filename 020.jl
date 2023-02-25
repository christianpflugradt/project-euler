function solve()
    num = string(factorial(big(100)))
    total = 0
    for chr in num
        total += parse(Int, chr)
    end
    return total
end

println(@time solve())
