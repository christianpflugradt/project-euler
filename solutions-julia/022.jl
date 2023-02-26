file = open("../resources/022.txt", "r")
input = read(file, String)
close(file)

function get_value(name)
    total = 0
    for chr in name
        total += Int(chr) - 64
    end
    return total
end

function solve()
    names = []
    for name in split(input[2:end-2], "\",\"")
        push!(names, name)
    end
    sort!(names)
    total = 0
    for (index, name) in enumerate(names)
        total += index * get_value(name)
    end
    return total
end

println(@time solve())
