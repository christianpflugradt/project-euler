function is_prime(num::Int)::Bool
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

function digit_sum(num::Int)::Int
	str = string(num)
	result = 0
	for c in str
		result += parse(Int, c)
	end
	return result
end

