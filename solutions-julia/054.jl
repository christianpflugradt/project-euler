file = open("../resources/054.txt", "r")
input = read(file, String)
close(file)

function val(card)
    v = card[1]
    if v == 'A'
        return 14
    elseif v == 'K'
        return 13
    elseif v == 'Q'
        return 12
    elseif v == 'J'
        return 11
    elseif v == 'T'
        return 10
    else
        return parse(Int, v)
    end
end

function vals(cards)
    vs = []
    for card in cards
        push!(vs, val(card))
    end
    return sort(vs)
end

suit(card) = card[2]

function suits(cards)
    s = Set{Char}()
    for card in cards
        push!(s, suit(card))
    end
    return collect(s)
end

mil(n) = 2_000_000 * n
f(n) = 16 ^ n

function calc_hand(cards)
    s = suits(cards)
    sl = length(s)
    v = vals(cards)
    # royal flush
    if sl == 1 && v == [10, 11, 12, 13, 14]
        return mil(9)
    end
    # straight flush
    if sl == 1 && v[1] + 4 == v[5]
        return mil(8) + v[1]
    end
    # four of a kind
    if sl == 4
        if v[1] == v[4]
            return mil(7) + v[1] * f(1) + v[5]
        elseif v[2] == v[5]
            return mil(7) + v[2] * f(1) + v[1]
        end
    end
    # full house
    if sl >= 3
        if v[1] == v[3] && v[4] == v[5]
            return mil(6) + v[1] * f(1) + v[4]
        elseif v[1] == v[2] && v[3] == v[5]
            return mil(6) + v[3] * f(1) + v[1]
        end
    end
    # flush
    if sl == 1
        return mil(5) + v[5] * f(4) + v[4] * f(3) + v[3] * f(2) + v[2] * f(1) + v[1]
    end
    # straight
    if v[1] + 1 == v[2] &&
            v[2] + 1 == v[3] &&
            v[3] + 1 == v[4] &&
            v[4] + 1 == v[5]
        return mil(4) + v[1]
    end
    # three of a kind
    if v[1] == v[3]
        return mil(3) + v[1] * f(3) + max(v[4], v[5]) * f(2) + min(v[4], v[5])
    elseif v[2] == v[4]
        return mil(3) + v[2] * f(3) + max(v[1], v[5]) * f(2) + min(v[1], v[5])
    elseif v[3] == v[5]
        return mil(3) + v[3] * f(3) + max(v[1], v[2]) * f(2) + min(v[1], v[2])
    end
    # two pairs
    for c in [(1,2,3,4), (1,2,4,5), (2,3,4,5)]
        if v[c[1]] == v[c[2]] && v[c[3]] == v[c[4]]
            return mil(2) + max(v[c[1]], v[c[3]]) * f(3) + min(v[c[1]], v[c[2]]) * f(2) + v[15-sum(c)]
        end
    end
    # one pair
    for c in [(1,2, 3, 4, 5), (2,3, 1, 4, 5), (3,4, 1, 2, 5), (4,5, 1, 2, 3)]
        if v[c[1]] == v[c[2]]
            h = max(v[c[3]], v[c[4]], v[c[5]])
            l = min(v[c[3]], v[c[4]], v[c[5]])
            r = sum(v) - (h + l + v[c[1]] * 2)
            return mil(1) + v[c[1]] * f(3) + h * f(2) + l * f(1) + r
        end
    end
    return v[5] * f(4) + v[4] * f(3) + v[3] * f(2) + v[2] * f(1) + v[1]
end

function solve()
    wins = 0
    for line in split(input, "\n")[1:end-1]
        cards = split(line, " ")
        a = calc_hand(cards[1:5])
        b = calc_hand(cards[6:10])
        if a > b
            wins += 1
        elseif a == b
            println("same: ", cards) # if this is printed it means only the suits differ
        end
    end
    return wins
end

println(@time solve())
