using Plots
using LaTeXStrings


Gasses = [Argon, Air, He, H]


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
            T_1, T_2, T_3, T_4 = Temp(r_p[j], T_min, T_max, η_c, η_t, ϵ, Gasses[i]);
            Φ_Q_in[j] = cycle_func(T_2, T_3, T_H, Gasses[i])
        end
        plot!(r_p, Φ_Q_in, label=Gasses[i].name, c = i)
    end

    xlabel!("Pressure Ratio")
    ylabel!("Exergy Destroyed")

end
function Φ_Q_in_vs_rp(cycle_func, r_p, Gasses, T_min, T_max, T_H, η_c, η_t, ϵ)
    N = length(r_p)
    M = length(Gasses)

    plot()

    for i ∈ 1:M
        Φ_Q_in = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            T_1, T_2, T_3, T_4 = Temp(r_p[j], T_min, T_max, η_c, η_t, ϵ, Gasses[i]);
            Φ_Q_in[j] = cycle_func(T_2, T_3, T_H, Gasses[i])
        end
        plot!(r_p, Φ_Q_in, label=Gasses[i].name, c = i)
    end

    xlabel!("Pressure Ratio")
    ylabel!("Exergy Destroyed")

end