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
    min_f = 1/3
    max_f = 1/2
    for d in 2:12_000
        for n in 2:d-1
            if n/d <= min_f
                continue
            end
            if n/d >= max_f
                break
            end
            if relative_prime(n, d)
                c += 1
            end
        end
    end
    return c
end

println(@time solve())
