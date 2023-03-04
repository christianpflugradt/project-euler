function solve()
    max_solutions = 0
    max_p = 0
    for p in 3:1000
        solutions = 0
        for a in 1:p-2, b in 1:p-2
            c = p - (a + b)
            if c < 1
                continue
            end
            if (a + b + c) == p
                if (a * a + b * b) == c * c
                    solutions += 1
                end
            end
        end
        if solutions > max_solutions
            max_p = p
            max_solutions = solutions
        end
    end
    return max_p
end

println(@time solve())
