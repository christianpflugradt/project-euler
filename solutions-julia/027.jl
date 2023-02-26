include("./common.jl")

function solve()
    max_a = 0
    max_b = 0
    max_n = 0
    for a in -999:999, b in -1000:1000
        n = 0
        while is_prime(n * n + a * n + b)
            n += 1
        end
        if n > max_n
            max_a = a
            max_b = b
            max_n = n
        end
    end
    return max_a * max_b
end

println(@time solve())
