include("./common.jl")

function is_lychrel(num)
    num = big(num)
    num_s = string(num)
    for i in 1:50
        num += parse(BigInt, reverse(num_s))
        num_s = string(num)
        if is_palindrome(num_s)
            return false
        end
    end
    return true
end

function solve()
    total = 0
    for num in 1:9_999
        if is_lychrel(num)
            total += 1
        end
    end
    return total
end

println(@time solve())
