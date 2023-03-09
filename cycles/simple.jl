function w_out_net(r_p, T_1, T_3, η_c, η_t, Gas)
    κ = Gas.k
    α = (κ - 1) / κ

    return (T_1 / η_c) * (r_p ^ α - 1) - η_t * T_3 * (1 - r_p ^ α)

end

function η_th(r_p, Gas)
    κ = Gas.κ
    α = (κ - 1) / κ

    return 1 - (1 / (r_p ^ α))

end

function η_II(T_2, T_3, r_p, Gas, T_0)
    κ = Gas.κ
    α = (κ - 1) / κ

    return (T_2 + T_3) * (1 - r_p ^ -α) / ((T_2 + T_3) - T_0*ln(T_2 * T_3))

end
