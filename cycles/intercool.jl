function Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ;
    α = (κ-1)/κ;
    r_p_1 = r_p^(1/2);

    T_1 = T_min;
    T_2 = (T_min/η_c)*(r_p_1^(α)-1) + T_min;
    T_3 = T_1;
    T_4 = T_2;
    T_5 = T_max;
    T_6 = T_max*η_t*(r_p_1^(-α)-1) + T_max;

    return T_1, T_2, T_3, T_4, T_5, T_6
end

function w_out_net(r_p, T_min, T_max, η_c, η_t, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)

    return η_t * c_p * T_max * (1 - r_p^(-α)) - (2 * c_p * T_1 / η_c) * (r_p_1^(α) - 1)

end

function η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)
    
    return w_out_net(r_p, T_min, T_max, η_c, η_t, Gas) / (c_p * (T_max - (T_min/η_c)*r_p_1^(α)))

end

function log_avg(T_vec)

    numerator = 0
    denominator = 0

    function log_avg(T_vec)

        numerator = 0
        denominator = 0
    
        for i ∈ eachindex(T_vec)
            if isodd(i)
                numerator += T_vec[i]
                denominator += log(T_vec[i])
            else
                numerator -= T_vec[i]
                denominator -= log(T_vec[i])
            end
        end
    
        return numerator / denominator
        
    end
    
    
    
function η_II(r_p, T_min, T_max, T_L, η_c, η_t, ϵ, Gas)
        κ = Gas.κ
        c_p = Gas.cp
        α = (κ - 1) / κ
    
        T_1, T_2, T_3, T_4, T_5, T_6 = Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    
        T_min_avg = ((T_6 - T_1) + (T_2 - T_3)) / (log(T_6) - log(T_1) + log(T_2) - log(T_3))
        T_max_avg = (T_5 - T_4) / log(T_5 / T_4)   
    
    return η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas) / (1 - (T_L / T_max_avg))
end
