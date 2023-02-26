function solve()
    total_n = 1
    total_d = 1
    for a in 1:9, b in 1:9, c in 1:9
        first_division = (a * 10 + b) / (b * 10 + c)
        if first_division >= 1
            continue
        end
        second_division = a / c
        if first_division == second_division
            total_n *= (a * 10 + b)
            total_d *= (b * 10 + c)
        end
    end
    return ceil(Int, total_d / gcd(total_n, total_d))
end

println(@time solve())
