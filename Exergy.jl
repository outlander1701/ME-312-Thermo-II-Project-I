function Φ_Q_out(T_in, T_out, T_L, Gas)
    C_p = Gas.cp;
    return T_L*C_p*log(T_out/T_in) + C_p*(T_in - T_out)
end

function Φ_Q_in(T_in, T_out, T_L, T_H, Gas)
    C_p = Gas.cp;
    return T_L*C_p*log(T_out/T_in) - C_p*(T_L/T_H)*(T_out - T_in)
end

function Φ_Turbine(r_p, T_max, η_t, n, Gas)
    κ = Gas.κ;
    α = (κ-1)/κ;
    C_p = Gas.cp
    r_p_1 = (r_p)^(1/n);

    return n*(1-η_t)*C_p*T_max*(1 - (r_p_1^(-α)))
end

function Φ_Compressor(r_p, T_min, η_c, n, Gas)
    C_p = Gas.cp
    κ = Gas.κ;
    α = (κ-1)/κ;
    r_p_1 = (r_p)^(1/n);

    return n*C_p*T_min*(r_p_1^(α) - 1)*((1/η_c) - 1)
end

function Φ_regen(r_p, T_in_h, T_in_c, ϵ, Gas)
    C_p = Gas.cp
    return C_p*(log(T_in_c/T_in_h)+log((ϵ*(T_in_h - T_in_c) + T_in_c)/T_in_c))
end

