file = open("../resources/042.txt", "r")
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
    triangle = big(0)
	increment = big(1)
    max_value = 20 * 26 # we expect words to have no more than 20 letters
    triangles = []
	while triangle < max_value
		triangle += increment
		increment += 1
        push!(triangles, triangle)
    end
    names = []
    for name in split(input[2:end-2], "\",\"")
        push!(names, name)
    end
    total = 0
    for name in names
        if get_value(name) in triangles
            total += 1
        end
    end
    return total
end

println(@time solve())
