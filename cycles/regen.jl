{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "2bf53b10-528f-4aba-a10e-b4c72489592d",
   "metadata": {},
   "outputs": [],
   "source": [
    "function w_out_net(r_p, T_1, T_3, η_c, η_t, Gas)\n",
    "    κ = Gas.k\n",
    "    α = (κ - 1) / κ\n",
    "\n",
    "    return (T_1 / η_c) * (r_p ^ α - 1) - η_t * T_3 * (1 - r_p ^ α)\n",
    "\n",
    "end\n",
    "\n",
    "function η_th(r_p, T_1, T_3, Gas)\n",
    "    κ = Gas.κ\n",
    "    α = (κ - 1) / κ\n",
    "\n",
    "    return 1 - T_1 /  T_3 * (r_p) ^ α\n",
    "\n",
    "end\n",
    "\n",
    "function η_II(T_2, T_3, r_p, Gas, T_0)\n",
    "    κ = Gas.κ\n",
    "    α = (κ - 1) / κ\n",
    "\n",
    "    return (1 - T_1 /  T_3 * (r_p) ^ α) / (1 - (T_0*ln(T_2 * T_3) / (T_2 + T_3)))\n",
    "\n",
    "end"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Julia 1.8.5",
   "language": "julia",
   "name": "julia-1.8"
  },
  "language_info": {
   "file_extension": ".jl",
   "mimetype": "application/julia",
   "name": "julia",
   "version": "1.8.5"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
