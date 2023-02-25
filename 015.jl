#=
# I had to think a bit for this one.
# All paths can be represented as a sequence of two variables, let's take A and B.
# A 1x1 square has the paths AB and BA (think first right, then down and then the other way around).
# For a 2x2 square the paths (permutations) are AABB, ABAB, ABBA, BAAB, BABA and BBAA.
# Derived from my school knowledge the formula for a 20x20 square with two variables (thus many repetitions) is:
# ((20 + 20)!) / (20! * 20!)
# the numerator is the factorial of the length of the sequence (40)
# the denominator is the product of the factorials of the repeating parts of the sequence (20 times A, 20 times B)
# because the factorial of 40 is a massive number, I'll optimize the fraction first -> example:
# (4 * 5) / (2 * 5) can be simplified to 2 / 1 because 5 is duplicate and both 4 and 2 can be divided by 2
=#

function get_divisors(num)
	divisors = []
	sq = ceil(Int, sqrt(num))
	is_sq = sq * sq == num
	for i in 2:sq
		if num % i == 0
			push!(divisors, i)
			if !is_sq || i != sq
				push!(divisors, round(Int, num / i))
			end
		end
	end
	return sort(divisors, rev=true)
end

function solve()
	numerator = []
	denominator = []
	for i in 21:40
		push!(numerator, i)
	end
	for i in 2:20
		push!(denominator, i)
	end
	has_changed = true
	while has_changed
		has_changed = false
		# 1st optimization: remove 1
		d_indx = findfirst(x -> x == 1, denominator)
		n_indx = findfirst(x -> x == 1, numerator)
		if d_indx != nothing
			has_changed = true
			deleteat!(denominator, d_indx)
		end
		if n_indx != nothing
			has_changed = true
			deleteat!(numerator, n_indx)
		end
		# 2nd optimization: remove a duplicate
		d_indx = findfirst(in(numerator), denominator)
		if d_indx != nothing
			has_changed = true
			n_indx = findfirst(x -> x == denominator[d_indx], numerator)
			deleteat!(denominator, d_indx)
			deleteat!(numerator, n_indx)
		end
		# 3rd optimization: divide by common divisor
		for i in numerator, j in denominator
			i_div = get_divisors(i)
			j_div = get_divisors(j)
			highest_divisor = findfirst(in(j_div), i_div)
			if highest_divisor != nothing
				has_changed = true
				i_index = findfirst(x -> x == i, numerator)
				j_index = findfirst(x -> x == j, denominator)
				numerator[i_index] = round(Int, numerator[i_index] / i_div[highest_divisor])
				denominator[j_index] = round(Int, denominator[j_index] / i_div[highest_divisor])
				break
			end
		end
	end
	numerator_res = 1
	for i in numerator
		numerator_res *= i
	end
	denominator_res = 1
	for i in denominator
		denominator_res *= i
	end
	return round(Int, numerator_res / denominator_res)
end

println(@time solve())
