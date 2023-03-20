function w_out_net(r_p, T_min, T_max,η_c, η_t, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)

    return 2*c_p*(η_t*T_max*(1-r_p_1^(-α))- η_c*T_min*(r_p_1^(α)-1))
end

function η_th(r_p, T_min, T_max, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)

    return 2*c_p*(η_t*T_max*(1-r_p_1^(-α)) - η_c*T_min*(r_p_1^(α)-1))/(T_max*(2-r_p_1^(-α) - ϵ*r_p^(-α)) + T_min*r_p^(α)*(ϵ+1))
end