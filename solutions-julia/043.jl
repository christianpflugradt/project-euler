include("./common.jl")

n(s) = parse(Int, s)

function solve()
    total = 0
    digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    for perm in permutations(digits)
        if perm[1] == 0
            continue
        end
        if !in(perm[4], [0, 2, 4, 6, 8])
            continue
        end
        if !in(perm[6], [0, 5])
            continue
        end
        num = join(perm)
        if n(num[2:4]) % 2 == 0 &&
                n(num[3:5]) % 3 == 0 &&
                n(num[4:6]) % 5 == 0 &&
                n(num[5:7]) % 7 == 0 &&
                n(num[6:8]) % 11 == 0 &&
                n(num[7:9]) % 13 == 0 &&
                n(num[8:10]) % 17 == 0
                total += n(num)
        end
    end
    return total
end

println(@time solve())
