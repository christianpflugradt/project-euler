include("./common.jl")

function solve()
    max_res = big(0)
    for perm in permutations([1,2,3,4,5,6,7,8,9,10])
        tenOutside = false
        for outside in [4,6,8,10]
            if perm[outside] == 10
                tenOutside = true
                break
            end
        end
        if (!tenOutside)
            continue
        end
        lowest = true
        for other in [4,6,8,10]
            if perm[other] < perm[1]
                lowest = false
                break
            end
        end
        if !lowest
            continue
        end
        ref = perm[1] + perm[2] + perm[3]
        if (perm[4] + perm[3] + perm[5]) == ref
            if (perm[6] + perm[5] + perm[7]) == ref
                if (perm[8] + perm[7] + perm[9]) == ref
                    if (perm[10] + perm[9] + perm[2]) == ref
                        res = ""
                        for i in [1,2,3, 4,3,5,  6,5,7, 8,7,9, 10,9,2]
                            res = string(res, perm[i])
                        end
                        if parse(BigInt, res) > max_res
                            max_res = parse(BigInt, res)
                        end
                    end
                end
            end
        end
    end
    return max_res
end

println(@time solve())
