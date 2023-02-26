include("./common.jl")

high_number = 600_851_475_143

function solve(number)
	max_prime = 1
	for i in range(ceil(Int, sqrt(number)), step=-1, stop=3)
		if last(string(i)) in ['1', '3', '7', '9']
			if digit_sum(i) % 3 != 0
				if number % i == 0 && is_prime(i)
					return i
				end
			end
		end
	end
end

println(@time solve(high_number))
