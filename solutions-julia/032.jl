function is_pandigital(multiplicant, multiplier, product)
    res = "$multiplicant$multiplier$product"
    return length(res) == 9 &&
        contains(res, '1') &&
        contains(res, '2') &&
        contains(res, '3') &&
        contains(res, '4') &&
        contains(res, '5') &&
        contains(res, '6') &&
        contains(res, '7') &&
        contains(res, '8') &&
        contains(res, '9')
end

function solve()
    products = Set{Int}()
    for a in 1:99, b in 100:9999
        c = a * b
        if is_pandigital(a, b, c)
            push!(products, c)
        end
    end
    return sum(products)
end

println(@time solve())
