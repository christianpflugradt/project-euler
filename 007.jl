function is_prime(num)
	if num < 2
		return false
	elseif num == 2
		return true
	else
		for i in 2:ceil(Int, sqrt(num))
			if num % i == 0
				return false
			end
		end
	end
	return true
end

function digit_sum(num)
	str = string(num)
	result = 0
	for c in str
		result += parse(Int, c)
	end
	return result
end

function solve()
	prime_counter = length([2, 3, 5])
	number = 7
	while prime_counter < 10_001
		if last(string(number)) in ['1', '3', '7', '9']
			if digit_sum(number) % 3 != 0
				if is_prime(number)
					prime_counter += 1
				end
			end
		end
		number += 1
	end
	return number-1
end

println(@time solve())
