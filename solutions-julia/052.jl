norm(num) = join(sort(split(string(num), "")))

function solve()
    len = 1
    while true
        num_s = "1"
        for i in 1:len
            num_s *= "0"
        end
        num = parse(Int, num_s)
        next = parse(Int, "$(num_s)0")
        while (num * 6) < next
            n = norm(num)
            if n == norm(num * 2) &&
                    n == norm(num * 3) &&
                    n == norm(num * 4) &&
                    n == norm(num * 5) &&
                    n == norm(num * 6) &&
                return num
            end
            num += 1
        end
        len += 1
    end
end

println(@time solve())
