include("./common.jl")

function solve()
    total = 0
    for num in 1:999_999
        if is_palindrome("$num") && is_palindrome(lstrip(bitstring(num), ['0']))
            total += num
        end
    end
    return total
end

println(@time solve())
