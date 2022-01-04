function myreverse(mystring::AbstractString)
    len = length(mystring)
    output = Array{Char}(undef, len)
    for (idx, letter) in enumerate(mystring)
        output[len - idx + 1] = letter
    end
    return String(output)
end
