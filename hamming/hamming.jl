"Your optional docstring here"
function distance(a, b)
    distance = 0
    if length(a) != length(b)
        throw(ArgumentError("String length mismatch"))
    end

    for i in 1:length(a)
        distance += a[i] != b[i] ? 1 : 0
    end

    return distance
end
