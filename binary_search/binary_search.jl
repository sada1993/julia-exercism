function binary_search(vector, x, prev_idx = [0])
    len = length(vector)
    if len == 0
        return []
    end
    idx = len % 2 == 0 ? Int(len/2) : Int(round(len/2))+1
    idx_value = vector[idx]
    if(idx_value == x)
        # Terminating condition
        return [idx] + prev_idx
    elseif(len == 1)
        return []
    else
        if x > idx_value
            #Right hand side
            rhs_result = binary_search(vector[idx+1:len], x, [idx])
            rhs_result = length(rhs_result) != 0 ? prev_idx + rhs_result : []
            return rhs_result
        else
            #Left hand side
            lhs_result =  binary_search(vector[1:idx-1], x, [0])
            lhs_result = length(lhs_result) != 0 ? prev_idx + lhs_result : []
            return lhs_result
        end
    end
end
