function solve()
    a_val = 1
    b_val = 2
    c_val = 5
    d_val = 10
    e_val = 20
    f_val = 50
    g_val = 100
    perms = 1
    for a in 0:200, b in 0:100, c in 0:40, d in 0:20, e in 0:10, f in 0:4, g in 0:2
        if (a * a_val + b * b_val + c * c_val + d * d_val + e * e_val + f * f_val + g * g_val) == 200
            perms += 1
        end
    end
    return perms
end

println(@time solve())
