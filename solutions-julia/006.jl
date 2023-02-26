function solve()
	sum = 0
	sqsum = 0
	for i in 1:100
		sum += i
		sqsum += i*i
	end
	sum *= sum
	return abs(sqsum - sum)
end

println(@time solve())
