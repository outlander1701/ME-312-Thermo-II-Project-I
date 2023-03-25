function Temo(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ;
    α = (κ-1)/κ;

    T_1 = T_min;
    T_2 = (T_min/η_c)*(r_p^(α)-1) + T_min;
    T_3 = T_max;
    T_4 = T_max*η_t*(1-r_p^(-α)) + T_max;
    T_5 = ϵ*(T_4 - T_2) + T_2;
    T_6 = T_2;

    return T_1, T_2, T_3, T_4, T_5, T_6
end


function w_out_net(r_p, T_min, T_max, η_c, η_t, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ

    return η_t * c_p * T_max *(1 - r_p^(-α)) - (c_p / η_c) * T_min * (r_p^(α) - 1)

end

function η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    T_2 = (T_min/η_c)*(r_p^(α) - 1) + T_min
    T_4 = T_max - η_t*T_max*(1-r_p^(-α))

    return (η_t * c_p * T_max *(1 - r_p^(-α)) - (c_p / η_c) * T_min * (r_p^(α) - 1)) / (c_p * (T_max - ϵ*(T_4 - T_2) - T_2))
end

"""
function η_II(T_2, T_3, r_p, Gas, T_0)
    κ = Gas.κ
    α = (κ - 1) / κ
    return (1 - T_1 /  T_3 * (r_p) ^ α) / (1 - (T_0*ln(T_2 * T_3) / (T_2 + T_3)))
end
"""

function η_II(r_p, T_min, T_max, T_0, η_c, η_t, ϵ, Gas)

    return η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas) / ((T_min + T_max) / T_max)
    
end
