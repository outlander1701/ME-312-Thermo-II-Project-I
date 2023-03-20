# Properties of Gases
using LaTeXStrings

mutable struct Gas
    cp::Float64
    cv::Float64
    κ::Float64
    name::String
end

Argon = Gas(0.520, 0.312, 1.67, L"Ar")
H = Gas(14.307, 10.183, 1.405, L"H_2")
He = Gas(5.193, 3.116, 1.667, L"He")
N_2 = Gas(1.039, 0.743, 1.400, L"N_2")
CO_2 = Gas(0.846, 0.657, 1.289, L"CO_2")
CO = Gas(1.040, 0.744, 1.400, L"CO")
Air = Gas(1.005, 0.718, 1.400, L"Air")


