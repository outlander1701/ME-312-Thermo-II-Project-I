

function Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ;
    α = (κ-1)/κ;
    r_p_1 = r_p^(1/2);

    T_1 = T_min;
    T_2 = (T_min/η_c)*(r_p_1^(α) - 1) + T_min;
    T_3 = T_1;
    T_4 = T_2;
    T_6 = T_max;
    T_7 = T_max*η_t*(r_p_1^(-α) - 1) + T_max;
    T_8 = T_6;
    T_9 = T_7;
    T_10 = T_4;
    T_5 = ϵ*(T_9 - T_4) + T_4;


    return T_1, T_2, T_3, T_4, T_5, T_6, T_7, T_8, T_9, T_10
end


function w_out_net(r_p, T_min, T_max, η_c, η_t, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)

    return 2*c_p*(η_t * T_max *(1 - r_p_1^(-α)) - (T_min / η_c) * (r_p_1^(α) - 1))
end

function η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    κ = Gas.κ
    c_p = Gas.cp
    α = (κ - 1) / κ
    r_p_1 = sqrt(r_p)

    T_1, T_2, T_3, T_4, T_5, T_6, T_7, T_8, T_9, T_10 = Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)

    return w_out_net(r_p, T_min, T_max, η_c, η_t, Gas) / (c_p*(T_max-T_5)+(c_p*T_max*(1-r_p_1^(-α))))
end

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
    T_1, T_2, T_3, T_4, T_5, T_6, T_7, T_8, T_9, T_10 = Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)

    T_max_avg = log_avg([T_6, T_5, T_8, T_7]) 

    return η_th(r_p, T_min, T_max, η_c, η_t, ϵ, Gas) / (1 - (T_L / T_max_avg))
    
end

