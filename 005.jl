function is_prime(num)
	for i in 2:ceil(Int, sqrt(num))
		if num % i == 0
			return false
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
	number = 1
	for i in 2:20
		if is_prime(i)
			number *= i
		end
	end
	str = chop(string(number))
	str = "$(str)0"
	number = parse(Int, str)
	while true
		if last(string(number)) == '0'
			if digit_sum(number) % 3 == 0
				if divisible_by_2to20(number)
					return number
				end
			end
		end
		number += 10
	end
end

println(@time solve())
