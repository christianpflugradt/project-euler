include("./common.jl")

function cycles(num_s)
    l = length(num_s)
    perms = [num_s]
    for start in 2:l
        perm = ""
        for next in start:l
            perm *= num_s[next]
        end
        for next in 1:start-1
            perm *= num_s[next]
        end
        push!(perms, perm)
    end
    return perms
end

function solve()
    primes = Set{String}()
    push!(primes, "2")
    for num in 1:999_999
        if is_prime(num)
            num_s = string(num)
            evens = ['0', '2', '4', '6', '8']
            has_evens = false
            for even in evens
                if in(even, num_s)
                    has_evens = true
                    break
                end
            end
            if has_evens || in(num_s, primes)
                continue
            end
            perms = cycles(num_s)
            all_primes = true
            for perm in perms
                if !is_prime(parse(Int, perm))
                    all_primes = false
                    break
                end
            end
            if all_primes
                for perm in perms
                    push!(primes, perm)
                end
            end
        end
    end
    return length(primes)
end

println(@time solve())
