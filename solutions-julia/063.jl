function solve()
    count = 0
    for base in 1:9
        power = 1
        while length(string(base^big(power))) == power
            count += 1
            power += 1
        end
    end
    return count
end

println(@time solve())
