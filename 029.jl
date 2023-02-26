function solve()
    results = Set{BigInt}()
    for a in 2:100, b in 2:100
        push!(results, big(a)^big(b))
    end
    return length(results)
end

println(@time solve())
