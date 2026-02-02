using DrWatson
quickactivate(@__DIR__, "Paper_Leipold_FPO_Linear_2026")
using DynaMeth
using Plots
using JuMP
using LaTeXStrings


include(srcdir("plot_linear_cstr.jl"))

# Optimization Settings

setop = 1               #objective function
ss = false              #steady state or not
fixnin = true           #fixed nin
start = false           #start setze vorherigen punkt auf x0
mold = nothing
sca = 1e5              #objective scalierung

setup = @strdict setop ss fixnin start sca mold

# Optimization Parameter 
n0 = 300
ordn = 2
nc = 3
nin = 1
N2 = 0.5
per_f = x -> squarewave(x - pi / 2; period=2 * pi, sharpness=10.0)
u_lb = [0.5, 0.5, 0.5, 1.0, 0.5, 1e-4, 0.5, 0.2 * nin]
u_ub = [1, 1, 1, 1, 1, 1e-1, 2, 5 * nin]

param = @strdict n0 ordn nin N2 per_f u_lb u_ub

model = opti_test1(0, param, setup)
result = collect_results_JuMP(model)
full = merge(result, param)

wsave(datadir("sims", "linear_single_1.jld2"), full)


model = Dict(Symbol(k) => v for (k, v) in wload(datadir("sims", "linear_single_1.jld2")))

value.(model[:obj1])
ob1 = value(model[:obj1])
ob2 = value(model[:obj2])

u = value.(model[:u])

############ Plot ###########
pgfplotsx()
plot_linear_cstr_ga_in(model)
plot_linear_cstr_ga_out(model)
plot_linear_cstr(model)
