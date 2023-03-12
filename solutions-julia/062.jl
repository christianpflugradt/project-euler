include("./common.jl")

function solve()
    cubes = []
    expected_matches = 5
    digits = 12 # this value can be tuned, there are no matches for digits < 12
    lowest = ceil(Int, cbrt(parse(Int, "1$(repeat('0', digits - 1))")))
    highest = floor(Int, cbrt(parse(Int, repeat('9', digits))))
    for num in lowest:highest
        push!(cubes, map(x -> parse(Int, x), split(string(num^3), "")))
    end
    for cube in cubes
        patterns = Dict()
        for candidate in cubes
            if sort(cube) == sort(candidate)
                pattern = sort(candidate)
                patterns[pattern] = haskey(patterns, pattern) ? patterns[pattern] + 1 : 1
            end
        end
        if patterns[sort(cube)] >= expected_matches
            return join(cube)
        end
    end
    return "nothing found"
end

println(@time solve())
