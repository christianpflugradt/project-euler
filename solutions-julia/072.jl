function relative_prime(a, b)
    if b < a
        tmp = a
        a = b
        b = tmp
    end
    while b > 0
        tmp = b
        b = mod(a, b)
        a = tmp
    end
    return a == 1
end

function solve()
    c = 0
    for d in 2:1_000_000
        for n in 2:d-1
            if relative_prime(n, d)
                c += 1
            end
        end
    end
    return c
end

println(@time solve())
