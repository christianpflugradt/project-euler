include("./common.jl")

function solve()
	aggregation = 2 + 3 + 5
	for i in 7:1_999_999
		if last(string(i)) in ['1', '3', '7', '9']
			if digit_sum(i) % 3 != 0
				if is_prime(i)
					aggregation += i
				end
			end
		end
	end
	return aggregation
end

println(@time solve())
