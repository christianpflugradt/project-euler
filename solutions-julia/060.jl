include("./common.jl")

is_prime(str) = is_prime(parse(Int, str))

is_prime_pair(x::Int, y::Int) = is_prime("$x$y") && is_prime("$y$x")

function is_prime_pair(x::Int, v::Vector{Int})
    for y in v
        if !is_prime_pair(x, y)
            return false
        end
    end
    return true
end

function solve()
    primes = [3]
    for num in 7:9_999 # this value can be tuned
        if is_prime(num)
            push!(primes, num)
        end
    end
    len = length(primes)
    minimum = 999_999
    for a in 1:len-4, b in a+1:len-3
        if is_prime_pair(primes[a], primes[b])
            for c in b+1:len-2
                if is_prime_pair(primes[c], [primes[a], primes[b]])
                    for d in c+1:len-1
                        if is_prime_pair(primes[d], [primes[a], primes[b], primes[c]])
                            for e in d+1:len
                                if is_prime_pair(primes[e], [primes[a], primes[b], primes[c], primes[d]])
                                    # there is actually just one match in the given range
                                    # returning it immediately reduces the runtime from about 60 seconds to 1 second
                                    minimum = min(minimum, primes[a] + primes[b] + primes[c] + primes[d] + primes[e])
                                end
                            end
                        end
                    end
                end
            end        
        end
    end
    return minimum
end

println(@time solve())
