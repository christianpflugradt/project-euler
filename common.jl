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

permutations(list; duplicates=true) = duplicates ? _permutations(list) : unique(_permutations(list))

function _permutations(list)
	if length(list) == 1
		return list
	end
	perms = []
	for value in list
		reduced = copy(list)
		deleteat!(reduced, findfirst(x -> x == value, reduced))
		for perm in _permutations(reduced)
			push!(perms, vcat([value], perm))
		end
	end
	return perms
end
