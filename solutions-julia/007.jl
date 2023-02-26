include("./common.jl")

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
