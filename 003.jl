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

function solve()
	number = 600851475143
	max_prime = 1
	for i in range(ceil(Int, sqrt(number)), step=-1, stop=3)
		if (last(string(i)) in ['1', '3', '7', '9'])
			if digit_sum(i) % 3 != 0
				if number % i == 0 && is_prime(i)
					return i
				end
			end
		end
	end
end

println(@time solve())
