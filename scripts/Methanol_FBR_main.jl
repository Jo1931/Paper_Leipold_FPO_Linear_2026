using DrWatson
quickactivate(@__DIR__, "Paper_Leipold_FPO_Linear_2026")

using DynaMeth
using Plots
using JuMP
using LaTeXStrings
import HSL                  # Wrapper-Package
HSL.LIBHSL_isfunctional()   # → true, wenn alles korrekt installiert

include(srcdir("plot_methanol_fbr.jl"))


########### Setup #####################################################
# The optimization of the complete Pareto front is challenging,
# mainly due to frequent and partly random convergence issues.
# Very small changes in the objective scaling factor (sca) can already
# determine whether the solver converges or not. For this reason,
# a random factor is applied to the scaling.
#
# In principle, the entire Pareto front could be generated in a single
# automated run using a loop (see the framework in Leipold et al., 2025).
# However, in practice it is significantly more efficient to use an
# interactive, line-by-line execution of the script and manually adjust
# the scaling factor using "expert knowledge" at Pareto points where
# convergence problems occur.
#
# The following script section was used to generate all FBR results
# presented in the paper.
#
# n      ... number of time discretization points
# ordn   ... collocation order in time
# m      ... number of spatial discretization points
# ordm   ... collocation order in space
# optimize_temperature  ... true: temperature is optimized
#                          false: temperature is kept constant
# isothermal            ... true: isothermal operation
#                          false: non-isothermal operation
#
# The input function is defined via reac.methods.signal.
# In steady-state operation, the signal must be set to x -> 0.
# In steady state n can be set to 2 to reduce computational time
#
# The kinetic can be chosen between:
# SeidelJump()   ... Seidel et al.
# NestlerJump()  ... Nestler et al.
# AutoCatJump()  ... Kortuz et al.
# BusscheJump()  ... Vanden Bussche et al.
# BrilmanJump()  ... van Schagen et al.
##########################################################################

fpo = SetupFpoPftr(n=2, ordn=2, m=50, ordm=2, numP=40, N2=0.15, kinetic=SeidelJump(), optimize_temperature=false, isothermal=true)
reac = Reactor(fpo)

#set input signal
#reac.methods.signal = sig      #squarewaves
reac.methods.signal = x -> 0    #steady state
reac.methods.optimize = :CO_N2_NIN

#set properties
reac.properties.Tc = 230 + 273.15
reac.properties.Tin = 230 + 273.15
reac.properties.P = 6e6
reac.properties.qsat = 0

##### properties for smaller FBR ######
#hcat1 = 1.12
#dint = 0.011825524
#V = pi / 4 * dint^2 * hcat1
#reac.properties.Vgas = V * 0.39
#reac.properties.mcat = V * 1134

## Start ##
#left
reac.methods.setObjective = 1
init_reactor = reac.methods.predictor(reac, 1)
for k = 1:1
    model = optimizeRPLUG!(init_reactor, 0.0, 1, reac, sca=100000.00 * rand(), linear_solver="ma97", max_iter=300) #linear_solver can be change to mumps
end

#right
reac.methods.setObjective = 2
init_reactor = reac.methods.predictor(reac, 1)
init_reactor.ulb[8] = 0.0

for k = 1:1
    optimizeRPLUG!(init_reactor, 0.0, reac.methods.numP, reac; sca=100000 * rand(), linear_solver="ma97", max_iter=300) #linear_solver can be change to mumps
end
epsilon = LinRange(reac.methods.sol.obj2[1], reac.methods.sol.obj2[end], reac.methods.numP)

## Front ##
reac.methods.setObjective = 1
for i = reac.methods.numP-1:-1:2
    init_reactor = reac.methods.predictor(reac, i, height=0.5, direction=:forward)
    init_reactor.ulb[8] = 0.0
    for k = 1:3
        optimizeRPLUG!(init_reactor, epsilon[i], i, reac; sca=100000 * rand(), linear_solver="ma97", max_iter=200) #linear_solver can be change to mumps
        print(string(i) * " ")
    end
end

plot_sol(reac.methods.sol)

#save_sol = convert_sol_to_tupel(reac.methods.sol)
#sdir = datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m2_isothermal_60bar_503k.jld2")
#jldsave(sdir; sol=save_sol)

##### Plots ######
pgfplotsx()
plot_methanol_fbr_konstT_all() #Konst T = 503K all
plot_methanol_fbr_optT_all() #Konst T = opt all
plot_methanol_fbr_equi() #Equilibrium
plot_methanol_fbr_konstT() #Konst T = 503K 
plot_methanol_fbr_small() #small FBR

