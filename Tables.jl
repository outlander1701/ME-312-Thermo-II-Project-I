using Plots
using LaTeXStrings




function Φ_out_vs_rp(cycle_func, r_p, Gasses, T_min, T_max, T_L, η_c, η_t, ϵ)
    N = length(r_p)
    M = length(Gasses)

    plot()

    for i ∈ 1:M
        Φ_Q_out = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            T_1, T_2, T_3, T_4 = Temp(r_p[j], T_min, T_max, η_c, η_t, ϵ, Gasses[i]);
            Φ_Q_out[j] = cycle_func(T_4, T_1, T_L, Gasses[i])
        end
        plot!(r_p, Φ_Q_out, label=Gasses[i].name, c = i)
    end

    xlabel!("Pressure Ratio")
    ylabel!(L" Exergy Destroyed $\frac{kJ}{kg}$")
end
function Φ_Q_in_vs_rp(cycle_func, r_p, Gasses, T_min, T_max, T_H, η_c, η_t, ϵ)
    N = length(r_p)
    M = length(Gasses)
    plot()

    for i ∈ 1:M
        Φ_Q_in = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            T_1, T_2, T_3, T_4, T_5, T_6, T_7, T_8, T_9, T_10 = Temp(r_p[j], T_min, T_max, η_c, η_t, ϵ, Gasses[i]);
            Φ_Q_in[j] = cycle_func(T_7, T_8, T_H, Gasses[i])
        end
        Φ_Q_in_80 = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            T_1, T_2, T_3, T_4, T_5, T_6, T_7, T_8, T_9, T_10 = Temp(r_p[j], T_min, T_max, η_c, η_t, 0.8, Gasses[i]);
            Φ_Q_in_80[j] = cycle_func(T_5, T_6, T_H, Gasses[i])
        end
        Φ_Q_in_100 = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            T_1, T_2, T_3, T_4, T_5, T_6, T_7, T_8, T_9, T_10 = Temp(r_p[j], T_min, T_max, η_c, η_t, 1, Gasses[i]);
            Φ_Q_in_100[j] = cycle_func(T_5, T_6, T_H, Gasses[i])
        end
        plot!(r_p, Φ_Q_in, label=Gasses[i].name, c = i)
        #plot!(r_p, Φ_Q_in_80, fillrange=Φ_Q_in_100, fillalpha = 0.5, c = i, alpha=0.2, label=Gasses[i].name, gradient=true)
        #plot!(r_p, Φ_Q_in_80, label=nothing, line = (1, :dash), c=i)
        #plot!(r_p, Φ_Q_in_100, label=nothing, c=i)


    end

    xlabel!("Pressure Ratio")
    ylabel!("Exergy Destroyed [kJ/kg]")

end
function Φ_Q_out_vs_rp(cycle_func, r_p, Gasses, T_min, T_max, T_L, η_c, η_t, ϵ)
    N = length(r_p)
    M = length(Gasses)

    plot()

    for i ∈ 1:M
        Φ_Q_out = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            T_1, T_2, T_3, T_4, T_5, T_6, T_7, T_8, T_9, T_10 = Temp(r_p[j], T_min, T_max, η_c, η_t, ϵ, Gasses[i]);
            Φ_Q_out[j] = cycle_func(T_10, T_1, T_L, Gasses[i])
        end
        plot!(r_p, Φ_Q_out, label=Gasses[i].name, c = i)
    end

    xlabel!("Pressure Ratio")
    ylabel!("Exergy Destroyed [kJ/kg]")

end