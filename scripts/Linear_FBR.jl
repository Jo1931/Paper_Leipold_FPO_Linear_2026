using DrWatson
@quickactivate "Paper_Leipold_FPO_Linear_2026"


using DynaMeth
using Plots
using JuMP
using LaTeXStrings
import HSL                  # Wrapper-Package
HSL.LIBHSL_isfunctional()   # → true, wenn alles korrekt installiert

include(srcdir("plot_linear_fbr.jl"))

model = Dict(Symbol(k) => v for (k, v) in wload(datadir("sims", "pftr_single_1.jld2")))


# Optimization Settings
setop = 1               #objective function
ss = false              #steady state or not
fixnin = true           #fixed nin
start = true            #start setze vorherigen punkt auf x0
mold = model
sca = 1e5               #objective scalierung

setup = @strdict setop ss fixnin start sca mold

# Optimization Parameter 
n0 = 100
m0 = 100
ordn = 2
ordm = 2
nc = 3
nin = 1#log(2)
N2 = 0.5
l = 1#log(2)
per_f = x -> squarewave(x - pi / 2; period=2 * pi, sharpness=10.0)
u_lb = [0.5, 0.5, 1.0, 1.0, 1.0, 1e-4, 0.5, 0.2 * nin]
u_ub = [1, 1, 1, 1, 1, 1e+1, 2, 5 * nin]

param = @strdict n0 ordn nin N2 per_f u_lb u_ub m0 ordm l


model = opti_pftr_1(0, param, setup)
result = collect_results_JuMP(model)
full = merge(result, param)



wsave(datadir("sims", "pftr_single_1_fin_round.jld2"), full)


model = Dict(Symbol(k) => v for (k, v) in wload(datadir("sims", "pftr_single_1_fin_round.jld2")))


############ Plot ###########
gr()
plot_linear_fbr_gif(model)
pgfplotsx()
plot_linear_fbr(model)

