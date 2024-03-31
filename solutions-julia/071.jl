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
    ref = 3/7
    max_frac = 0
    max_n = 0
    for d in 2:1_000_000
        for n in 2:d-1
            frac = n/d
            if frac >= ref
                break
            end
            if frac <= max_frac
                continue
            end
            if relative_prime(n, d)
                max_frac = frac
                max_n = n
            end
        end
    end
    return max_n
end

println(@time solve())
