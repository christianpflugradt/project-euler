function is_abundant(num)
    divisors = Set{Int}(1)
    sq = ceil(Int, sqrt(num))
	for i in 2:sq
		if num % i == 0
            push!(divisors, i)
            push!(divisors, num / i)
		end
	end
	if sq * sq == num
        push!(divisors, sq)
	end
    return sum(divisors) > num
end

function solve()
    abundants = Set{Int}()
    for num in 12:28123-12
        if is_abundant(num)
            push!(abundants, num)
        end
    end
    abundants_list = sort(collect(abundants))
    sums = Set{Int}()
    for first in 1:length(abundants_list)
        for second in first:length(abundants_list)
            the_sum = abundants_list[first] + abundants_list[second]
            if the_sum <= 28123
                push!(sums, the_sum)
            end
        end
    end
    total = 0
    for num in 1:28123
        if !in(num, sums)
            total += num
        end
    end
    return total
end

println(@time solve())
