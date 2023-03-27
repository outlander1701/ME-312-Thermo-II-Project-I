include("./Exergy.jl")
#include("./extrema.jl")
("./cycles/simple.jl")
#include("./cycles/intercool.jl")
#include("./cycles/regen.jl")
#include("./cycles/IRR.jl")
#include("./cycles/IRR.jl")
include("./Tables.jl")
include("./plotting.jl")
include("./Gasses.jl")


using Plots
gr()

# Assumed Cycle States
T_min = 313 # K 
T_max = 1590 # K 
T_L = 283 # K
T_H = 1620

# Properites to Vary
r_p = 1:1:60

η_c = 1
η_t = 1
ϵ = 0

function Φ_Total(r_p, T_min, T_max, T_L, T_H, η_c, η_t, ϵ, Gas)
    T_1, T_2, T_3, T_4, T_5, T_6, T_7, T_8, T_9, T_10 = Temp(r_p, T_min, T_max, η_c, η_t, ϵ, Gas)
    Φ_Heat_in = Φ_Q_in(T_5, T_6, T_L, T_H, Gas) + Φ_Q_in(T_7, T_8, T_L, T_H, Gas)
    Φ_Heat_out = Φ_Q_out(T_2, T_3, T_L, Gas) + Φ_Q_out(T_9, T_10, T_L, Gas)
    Φ_Compr = Φ_Compressor(r_p, T_1, η_c, 2, Gas)
    Φ_Turb = Φ_Turbine(r_p, T_6, η_t, 2, Gas)
    Φ_reg = Φ_regen(r_p,T_10, T_9, T_4, T_L, ϵ, Gas)
    
    return  Φ_Heat_in + Φ_Heat_out + Φ_Compr + Φ_Turb + Φ_reg
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
# Gas Vector
Gasses = [Argon, Air, He, H] #[Argon, CO_2, Air, He, H] #[Argon, N_2, CO, CO_2, Air]

# Plots
#η_th_vs_rp(η_th, r_p, Gasses, T_min, T_max, η_c, η_t, ϵ, true, true)

#work_out_net_vs_rp(w_out_net, r_p, T_min, T_max, η_c, η_t, Gasses, true) # For air, r_p* = 17.2 # Do this one

#work_out_net_vs_η_th(η_th, w_out_net, r_p, T_min, T_max, η_c, η_t, ϵ, Gasses, true, true) # Do this one

#η_II_vs_rp(η_II, r_p, Gasses, T_min, T_max, η_c, η_t, ϵ, true, true)

#Φ_Q_in_vs_rp(Φ_Q_in, r_p, Gasses, T_min, T_max,T_L, T_H, η_c, η_t, ϵ)

#Φ_Q_out_vs_rp(Φ_Q_out, r_p, Gasses, T_min, T_max, T_L, η_c, η_t, ϵ)
Φ_Total_r_vs_rp(Φ_Total, r_p, T_min, T_max, T_L, T_H, η_c, η_t, ϵ, Gasses)
#Φ_Total_c_vs_rp(Φ_Total, r_p, T_min, T_max, T_L, T_H, η_c, η_t, ϵ, Gasses)
#Φ_Total_t_vs_rp(Φ_Total, r_p, T_min, T_max, T_L, T_H, η_c, η_t, ϵ, Gasses)

