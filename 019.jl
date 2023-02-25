using Dates
using Formatting

function solve()
    sundays = 0
    for year in 1901:2000
        for month in 1:12
            if dayofweek(Date(sprintf1("$year-%02d-01", month))) == 6
                sundays += 1
            end
        end
    end
    return sundays
end

println(@time solve())
