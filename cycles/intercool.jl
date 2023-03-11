<<<<<<< HEAD
function w_out_net(r_p, T_1, T_3, η_c, η_t, Gas)
    κ = Gas.k
    cp = Gas.cp
    α = (κ - 1) / κ

    return cp * (η_t * T_3 * (rp ^ -α - 1) + 2 * η_c * T_1 * (1 - r_p ^ α))

end

function η_th(r_p, Gas, T_3)
    κ = Gas.κ
    α = (κ - 1) / κ
    T_5 = T_3;

    return ((1 - r_p ^ α) - ((2 * T_1 / T_5) * (rp ^ (α / 2) - 1)) / (1 - (T_1 / T_5) * rp ^ (α / 2))

end

function η_II(T_2, T_3, r_p, Gas, T_0)
    κ = Gas.κ
    α = (κ - 1) / κ
    T_5 = T_3;


    return (((1 - r_p ^ α) - ((2 * T_1 / T_5) * (rp ^ (α / 2) - 1)) / (1 - (T_1 / T_5) * rp ^ (α / 2))) / ((T_2 + T_3) - T_0*ln(T_2 * T_3))

end
=======
