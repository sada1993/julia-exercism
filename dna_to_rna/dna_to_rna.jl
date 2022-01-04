function to_rna(dna)
    trans = Dict('G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')
    if length(setdiff(dna, keys(trans))) != 0
        throw(ErrorException("Invalid DNA Characters"))
    end
    map(x -> trans[x], dna)
end
