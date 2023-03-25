function Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ;
    α = (κ-1)/κ;
    r_p_1 = r_p^(1/2);

    T_1 = T_min;
    T_2 = (T_min/η_c)*(r_p_1^(α)-1) + T_min;
    T_3 = T_1;
    T_4 = T_2;
    T_5 = T_max;
    T_6 = T_max*η_t*(1-r_p_1^(-α)) + T_max;

    return T_1, T_2, T_3, T_4, T_5, T_6
end

function w_out_net(r_p, T_min, T_max, η_c, η_t, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)
    T_1 = T_min
    T_5 = T_max

    #return c_p * (η_t * T_3 * (r_p^(-α) - 1) + 2 * η_c * T_1 * (1 - r_p_1^α)) # Wrong
    #return c_p*T_5*(1-r_p^(-α)) - (2*c_p*T_1*(r_p^(0.5*α) - 1)) # this is the eq from the book and it is wrong
    return η_t * c_p * T_max * (1 - r_p^(-α)) - (2 * c_p * T_1 / η_c) * (r_p_1^(α) - 1)

end

function η_th(r_p, T_1, T_3, η_c, η_t, ϵ, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)
    T_min = T_1
    T_max = T_3

    #return (1 - r_p^(-α) - (2*T_1/T_5)*((r_p^(α/2)) - 1)) / (1 - (T_1 / T_5)*r_p^(α/2)) # Correct
    #return w_out_net(r_p, T_min, T_max, η_c, η_t, Gas) / (c_p * (T_max - (1/η_c)*T_min*(r_p_1^(α) - 1) - T_min))
    return w_out_net(r_p, T_min, T_max, η_c, η_t, Gas) / (c_p * (T_max - (T_min*r_p^(α))))

end

"""
function η_II(T_2, T_3, r_p, Gas, T_0)
    κ = Gas.κ
    α = (κ - 1) / κ
    T_5 = T_3;

    return ((1 - r_p ^ α) - ((2 * T_1 / T_5) * (r_p ^ (α / 2) - 1)) / (1 - (T_1 / T_5) * r_p ^ (α / 2))) / ((T_2 + T_3) - T_0*ln(T_2 * T_3))

end
"""

function η_II(r_p, T_min, T_max, T_0, η_c, η_t, ϵ, Gas)

    return η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas) / ((T_min + T_max) / T_max)
    
end
