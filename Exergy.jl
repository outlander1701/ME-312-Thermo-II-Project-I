function Φ_Q_out(T_in, T_out, T_L, Gas)
    C_p = Gas.cp;
    return T_L*C_p*log(T_out/T_in) + C_p*(T_in - T_out)
end

function Φ_Q_in(T_in, T_out, T_L, T_H, Gas)
    C_p = Gas.cp;
    return T_L*C_p*log(T_out/T_in) - C_p*(T_L/T_H)*(T_out - T_in)
end

function Φ_Turbine(C_p, T_max, η_t, r_p, n, Gas)

    κ = Gas.κ;
    α = (κ-1)/κ;
    r_p_1 = (r_p)^(1/n);

    return η_t*C_p*T_max*(1 - (r_p_1^(-α)))
end

function Φ_Compressor(C_p, T_min, η_c, r_p, n, Gas)
    
    κ = Gas.κ;
    α = (κ-1)/κ;
    r_p_1 = (r_p)^(1/n);

    return C_p*T_min*(r_p_1^(α) - 1)*((1/η_c) - 1)
end