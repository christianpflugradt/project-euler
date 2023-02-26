function solve()
	aggregation = 0
	for number in 3:999
		if number % 3 == 0 || number % 5 == 0
			aggregation += number
		end
	end
	return aggregation
end

println(@time solve())
