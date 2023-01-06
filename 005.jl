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

function divisible_by_2to20(num)
	for i in 2:20
		if num % i != 0
			return false
		end
	end
	return true
end

function solve()
	number = 2
	for i in 3:20
		if is_prime(i)
			number *= i
		end
	end
	if number % 20 != 0
		number += 10
	end
	while true
		if last(string(number)) == '0'
			if digit_sum(number) % 3 == 0
				if divisible_by_2to20(number)
					return number
				end
			end
		end
		number += 20
	end
end

println(@time solve())
