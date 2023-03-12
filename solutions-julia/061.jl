include("./common.jl")

function solve()
    seq = [[],[],[],[],[],[]]
    n = 1
    while true
        next = [ n * (n + 1) / 2,
                n * n,
                n * (3 * n - 1) / 2,
                n * (2 * n - 1),
                n * (5 * n - 3) / 2,
                n * (3 * n - 2) ]
        if next[1] > 9_999
            break
        end
        for i in 1:6
            if 1_000 <= next[i] <= 9_999
                push!(seq[i], ceil(Int, next[i]))
            end
        end
        n += 1
    end
    perms = permutations(collect(1:5))
    for perm in perms
        for a in seq[6]
            for b in seq[perm[1]]
                if string(a)[3:4] == string(b)[1:2]
                    for c in seq[perm[2]]
                        if string(b)[3:4] == string(c)[1:2]
                            for d in seq[perm[3]]
                                if string(c)[3:4] == string(d)[1:2]
                                    for e in seq[perm[4]]
                                        if string(d)[3:4] == string(e)[1:2]
                                            for f in seq[perm[5]]
                                                if string(e)[3:4] == string(f)[1:2] && string(f)[3:4] == string(a)[1:2]
                                                    return a + b + c + d + e + f
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return "nothing found"
end

println(@time solve())
