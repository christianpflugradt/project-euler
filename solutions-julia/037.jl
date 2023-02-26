include("./common.jl")

function solve()
    num = 9
    truncatables = []
    while length(truncatables) < 11
        num += 1
        num_s = "$num"
        if !in(num_s[1], ['2', '3', '5', '7'])
            continue
        end
        if !in(num_s[end], ['3', '7'])
            continue
        end
        if !is_prime(num)
            continue
        end
        truncatable = true
        for start in 2:length(num_s)
            if !is_prime(parse(Int, num_s[start:end]))
                truncatable = false
                break
            end
        end
        if !truncatable
            continue
        end
        for stop in 1:length(num_s)-1
            if !is_prime(parse(Int, num_s[1:stop]))
                truncatable = false
                break
            end
        end
        if truncatable
            push!(truncatables, num)
        end
    end
    return sum(truncatables)
end

println(@time solve())
