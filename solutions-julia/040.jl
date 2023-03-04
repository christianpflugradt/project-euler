function solve()
    count = 0
    next = 0
    total = 1
    for threshold in [10, 100, 1_000, 10_000, 100_000, 1_000_000]
        while count < threshold
            next += 1
            next_s = "$next"
            l = length(next_s)
            count += l
            if count >= threshold
                total *= parse(Int, next_s[l-count+threshold])
            end
        end
    end
    return total
end

println(@time solve())
