include("./common.jl")

function solve()
    # checking the first 40 double squares is enough to find the number in question
    # the value can be increased at the cost of a longer runtime
    next = 35
    double_squares = []
    for n in 1:40
        push!(double_squares, 2 * n * n)
    end
    while true
        if !is_prime(next)
            prime_composite = false
            for sq in double_squares
                if is_prime(next - sq)
                    prime_composite = true
                    break
                end
            end
            if prime_composite == false
                return next
            end
        end
        next += 2
    end
end

println(@time solve())
