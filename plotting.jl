using Plots
using LaTeXStrings

function η_th_vs_rp(cycle_func, r_p, Gasses, T_1, T_3, η_c, η_t, ϵ)
    N = length(r_p)
    M = length(Gasses)

    plot()

    for i ∈ 1:M
        η_th = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            η_th[j] = cycle_func(r_p[j], T_1, T_3, η_c, η_t, ϵ, Gasses[i])
        end
    
        plot!(r_p, η_th, label=Gasses[i].name)
        
    end

    xlabel!("Pressure Ratio")
    ylabel!("Thermal Efficiency")

end

function work_out_net_vs_rp(cycle_func, r_p, T_1, T_3, η_c, η_t, Gasses)
    N = length(r_p)
    M = length(Gasses)

    plot()

    for i ∈ 1:M
        w_out_net = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            w_out_net[j] = cycle_func(r_p[j], T_1, T_3, η_c, η_t, Gasses[i])
        end
    
        plot!(r_p, w_out_net, label=Gasses[i].name)
        
    end

    xlabel!("Pressure Ratio")
    ylabel!("Net Work Out")

end