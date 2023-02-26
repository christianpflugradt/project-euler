include("./common.jl")

function solve()
    return join(sort!(permutations([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))[1_000_000])
end

println(@time solve())
