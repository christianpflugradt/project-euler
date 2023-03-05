file = open("../resources/059.txt", "r")
input = read(file, String)
close(file)

function solve()
    digitrange = 60:71
    upperrange = 65:90
    lowerrange = 97:122
    pos = 0
    content = split(input[1:end-1], ",")
    common_terms = [ # taken from wikipedia, the number of terms and how many must be found (8) can be tuned
        "the", "be", "to", "of", "and", "a", "in", "that", "have", "I"
    ]
    for a in lowerrange, b in lowerrange, c in lowerrange
    #for a in 101:101, b in 120:120, c in 112:112
        text = ""
        for chr in content
            text *= Char(xor([a, b, c][(pos % 3) + 1], parse(Int, chr)))
            pos += 1
        end
        hits = 0
        for term in common_terms
            if contains(text, " $term ")
                hits += 1
            end
        end
        if hits >= 8
            total = 0
            for chr in text
                total += Int(chr)
            end
            return total
        end
    end
    return "nothing found"
end

println(@time solve())
