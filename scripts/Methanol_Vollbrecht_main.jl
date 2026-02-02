using DrWatson
quickactivate(@__DIR__, "Paper_Leipold_FPO_Linear_2026")

using DynaMeth
using Plots
using JuMP
using LaTeXStrings
import HSL                  # Wrapper-Package
HSL.LIBHSL_isfunctional()   # → true, wenn alles korrekt installiert

include(srcdir("plot_methanol_vollbrecht.jl"))

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
# The following script section was used to generate the Vollbrecht CSTR results
# presented in the paper.
#
# n      ... number of time discretization points
# ordn   ... collocation order in time
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

fpo = SetupFpoCstr(n=2, ordn=2, numP=40, N2=0.15, kinetic=BusscheJump(), setMfcCons=false, properties=SetupVollbrecht(), optimize_temperature=false, isothermal=true)
cstr = Reactor(fpo)

#set properties
cstr.properties.Tc = 230 + 273.15
cstr.properties.Tin = 230 + 273.15
cstr.properties.P = 50.0 * 1e5
cstr.properties.qsat = 0

#set input signal
#cstr.methods.signal = sig      #squarewaves
cstr.methods.signal = x -> 0    #steady state
cstr.methods.optimize = :CO_N2_NIN

#Left
cstr.methods.setObjective = 1
init = cstr.methods.predictor(cstr, 1)
for k = 1:10
    model = optimizeCSTR(init, 0.0, cstr, sca=1.0 * rand(), max_iter=500)

    if (termination_status(model) == TerminationStatusCode(4) || termination_status(model) == TerminationStatusCode(10) || termination_status(model) == TerminationStatusCode(19)) && value(model[:obj1]) > cstr.methods.sol.obj1[1]
        cstr.methods.sol(model, 1)
    end
end

#Right
cstr.methods.setObjective = 2
init = cstr.methods.predictor(cstr, 2)
for k = 1:10
    model = optimizeCSTR(init, 0.0, cstr, sca=10.09 * rand(), max_iter=1000)
    if (termination_status(model) == TerminationStatusCode(4) || termination_status(model) == TerminationStatusCode(10) || termination_status(model) == TerminationStatusCode(19)) && value(model[:obj2]) > cstr.methods.sol.obj2[end]
        cstr.methods.sol(model, cstr.methods.numP)
    end
end

epsilon = LinRange(cstr.methods.sol.obj2[1], cstr.methods.sol.obj2[end], cstr.methods.numP)

#Front
cstr.methods.setObjective = 1
for i = cstr.methods.numP-1:-1:2
    for k = 1:5
        init = cstr.methods.predictor(cstr, i; direction=:forward, height=0.11)
        model = optimizeCSTR(init, epsilon[i], cstr; sca=0.01 * rand(), max_iter=1000)
        if (termination_status(model) == TerminationStatusCode(4) || termination_status(model) == TerminationStatusCode(10) || termination_status(model) == TerminationStatusCode(19)) && value(model[:obj1]) > cstr.methods.sol.obj1[i]
            cstr.methods.sol(model, i)
        end
        print(i)
        print(" ")
    end
end

#save_sol = convert_sol_to_tupel(cstr.methods.sol)
#sdir = datadir("sims", "CSTR_Vollbrecht_Front_ss_Bussche_isothermal_T503_P50.jld2")
#jldsave(sdir; sol=save_sol)

####Simulate steady state + linear rate suboptimal front ###############
kinetic = "Bussche"

ldir = datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50.jld2")
sol = load(ldir)["sol"]
ldirss = datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2")
solss = load(ldirss)["sol"]
fpo = SetupFpoCstr(n=2, ordn=2, numP=40, N2=0.15, kinetic=eval(Symbol(kinetic * "Jump"))(), setMfcCons=false, properties=SetupVollbrecht(), optimize_temperature=false, isothermal=true)
cstr = Reactor(fpo)

#set input signal
cstr.methods.signal = x -> 0
cstr.methods.optimize = :NONE

#set properties
cstr.properties.Tc = 230 + 273.15
cstr.properties.Tin = 230 + 273.15
cstr.properties.P = 50.0 * 1e5

#Front
for i = 1:cstr.methods.numP

    u = copy(sol.u[:, i])
    u[9] = cstr.methods.N2
    u[2] = 1 - sol.u[1, i] - sol.u[3, i] - cstr.methods.N2

    init = cstr.methods.predictor(cstr, 1)
    init.u .= u
    init.x .= sol.x[:, 1:2, :, i]
    model = optimizeCSTR(init, 0.0, cstr, sca=10.01 * rand(), max_iter=100000)
    if value(model[:obj1]) > cstr.methods.sol.obj1[i]
        cstr.methods.sol(model, i)
    end
end


##### Simulate with Linear rate
fpo = SetupFpoCstr(n=50, ordn=2, numP=40, N2=0.15, kinetic=LinearJump(), setMfcCons=false, properties=SetupVollbrecht(), optimize_temperature=false, isothermal=true)
cstr_lin = Reactor(fpo)

#set input signal
cstr_lin.methods.signal = sig#x -> 0
cstr_lin.methods.optimize = :NONE

#set decision
cstr_lin.properties.Tc = 230 + 273.15
cstr_lin.properties.Tin = 230 + 273.15
cstr_lin.properties.P = 50.0 * 1e5

#Front
for i = 1:cstr_lin.methods.numP
    r0, x, A = calc_jacobi_rate(cstr.methods.sol.x[:, 1, 1, i], cstr, h=1e-8)
    cstr_lin.kinetic.parameter.A = A
    cstr_lin.kinetic.parameter.r0 = r0
    cstr_lin.kinetic.parameter.x0 = x

    u = copy(sol.u[:, i])

    init = cstr_lin.methods.predictor(cstr_lin, 1)
    init.u .= u
    init.x .= sol.x[:, :, :, i]
    for k = 1:3
        model = optimizeCSTR(init, 0.0, cstr_lin, sca=100.0 * rand(), max_iter=100000)
        if (termination_status(model) == TerminationStatusCode(4) || termination_status(model) == TerminationStatusCode(10) || termination_status(model) == TerminationStatusCode(19)) && value(model[:obj1]) > cstr_lin.methods.sol.obj1[i]
            cstr_lin.methods.sol(model, i)
        end
    end
end

#save_sol = convert_sol_to_tupel(cstr.methods.sol)
#sdir = datadir("sims", "CSTR_Vollbrecht_Front_squ_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2")
#jldsave(sdir; sol=save_sol)

#save_sol = convert_sol_to_tupel(cstr_lin.methods.sol)
#sdir = datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50_lin.jld2")
#jldsave(sdir; sol=save_sol)

################## Plot################

pgfplotsx()
plot_methanol_vollbrecht_cos()
plot_methanol_vollbrecht_squ()
plot_methanol_vollbrecht_squ_all()
