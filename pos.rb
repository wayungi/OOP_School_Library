def pos_args (x, y, z = 0, h)
    p x, y, z
    p h[:male]
end

pos_args(10, 20, male:true)