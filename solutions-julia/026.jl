function solve()
    # precision along with cycle further down can be tuned
    # 12_000 and 1000 are sufficient to find the largest repetition
    # I also tested it with larger values but obviously the algorithm will then take longer to finish
    setprecision(12_000) 
    max_d = 1
    max_l = 0
    for d in 2:999
        num_i = BigFloat(1)
        num_i /= d
        num = string(num_i)
        if length(num) < 50 # not interested in 'small' numbers
            continue
        end
        num = num[20:end-10] # expecting some irregularities at beginning and end
        cycle = 1000
        rep = true
        while num[1:cycle] != num[cycle+1:cycle*2] || num[1:cycle] != num[cycle*2+1:cycle*3]
            cycle -= 1
            if cycle < 30 # too small
                rep = false
                break
            end
        end
        smaller = cycle - 1
        # after we found a repetition we need to find out how long it actually is
        # we expect the longest repetition to be much longer than 10 so we don't care about anything shorter
        # by our definition we find a repetition if it appears at least thrice in a row in our data
        while smaller > 10
            if num[1:smaller] == num[smaller+1:smaller*2] && num[1:smaller] == num[smaller*2+1:smaller*3]
                cycle = smaller
            end
            smaller -= 1
        end
        if rep && cycle > max_l
            max_l = cycle
            max_d = d
        end
    end
    return max_d
end

println(@time solve())
