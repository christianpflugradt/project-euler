function solve()
	a = big(2)
	b = big(1000)
	c = string(a^b)
	sum = 0
	for chr in c
		sum += parse(Int, chr)
	end
	return sum
end

println(@time solve())
