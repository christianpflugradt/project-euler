l(s) = length(s)
i(f) = round(Int, f)
d(num, col) = parse(Int, string(num)[col])

function solve()
	and = "and"
	hundred = "hundred"
	thousand = "thousand"
	one2nine = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
	eleven2nineteen = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
	ten2ninety = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
	total = 0
	for n in 1:1000
		if n < 10
			total += l(one2nine[n])
		elseif n == 1000
			total += l(thousand)
			total += l(one2nine[1])
		else
			if n > 99
				total += l(hundred)
				total += l(one2nine[d(n,1)])
				if n % 100 != 0
					total += l(and)
				end
			end
			z = l(string(n)) # last digit, e.g. 2 in 342
			y = z - 1 # second to last digit: e.g. 4 in 342
			if d(n,z) != 0 && d(n,y) != 1
				total += l(one2nine[d(n,z)])
			end
			if d(n,y) != 0
				if d(n,y) == 1 && d(n,z) != 0
					total += l(eleven2nineteen[d(n,z)])
				else
					total += l(ten2ninety[d(n,y)])
				end
			end
		end
	end
	return total
end

println(@time solve())
