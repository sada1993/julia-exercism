function next_step(x, y, n, matrix, current_direction)
    if current_direction == "right"
        if y+1 <= n && matrix[x,y+1] == 0
            y += 1
        else
            x += 1
        end
    elseif current_direction == "left"
        if y-1 >= 1 && matrix[x,y-1] == 0
            y -= 1
        else
            x -= 1
        end
    elseif current_direction == "down"
        if x+1 <= n && matrix[x+1,y] == 0
            x += 1
        else
            y -= 1
        end
    elseif current_direction == "up"
        if x-1 >= 1 && matrix[x-1,y] == 0
            x -= 1
        else
            y += 1
        end
    end
    return (x,y)
end

function spiral_matrix(n)
    matrix = zeros(Int64, n, n)
    x = 1
    y = 1
    counter = 1
    direction = ["right", "down", "left", "up"]

    for i in 1:n
        #right
        matrix[x,y] = counter
        if y+1 <= n
            y += 1
        else
            x += 1
        end
        #println(counter)
        counter += 1
    end

    direction_idx = 2
    current_direction = direction[direction_idx]
    completion_counter = 1
    completed = 0
    while counter <= n^2

        for i in 1:n-1-completed
            #println(counter)
            #println("(x,y) = ", "(",x,",", y, ")")
            matrix[x,y] = counter
            counter += 1

            if counter <= n^2
                (x,y) = next_step(x, y, n, matrix, current_direction)
            end

        end

        direction_idx += 1
        current_direction = direction[((direction_idx - 1) % 4)+1]
        #println(current_direction)

        if completion_counter == 2
            completed += 1
            completion_counter = 1
        else
            completion_counter += 1
        end

    end

    return matrix

end
