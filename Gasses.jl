# Properties of Gases

mutable struct Gas
    cp::Float64
    cv::Float64
    κ::Float64
end

Argon = Gas(0.520, 0.312, 1.67)
He = Gas(5.193, 3.116, 1.667)
N_2 = Gas(1.039, 0.743, 1.400)
CO_2 = Gas(0.846, 0.657, 1.289)
CO = Gas(1.040, 0.744, 1.400)
Air = Gas(1.005, 0.718, 1.400)


