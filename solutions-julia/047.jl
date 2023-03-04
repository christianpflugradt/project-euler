include("./common.jl")

function prime_factors(num)
    factors = []
    while num != 1
        f = 2
        while num % f != 0
            while !is_prime(f + 1)
                f += 1
            end
            f += 1
        end
        push!(factors, f)
        num /= f
    end
    return factors
end

function solve()
    num = 1
    found = false
    while !found
        found = true
        for n in num:num+3
            if is_prime(n) || length(Set{Int}(prime_factors(n))) != 4
                found = false
                break
            end
        end
        num += 1
    end
    return num-1
end

println(@time solve())
