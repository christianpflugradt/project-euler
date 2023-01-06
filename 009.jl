function solve()
	for a in 1:998, b in 1:998
		if (a + b) < 1_000
			c = 1_000 - a - b
			if (a * a + b * b) == c * c
				return a * b * c
			end
		end
	end
	return nothing
end

println(@time solve())
