function solve()
    total = big(0)
    for i in 1:1000
        total += big(i)^big(i)
    end
    return string(total)[end-9:end]
end

println(@time solve())
