file = open("../resources/099.txt", "r")
input = split(read(file, String), "\n")
close(file)

function solve()
    highest = big(0)
    max_l = 1
    for l in 1:length(input)-1
        num = split(input[l], ",")
        res = parse(BigInt, num[1])^parse(BigInt, num[2])
        if res > highest
            highest = res
            max_l = l
        end
    end
    return max_l
end

println(@time solve())
