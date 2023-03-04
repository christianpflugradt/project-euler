include("./common.jl")

function solve()
    for i in 1000:9999
        if is_prime(i)
            perms = permutations(map(x -> parse(Int, x), split("$i", "")), duplicates=false)
            diffs = []
            for a in perms
                a = parse(Int, join(a, ""))
                if in(a, [1487, 4817, 8147])
                    continue
                end
                diff_map = Dict()
                diffs = Set{Int}()
                if a >=1000 && is_prime(a)
                    for b in perms
                        b = parse(Int, join(b, ""))
                        diff = abs(a-b)
                        if b >= 1000 && is_prime(b) && in(diff, diffs) && b != a && is_prime(diff_map[diff])
                            c = diff_map[diff]
                            x = min(a, b, c)
                            z = max(a, b, c)
                            y = (a + b + c) - (x + z)
                            return "$x$y$z"
                        end
                        push!(diffs, diff)
                        diff_map[diff] = b
                    end
                end
            end
        end
    end
    return -1
end

println(@time solve())
