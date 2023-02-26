function solve()
    a = big(1)
    b = big(1)
    index = 3
	while true
        c = b
		b = a + b
		a = c
        if length(string(b)) >= 1000
            return index
        end
        index += 1
	end
end

println(@time solve())
