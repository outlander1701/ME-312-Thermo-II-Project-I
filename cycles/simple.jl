function w_out_net(r_p, T_1, T_3, η_c, η_t, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ

    return η_t * c_p * T_3 *(1 - r_p^(-α)) - (c_p / η_c) * T_1 * (r_p^(α) - 1)

end

function η_th(r_p, T_1, T_3, η_c, η_t, ϵ, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ

    return (η_t * c_p * T_3 *(1 - r_p^(-α)) - (c_p / η_c) * T_1 * (r_p^(α) - 1)) / (c_p * (T_3 - (T_1/η_c) * (r_p^(α)-1) - T_1))

end

function η_II(T_2, T_3, r_p, Gas, T_0)
    κ = Gas.κ
    α = (κ - 1) / κ

    return (T_2 + T_3) * (1 - r_p ^ -α) / ((T_2 + T_3) - T_0*ln(T_2 * T_3))

end
