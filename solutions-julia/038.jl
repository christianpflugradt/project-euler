function is_pandigital(res)
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
    range_1 = 5:9
    seq_1 = [1, 2, 3, 4, 5]
    range_2 = 25:33
    seq_2 = [1, 2, 3, 4]
    range_3 = 100:333
    seq_3 = [1, 2, 3]
    range_4 = 5_000:9_999
    seq_4 = [1, 2]
    pairs = [(range_1, seq_1), (range_2, seq_2), (range_3, seq_3), (range_4, seq_4)]
    candidates = []
    for (r, s) in pairs
        for num in r
            num_s = ""
            for multiplier in s
                num_s *= "$(num * multiplier)"
            end
            if is_pandigital(num_s)
                push!(candidates, parse(Int, num_s))
            end
        end
    end
    return maximum(candidates)
end

println(@time solve())
