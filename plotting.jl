using Plots
using LaTeXStrings

function η_th_vs_rp(cycle_func, r_p, Gasses, T_1, T_3, η_c, η_t, ϵ, ribbon)
    N = length(r_p)
    M = length(Gasses)

    plot()

    for i ∈ 1:M
        η_th = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            η_th[j] = cycle_func(r_p[j], T_1, T_3, η_c, η_t, ϵ, Gasses[i])
        end

        η_th_80 = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            η_th_80[j] = cycle_func(r_p[j], T_1, T_3, η_c, η_t, 0.8, Gasses[i])
        end

        η_th_100 = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            η_th_100[j] = cycle_func(r_p[j], T_1, T_3, η_c, η_t, 1, Gasses[i])
        end

        plot!(r_p, η_th, label=Gasses[i].name, c = i)
        if ribbon == true
            plot!(r_p, η_th_80, fillrange=η_th_100, fillalpha = 0.1, c = i, alpha=0.1, label=nothing)
        end
    end

    xlabel!("Pressure Ratio")
    ylabel!("Thermal Efficiency")

end

function η_II_vs_rp(cycle_func, r_p, Gasses, T_min, T_max, η_c, η_t, ϵ, ribbon)
    N = length(r_p)
    M = length(Gasses)

    plot()

    for i ∈ 1:M
        η_II = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            η_II[j] = cycle_func(r_p[j], T_min, T_max, T_0, η_c, η_t, ϵ, Gasses[i])
        end

        η_II_80 = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            η_II_80[j] = cycle_func(r_p[j], T_min, T_max, T_0, η_c, η_t, 0.8, Gasses[i])
        end

        η_II_100 = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            η_II_100[j] = cycle_func(r_p[j], T_min, T_max, T_0, η_c, η_t, 1, Gasses[i])
        end

        plot!(r_p, η_II, label=Gasses[i].name, c = i)
        if ribbon == true
            plot!(r_p, η_II_80, fillrange=η_II_100, fillalpha = 0.1, c = i, alpha=0.1, label=nothing)
        end
    end

    xlabel!("Pressure Ratio")
    ylabel!("Second Law Efficiency")

end

function work_out_net_vs_rp(cycle_func, r_p, T_1, T_3, η_c, η_t, Gasses, ribbon)
    N = length(r_p)
    M = length(Gasses)

    plot()

    for i ∈ 1:M
        w_out_net = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            w_out_net[j] = cycle_func(r_p[j], T_1, T_3, η_c, η_t, Gasses[i])
        end

        w_out_net_80 = Array{Float64, 1}(undef, N)
        for a ∈ 1:N
            w_out_net_80[a] = cycle_func(r_p[a], T_1, T_3, 0.8, 0.8, Gasses[i])
        end

        w_out_net_100 = Array{Float64, 1}(undef, N)
        for a ∈ 1:N
            w_out_net_100[a] = cycle_func(r_p[a], T_1, T_3, 1, 1, Gasses[i])
        end
    
        plot!(r_p, w_out_net, label=Gasses[i].name, c = i)
        if ribbon == true
            plot!(r_p, w_out_net_80, fillrange=w_out_net_100, fillalpha = 0.1, c = i, alpha=0.2, label=nothing)
        end
    end

    xlabel!("Pressure Ratio")
    ylabel!("Net Work Out")

end

function work_out_net_vs_η_th(eff_func, work_func, r_p, T_min, T_max, η_c, η_t, ϵ, Gasses, ribbon)
    N = length(r_p)
    M = length(Gasses)

    plot()

    for i ∈ 1:M
        w_out_net = Array{Float64, 1}(undef, N)
        for j ∈ 1:N
            w_out_net[j] = work_func(r_p[j], T_min, T_max, η_c, η_t, Gasses[i])
        end

        w_out_net_80 = Array{Float64, 1}(undef, N)
        for a ∈ 1:N
            w_out_net_80[a] = work_func(r_p[a], T_min, T_max, 0.8, 0.8, Gasses[i])
        end

        w_out_net_100 = Array{Float64, 1}(undef, N)
        for a ∈ 1:N
            w_out_net_100[a] = work_func(r_p[a], T_min, T_max, 1, 1, Gasses[i])
        end
        
        end_index = 1
        η_th = Array{Float64, 1}(undef, N)
        for k ∈ 1:N

            η_th[k] = eff_func(r_p[k], T_min, T_max, η_c, η_t, ϵ, Gasses[i])

            if k>2 && η_th[k] < η_th[k-1]
                end_index = k
                break
            end
        end

        if end_index > 1 && ribbon == true

            name = Gasses[i].name
            plot!(η_th[1:end_index], w_out_net_80[1:end_index], fillrange=w_out_net_100[1:end_index], fillalpha = 0.2, c = i, alpha=0.2, label=latexstring("$name: \$0.8 < \\eta_{C,T} < 1\$"), gradient=true)
            plot!(η_th[1:end_index], w_out_net_80[1:end_index], label=nothing, line=(1, :dash), c=i)
            plot!(η_th[1:end_index], w_out_net_100[1:end_index], label=nothing, c=i)

        elseif ribbon == true
            plot!(η_th, w_out_net_80, fillrange=w_out_net_100, fillalpha = 0.2, c = i, alpha=0.2, label=Gasses[i].name)
        end

        
    end

    xlabel!("Thermal Efficiency")
    ylabel!("Net Work Out")

end