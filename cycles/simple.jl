
function Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ
    α = (κ - 1) / κ

    T_1 = T_min;
    T_2 = (T_min/η_c)*(r_p^(α) - 1) + T_min;
    T_3 = T_max;
    T_4 = T_max*η_t*(r_p^(-α) - 1) + T_max;

    return T_1, T_2, T_3, T_4
end

function log_avg(T_vec)

    numerator = 0
    denominator = 0

    for i ∈ eachindex(T_vec)
        if isodd(i)
            numerator += T_vec[i]
            denominator += log(T_vec[i])
        else
            numerator -= T_vec[i]
            denominator -= log(T_vec[i])
        end
    end

    return numerator / denominator
    
end


function w_out_net(r_p, T_1, T_3, η_c, η_t, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ

    return η_t * c_p * T_3 *(1 - r_p^(-α)) - (c_p / η_c) * T_1 * (r_p^(α) - 1)

end

function η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ

    return (η_t * c_p * T_max *(1 - r_p^(-α)) - (c_p / η_c) * T_min * (r_p^(α) - 1)) / (c_p * (T_max - (T_min*r_p^(α))))

end

function η_II(r_p, T_min, T_max, T_L, η_c, η_t, ϵ, Gas)
    T_1, T_2, T_3, T_4 = Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    T_min_avg = (T_4 - T_1) / log(T_4 / T_1)   
    T_max_avg = (T_3 - T_2) / log(T_3 / T_2)  

    return η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas) / (1 - (T_min_avg / T_max_avg))
end
