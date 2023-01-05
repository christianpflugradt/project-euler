is_palindrome(str) = str == reverse(str)

function solve()
	palindrome = 0
	for x in 1:999, y in 1:999
		candidate = x * y
		if is_palindrome(string(candidate)) && candidate > palindrome
			palindrome = candidate
		end
	end
	return palindrome
end

println(@time solve())
