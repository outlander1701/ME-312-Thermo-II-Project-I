#include("./cycles/simple.jl")
#include("./cycles/intercool.jl")
include("./cycles/regen.jl")
#include("./cycles/IRR.jl")
include("./plotting.jl")
include("./Gasses.jl")

using Plots
# Assumed Cycle States
T_1 = 313 #K 
T_3 = 1590 #K 
η_c = 1
η_t = 1
ϵ = 1

# Properites to Vary
r_p = 1:0.01:60
#Gasses = [He, H, Argon, N_2, CO, CO_2, Air]
Gasses = [Argon, N_2, CO, CO_2, Air]#[Argon, N_2, CO, CO_2, Air]

η_th_vs_rp(η_th, r_p, Gasses, T_1, T_3, η_c, η_t, ϵ)

#work_out_net_vs_rp(w_out_net, r_p, T_1, T_3, η_c, η_t, Gasses) # For air, r_p* = 17.2

# Test