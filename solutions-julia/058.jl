include("./common.jl")

function solve()
    # this grid size is sufficient
    # I didn't take the absolute minimum required to not spoil the solution
    grid_size = 27_000 
    c = ceil(Int, (grid_size + 1) / 2)
    grid = zeros(Int, grid_size, grid_size)
    next = 1
    moves = 1
    x = ceil(Int, grid_size / 2)
    y = ceil(Int, grid_size / 2)
    grid[x,y] = next
    current_size = 1
    total = 1
    primes = 0
    percentage = 3 / 5
    while percentage >= 0.1
        current_size += 2
        s = ceil(Int, (current_size - 1) / 2)
        while moves < current_size
            if iseven(moves)
                for i in 1:moves
                    x -= 1
                    next += 1
                    grid[x,y] = next
                end
                for i in 1:moves
                    y -= 1
                    next += 1
                    grid[x,y] = next
                end
            else
                for i in 1:moves
                    x += 1
                    next += 1
                    grid[x,y] = next
                end
                for i in 1:moves
                    y += 1
                    next += 1
                    grid[x,y] = next
                end
            end
            moves += 1
        end
        x2 = x
        next2 = next
        for i in 1:current_size-1
            x2 += 1
            next2 += 1
            grid[x2,y] = next2
        end
        total += 4
        for field in [grid[c-s,c-s], grid[c-s,c+s], grid[c+s,c-s], grid[c+s,c+s]]
            if is_prime(field)
                primes += 1
            end
        end
        percentage = primes / total
    end
    return current_size
end

println(@time solve())
