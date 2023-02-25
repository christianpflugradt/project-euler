function solve()
	longest = 0
	longest_num = 0
	for i in 2:999_999
		num = i
		len = 0
		while num != 1
			if iseven(num)
				num /= 2
			else
				num *= 3
				num += 1
			end
			len += 1
		end
		if len > longest
			longest = len
			longest_num = i
		end
	end
	return longest_num
end

println(@time solve())
