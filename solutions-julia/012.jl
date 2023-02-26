function get_divisors(num)
	divisors = 2
	sq = ceil(Int, sqrt(num))
	for i in 2:sq
		if num % i == 0
			divisors += 2
		end
	end
	if sq * sq == num
		divisors += 1
	end
	return divisors
end

function solve()
	triangle = big(0)
	increment = big(1)
	max_divisors = 1
	while max_divisors <= 500
		triangle += increment
		increment += 1
		divisors = get_divisors(triangle)
		max_divisors = max(max_divisors, get_divisors(triangle))
	end
	return triangle
end

println(@time solve())
