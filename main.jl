#include("./cycles/simple.jl")
include("./cycles/intercool.jl")
include("./plotting.jl")
include("./Gasses.jl")

# Assumed Cycle States
T_1 = 313 #K 
T_3 = 1590 #K 
η_c = 1
η_t = 1

# Properites to Vary
r_p = 1:0.01:30
Gasses = [Air, Argon, CO_2]

#η_th_vs_rp(η_th, r_p, Gasses)

#work_out_net_vs_rp(w_out_net, r_p, T_1, T_3, η_c, η_t, Gasses) # For air, r_p* = 17.19
work_out_net_vs_rp(w_out_net, r_p, T_1, T_3, η_c, η_t, Gasses) # For air, r_p* = 17.19

