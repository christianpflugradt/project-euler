function get_divisors_sum(num)
    divisors_sum = 1
    sq = ceil(Int, sqrt(num))
	for i in 2:sq
		if num % i == 0
			divisors_sum += i
            divisors_sum += num / i
		end
	end
	if sq * sq == num
		divisors_sum += sq
	end
    return divisors_sum
end


function get_amicable_pair_or_empty(num)
    amicable = get_divisors_sum(num)
    return amicable != num && get_divisors_sum(amicable) == num ? [num, amicable] : []
end

function solve()
    amicables = Set{Int}()
    for number in 4:9999
        for amicable in get_amicable_pair_or_empty(number)
            push!(amicables, amicable)
        end
    end
    return sum(amicables)
end

println(@time solve())
