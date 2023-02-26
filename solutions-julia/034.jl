function solve()
    lowest = 10 # must be at least two digits to make a sum
    highest = factorial(9)*7 # factorial of nine times eight still has only seven digits
    total = 0
    for num in lowest:highest
        num_s = string(num)
        total_f = 0
        for chr in num_s
            total_f += factorial(parse(Int, chr))
        end
        if total_f == num
            total += num
        end
    end
    return total
end

println(@time solve())
