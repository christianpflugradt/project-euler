function solve()
    lowest = (1 ^ 5) * 2
    highest = (9 ^ 5) * 6 # times seven has still six digits so this is the highest possible number
    total_sum = 0
    for num in lowest:highest
        total = 0
        num_s = string(num)
        for chr in num_s
            total += parse(Int, chr) ^ 5
        end
        if total == num
            total_sum += num
        end
    end
    return total_sum
end

println(@time solve())
