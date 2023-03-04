include("./common.jl")

function solve()
    digits = [1, 2, 3, 4, 5, 6, 7, 8]
    max_prime = 2
    prime_found = false
    while !prime_found
        perms = permutations(digits)
        for perm in perms
            num = parse(Int, join(perm))
            if is_prime(num)
                prime_found = true
                max_prime = max(max_prime, num)
            end
        end
        digits = digits[1:end-1]
    end
    return max_prime
end

println(@time solve())
