f(x) = factorial(big(x))

function solve()
    count = 0
    for n in 23:100, r in 4:n-3
        nom = f(n)
        denom = f(r) * f(n - r)
        if (nom / denom) > 1_000_000
            count += 1
        end
    end
    return count
end

println(@time solve())
