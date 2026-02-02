using DrWatson
@quickactivate "Paper_Leipold_FPO_Linear_2026"

using DynaMeth
using Plots
using JuMP
using LaTeXStrings


include(srcdir("plot_linear_cstr.jl"))


## Periodic operation
# Optimization Settings
setop = 1               #objective function
ss = false              #steady state or not
fixnin = false           #fixed nin
start = false           #start setze vorherigen punkt auf x0
sca = 1e8              #objective scalierung
mold = nothing
setup = @strdict setop ss fixnin start sca mold
np = 40                 #number of pareto points

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

# Linker rand

setup["setop"] = 1
model = opti_test1(0, param, setup)

result = collect_results_JuMP(model)
full = merge(result, param)

# Rechter rand

setup["setop"] = 2
model = opti_test1(0, param, setup)

result = collect_results_JuMP(model)
full_new = merge(result, param)

insert_result!(full, full_new, np)

epsilon = LinRange(full[:obj2][1], full[:obj2][end], np)

# result
setup["setop"] = 1
for i = 2:np-1
    model = opti_test1(epsilon[i], param, setup)

    result = collect_results_JuMP(model)
    full_new = merge(result, param)
    insert_result!(full, full_new, i)

end


### Steady state
# Optimization Settings
setop = 1               #objective function
ss = true                #steady state or not
fixnin = false           #fixed nin
start = false           #start setze vorherigen punkt auf x0
sca = 1e8              #objective scalierung
mold = nothing
setup = @strdict setop ss fixnin start sca mold
np = 40                 #number pareto points

# Optimization Parameter 
n0 = 2
ordn = 2
nc = 3
nin = 1
N2 = 0.5
per_f = x -> squarewave(x - pi / 2; period=2 * pi, sharpness=100.0)
u_lb = [0.5, 0.5, 0.0, 0.0, 0.0, 1e-4, 0.5, 0.2 * nin]
u_ub = [1, 1, 1, 1, 1, 1e-1, 2, 5 * nin]
plot(per_f)
plot!(sig)
param = @strdict n0 ordn nin N2 per_f u_lb u_ub

# Linker rand

setup["setop"] = 1
model = opti_test1(0, param, setup)

result = collect_results_JuMP(model)
fullss = merge(result, param)

# Rechter rand

setup["setop"] = 2
model = opti_test1(0, param, setup)

result = collect_results_JuMP(model)
full_new = merge(result, param)

insert_result!(fullss, full_new, np)

epsilon = LinRange(fullss[:obj2][1], fullss[:obj2][end], np)

# result
setup["setop"] = 1
for i = 2:np-1
    model = opti_test1(epsilon[i], param, setup)

    result = collect_results_JuMP(model)
    full_new = merge(result, param)
    insert_result!(fullss, full_new, i)

end

wsave(datadir("simulations/fpo", "linear_pareto_squ_1.jld2"), full)
wsave(datadir("simulations/fpo", "linear_pareto_ss_1.jld2"), fullss)

full = Dict(Symbol(k) => v for (k, v) in wload(datadir("sims", "linear_pareto_squ_1.jld2")))
fullss = Dict(Symbol(k) => v for (k, v) in wload(datadir("sims", "linear_pareto_ss_1.jld2")))

#Plot
pgfplotsx()
plot_linear_cstr_front(full, fullss)



