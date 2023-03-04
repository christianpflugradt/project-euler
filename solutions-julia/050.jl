include("./common.jl")

function solve()
    primes = []
    for num in 2:999_999
        if is_prime(num)
            push!(primes, num)
        end
    end
    total= 0
    max_len = 0
    while total < 1_000_000
        max_len += 1
        total += primes[max_len]
    end
    prime = 2
    for len in 22:max_len
        for index in 1:length(primes)-len+1
            s = sum(primes[index:index+len-1])
            if s > 999_999
                break
            end
            if is_prime(s)
                prime = s
                break
            end
        end
    end
    return prime
end

println(@time solve())
