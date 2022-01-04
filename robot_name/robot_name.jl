import Random.randstring

history = Set{String}()

mutable struct Robot
    name::AbstractString
    function Robot()
        new(name_gen_avoid_conflict())
    end
end

function reset!(instance::Robot)
    instance.name = name_gen_avoid_conflict()
end

function name(instance::Robot)
    instance.name
end

function name_generator()
    letters = randstring('A':'Z',2)
    numbers = String(map(x->Char('0' + x), rand(0:9, 3)))
    letters * numbers
end

function name_gen_avoid_conflict()
    conflict = true
    new_name = ""
    while conflict
        new_name = name_generator()
        conflict = new_name in history
    end
    push!(history, new_name)
    return new_name
end
