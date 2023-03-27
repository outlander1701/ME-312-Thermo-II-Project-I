
function Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ
    α = (κ - 1) / κ

    T_1 = T_min;
    T_2 = (T_min/η_c)*(r_p^(α)-1) + T_min;
    T_3 = T_max;
    T_4 = T_max*η_t*(r_p^(-α)-1) + T_max;

    return T_1, T_2, T_3, T_4
end


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
    T_1, T_2, T_3, T_4 = Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    return (η_t * c_p * T_3 *(1 - r_p^(-α)) - (c_p / η_c) * T_1 * (r_p^(α) - 1)) / (c_p * (T_3 - T_2))

end


function η_II(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    T_1, T_2, T_3, T_4 = Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    return η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas) 
end
"""
function Φ_Total(r_p, T_min, T_max, T_L, T_H, η_c, η_t, ϵ, Gas)
    T_1, T_2, T_3, T_4 = Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    Φ_Heat_in = Φ_Q_in(T_2, T_3, T_L, T_H, Gas)
    Φ_Heat_out = Φ_Q_out(T_4, T_1, T_L, Gas)
    Φ_Compr = Φ_Compressor(r_p, T_1, η_c, 1, Gas)
    Φ_Turb = Φ_Turbine(r_p, T_3, η_t, 1, Gas)
    #Φ_regen = Φ_regen(r_p, T_in_h, T_in_c, ϵ, Gas)
    
    return  Φ_Heat_in + Φ_Heat_out + Φ_Compr + Φ_Turb 
end
"""