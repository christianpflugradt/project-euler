include("./common.jl")

function solve()
    limit = 50_000_000
    limit2 = ceil(Int, limit^(1/2))
    limit3 = ceil(Int, limit^(1/3))
    limit4 = ceil(Int, limit^(1/4))
    nums = Set{Int}([])
    for x in 2:limit2, y in 2:limit3, z in 2:limit4
        s = x^2 + y^3 + z^4
        if s < limit
            if is_prime(x) && is_prime(y) && is_prime(z)
                push!(nums, s)
            end
        end
    end
    return length(nums)
end

println(@time solve())
