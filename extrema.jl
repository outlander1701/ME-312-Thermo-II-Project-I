"""
w_net_max for cycle
n_th at which that occurs

find r_p value

η_II @ that r_p
"""

function extrema_eval(w_net, η_th, η_II, r_p, T_min, T_max, Gasses)
    for i ∈ eachindex(Gasses)

        w_out_net_max = 0
        #println(w_out_net_max)
        r_p_at_max = 0

        for ratio ∈ r_p
            w_out_net = w_net(ratio, T_min, T_max, 1, 1, Gasses[i])

            if w_out_net > w_out_net_max
                w_out_net_max = w_out_net
                r_p_at_max = ratio
            end

        end

        T_0 = 0
        η_II_val = η_II(r_p_at_max , T_min, T_max, T_0, 1, 1, 1, Gasses[i])
        η_th_val = η_th(r_p_at_max, T_min, T_max, 1, 1, 1, Gasses[i])

        println("+=================+")
        println(Gasses[i].name)
        println("work out net max: $w_out_net_max")
        println("r_p at max: $r_p_at_max")
        println("η_th: $η_th_val")
        println("η_II: $η_II_val")

    end
end