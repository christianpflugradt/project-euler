function solve()
    grid_size = 1001
    grid = zeros(Int, grid_size, grid_size)
    next = 1
    moves = 1
    x = ceil(Int, grid_size / 2)
    y = ceil(Int, grid_size / 2)
    grid[x,y] = next
    while moves < grid_size
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
    for i in 1:grid_size-1
        x += 1
        next += 1
        grid[x,y] = next
    end
    d = -1
    for x in 1:grid_size
        d += grid[x,x]
        d += grid[x,grid_size-x+1]
    end
    return d
end

println(@time solve())
