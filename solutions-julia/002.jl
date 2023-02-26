function solve()
	a = 0
	b = 1
	aggregation = 0
	while (a + b) < 4_000_000
		c = b
		b = a + b
		a = c
		if iseven(b)
			aggregation += b
		end
	end
	return aggregation
end

println(@time solve())
