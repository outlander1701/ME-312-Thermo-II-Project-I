function w_out_net(r_p, T_min, T_max, η_c, η_t, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)

    return 2*η_t * c_p * T_max *(1 - r_p^(-α)) - (c_p / η_c) * T_min * (r_p^(α) - 1)
end

function η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)

    return w_out_net(r_p, T_min, T_max, η_c, η_t, Gas) / (c_p * (T_max * (2 - r_p_1^(-α) - ϵ*r_p_1^(-α)) + 2*T_min*r_p_1^(α)))
end

function η_II(r_p, T_min, T_max, T_0, η_c, η_t, ϵ, Gas)

    return η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas) / ((T_min + T_max) / T_max)
    
end