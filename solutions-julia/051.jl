include("./common.jl")

# It is not possible to find a group of 8 with only 2 digits replaced
# because out of 10 (0 to 9) at least 3 will be divisible by 3.
# Initially I was looking for a much higher number and this algorithm can easily
# be modified to find the first number with at least 7 or 8 digits or more.
function solve()
    primes = []
    for num in 100_000:999_999
        if is_prime(num)    
	        num_s = string(num)
            for i in 0:9
                if count(x -> (x == string(i)[1]), num_s) >= 3
                    push!(primes, num_s)
                    break
                end
            end
        end
    end
    max_groups = []
    for a in 1:4, b in 2:5, c in 3:6
        if a >= b || b >= c
            continue
        end
        groups = Dict()
        d = 0
        e = 0
        f = 0
        for i in 1:6
            if !in(i, [a, b, c])
                if d == 0
                    d = i
                elseif e == 0
                    e = i
                else
                    f = i
                    break
                end
            end
        end
        for prime in primes
            if prime[d] == prime[e] && prime[e] == prime[f]
                group = "$(prime[a])$(prime[b])$(prime[c])"
                groups[group] = in(group, keys(groups)) ? groups[group] + 1 : 1
            end
        end
        if length(keys(groups)) > 0
            for group in keys(groups)
                if groups[group] >= 8
                    max_group = (group, "$a$b$c$d$e$f")
                    push!(max_groups, max_group)
                end
            end
        end
    end
    result = 99_999_999
    for max_group in max_groups
        number, mapping = max_group
        for d in 0:9
            num_s = "xxxxxx"
            for i in 1:6
                arr = collect(num_s)
                arr[parse(Int, mapping[i])] = i > 3 ? string(d)[1] : number[i]
                num_s = join(arr)
            end
            num = parse(Int, num_s)
            if is_prime(num)
                result = min(result, num)
            end
        end
    end
    return result
end

println(@time solve())

