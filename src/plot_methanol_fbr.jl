function plot_methanol_fbr_konstT_all()
    solSS11 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m2_isothermal_60bar_503k.jld2"))["sol"]
    sol11 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m2_isothermal_60bar_503k.jld2"))["sol"]
    Y11 = calc_equi_yield(solSS11, 6e6)

    solSS12 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_isothermal_60bar_503k.jld2"))["sol"]
    sol12 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_isothermal_60bar_503k.jld2"))["sol"]
    Y12 = calc_equi_yield(solSS12, 6e6)

    solSS21 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m2_nonisothermal_60bar_503k.jld2"))["sol"]
    sol21 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m2_nonisothermal_60bar_503k.jld2"))["sol"]
    Y21 = calc_equi_yield(solSS21, 6e6)

    solSS22 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_nonisothermal_60bar_503k.jld2"))["sol"]
    sol22 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_nonisothermal_60bar_503k.jld2"))["sol"]
    Y22 = calc_equi_yield(solSS22, 6e6)



    p11 = scatter(solSS11.obj2 * 100, solSS11.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol11.obj2 * 100, sol11.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(solSS21.obj2 * 100, solSS21.obj1, alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol21.obj2 * 100, sol21.obj1, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    plot!(Y11 * 100, solSS11.obj1, ls=:dash, c=:black, label=false)
    plot!(Y21 * 100, solSS21.obj1, alpha=0.5, ls=:dash, c=:black, label=false, title="Isothermal and nonisothermal CSTR with constant temperature", bottom_margin=3Plots.mm)

    bm = -6.3Plots.mm
    bm2 = 2 * bm
    p1 = scatter(solSS11.obj2 * 100, solSS11.u[1, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ms=3, ylims=[0.001, 0.06], xlims=[25, 72])
    scatter!(sol11.obj2 * 100, sol11.u[1, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO,in,0}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[1, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[1, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)


    p2 = scatter(solSS11.obj2 * 100, solSS11.u[2, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ylims=[0.001, 0.4], ms=3, xlims=[25, 72])
    scatter!(sol11.obj2 * 100, sol11.u[2, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO_2,in,0}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[2, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[2, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p3 = scatter(solSS11.obj2 * 100, solSS11.u[3, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.45, 0.95], ms=3, xlims=[25, 72])
    scatter!(sol11.obj2 * 100, sol11.u[3, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{H_2,in,0}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[3, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[3, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p4 = scatter(solSS11.obj2 * 100, solSS11.u[9, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.075, 0.16], ms=3, xlims=[25, 72])
    scatter!(sol11.obj2 * 100, sol11.u[9, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{N_2,in,0}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[9, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[9, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)


    p5 = scatter(sol11.obj2 * 100, sol11.u[4, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{\dot{n}}", top_margin=bm, bottom_margin=bm, ylims=[-0.1, 1.1], ms=3, xlims=[25, 72])
    scatter!(sol21.obj2 * 100, sol21.u[4, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p6 = scatter(sol11.obj2 * 100, sol11.u[5, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{CO}", bottom_margin=bm, top_margin=bm, ylims=[-0.1, 1.1], ms=3, xlims=[25, 72])
    scatter!(sol21.obj2 * 100, sol21.u[5, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p7 = scatter(sol11.obj2 * 100, sol11.u[6, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{N_2}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1], ms=3, xlims=[25, 72])
    scatter!(sol21.obj2 * 100, sol21.u[6, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p8 = scatter(sol11.obj2 * 100, sol11.u[7, :] * 60, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\tau \ in \ min}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1] * 60, ms=3, xlims=[25, 72])
    scatter!(sol21.obj2 * 100, sol21.u[7, :] * 60, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p9 = scatter(sol11.obj2 * 100, sol11.u[8, :] * pi, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\varphi \ in \ rad}", top_margin=2 * bm, ylims=[0.7, 1.3] * pi, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3, xlims=[25, 72])
    scatter!(sol21.obj2 * 100, sol21.u[8, :] * pi, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, yticks=([0.75, 1, 1.25] * pi,
            [L"\frac{3}{4} \pi", L"\pi", L"\frac{5}{4} \pi"]), ms=3)

    p10 = scatter(solSS11.obj2 * 100, solSS11.u[11, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", top_margin=2 * bm, ylims=[443, 553], ms=3, xlims=[25, 72])
    scatter!(sol11.obj2 * 100, sol11.u[11, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{T \ in \ K}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[11, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[11, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3, xlims=[25, 72])

    layout = @layout [a b = grid(5, 2)]

    ps = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]

    # --- Kombinieren ---
    pt1 = plot(p11, ps..., layout=layout, size=(1200, 600))

    p11 = scatter(solSS12.obj2 * 100, solSS12.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label="Steady state: Isothermal", xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6, legendfontsize=7)
    scatter!(sol12.obj2 * 100, sol12.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label="FPO: Isothermal", legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(solSS22.obj2 * 100, solSS22.obj1, alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label="Steady state: Nonisothermal", xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol22.obj2 * 100, sol22.obj1, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label="FPO: Nonisothermal", legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    plot!(Y12 * 100, solSS12.obj1, ls=:dash, c=:black, label="Equilibrium: Isothermal")
    plot!(Y22 * 100, solSS22.obj1, alpha=0.5, ls=:dash, c=:black, label="Equilibrium: Nonisothermal", title="Isothermal and nonisothermal FBR with optimized temperature", bottom_margin=3Plots.mm, legend_position=:bottomleft)

    bm = -6.3Plots.mm
    bm2 = 2 * bm
    p1 = scatter(solSS12.obj2 * 100, solSS12.u[1, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ms=3, ylims=[0.001, 0.07], xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[1, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO,in,0}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[1, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[1, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)


    p2 = scatter(solSS12.obj2 * 100, solSS12.u[2, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ylims=[0.0001, 0.4], ms=3, xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[2, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO_2,in,0}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[2, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[2, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p3 = scatter(solSS12.obj2 * 100, solSS12.u[3, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.45, 0.95], ms=3, xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[3, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{H_2,in,0}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[3, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[3, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p4 = scatter(solSS12.obj2 * 100, solSS12.u[9, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.075, 0.16], ms=3, xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[9, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{N_2,in,0}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[9, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[9, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)


    p5 = scatter(sol12.obj2 * 100, sol12.u[4, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{\dot{n}}", top_margin=bm, bottom_margin=bm, ylims=[-0.1, 1.1], ms=3, xlims=[25, 75])
    scatter!(sol22.obj2 * 100, sol22.u[4, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p6 = scatter(sol12.obj2 * 100, sol12.u[5, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{CO}", bottom_margin=bm, top_margin=bm, ylims=[-0.1, 1.1], ms=3, xlims=[25, 75])
    scatter!(sol22.obj2 * 100, sol22.u[5, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p7 = scatter(sol12.obj2 * 100, sol12.u[6, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{N_2}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1], ms=3, xlims=[25, 75])
    scatter!(sol22.obj2 * 100, sol22.u[6, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p8 = scatter(sol12.obj2 * 100, sol12.u[7, :] * 60, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\tau \ in \ min}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1] * 60, ms=3, xlims=[25, 75])
    scatter!(sol22.obj2 * 100, sol22.u[7, :] * 60, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p9 = scatter(sol12.obj2 * 100, sol12.u[8, :] * pi, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\varphi \ in \ rad}", top_margin=2 * bm, ylims=[0.7, 1.3] * pi, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3, xlims=[25, 75])
    scatter!(sol22.obj2 * 100, sol22.u[8, :] * pi, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, yticks=([0.75, 1, 1.25] * pi,
            [L"\frac{3}{4} \pi", L"\pi", L"\frac{5}{4} \pi"]), ms=3)

    p10 = scatter(solSS12.obj2 * 100, solSS12.u[11, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", top_margin=2 * bm, ylims=[443, 553], ms=3, xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[11, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{T_{in,c} \ in \ K}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[11, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[11, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    layout = @layout [a b = grid(5, 2)]

    ps = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]

    # --- Kombinieren ---
    pt2 = plot(p11, ps..., layout=layout, size=(1200, 600))
    p = plot(pt1, pt2, layout=(2, 1), size=(1200, 900))
    savefig(plotsdir("methanol_all_T503K.pdf"))
    return p
end

function plot_methanol_fbr_optT_all()
    solSS11 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m2_isothermal_60bar_Topt.jld2"))["sol"]
    sol11 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m2_isothermal_60bar_Topt.jld2"))["sol"]
    Y11 = calc_equi_yield(solSS11, 6e6)

    solSS12 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_isothermal_60bar_Topt.jld2"))["sol"]
    sol12 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_isothermal_60bar_Topt.jld2"))["sol"]
    Y12 = calc_equi_yield(solSS12, 6e6)

    solSS21 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m2_nonisothermal_60bar_Topt.jld2"))["sol"]
    sol21 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m2_nonisothermal_60bar_Topt.jld2"))["sol"]
    Y21 = calc_equi_yield(solSS21, 6e6)

    solSS22 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_nonisothermal_60bar_Topt.jld2"))["sol"]
    sol22 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_nonisothermal_60bar_Topt.jld2"))["sol"]
    Y22 = calc_equi_yield(solSS22, 6e6)



    p11 = scatter(solSS11.obj2 * 100, solSS11.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol11.obj2 * 100, sol11.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(solSS21.obj2 * 100, solSS21.obj1, alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol21.obj2 * 100, sol21.obj1, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    plot!(Y11 * 100, solSS11.obj1, ls=:dash, c=:black, label=false)
    plot!(Y21 * 100, solSS21.obj1, alpha=0.5, ls=:dash, c=:black, label=false, title="Isothermal and nonisothermal CSTR with optimized temperature", bottom_margin=3Plots.mm)

    bm = -6.3Plots.mm
    bm2 = 2 * bm
    p1 = scatter(solSS11.obj2 * 100, solSS11.u[1, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ms=3, ylims=[0.001, 0.06], xlims=[25, 72])
    scatter!(sol11.obj2 * 100, sol11.u[1, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO,in,0}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[1, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[1, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)


    p2 = scatter(solSS11.obj2 * 100, solSS11.u[2, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ylims=[0.001, 0.4], xlims=[25, 72], ms=3)
    scatter!(sol11.obj2 * 100, sol11.u[2, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO_2,in,0}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[2, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[2, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p3 = scatter(solSS11.obj2 * 100, solSS11.u[3, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.45, 0.95], xlims=[25, 72], ms=3)
    scatter!(sol11.obj2 * 100, sol11.u[3, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{H_2,in,0}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[3, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[3, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p4 = scatter(solSS11.obj2 * 100, solSS11.u[9, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.075, 0.16], xlims=[25, 72], ms=3)
    scatter!(sol11.obj2 * 100, sol11.u[9, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{N_2,in,0}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[9, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[9, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)


    p5 = scatter(sol11.obj2 * 100, sol11.u[4, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{\dot{n}}", top_margin=bm, bottom_margin=bm, ylims=[-0.1, 1.1], xlims=[25, 72], ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[4, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p6 = scatter(sol11.obj2 * 100, sol11.u[5, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{CO}", bottom_margin=bm, top_margin=bm, ylims=[-0.1, 1.1], xlims=[25, 72], ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[5, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p7 = scatter(sol11.obj2 * 100, sol11.u[6, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{N_2}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1], xlims=[25, 72], ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[6, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p8 = scatter(sol11.obj2 * 100, sol11.u[7, :] * 60, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\tau \ in \ min}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1] * 60, xlims=[25, 72], ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[7, :] * 60, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p9 = scatter(sol11.obj2 * 100, sol11.u[8, :] * pi, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\varphi \ in \ rad}", top_margin=2 * bm, ylims=[0.7, 1.3] * pi, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", xlims=[25, 72], ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[8, :] * pi, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, yticks=([0.75, 1, 1.25] * pi,
            [L"\frac{3}{4} \pi", L"\pi", L"\frac{5}{4} \pi"]), ms=3)

    p10 = scatter(solSS11.obj2 * 100, solSS11.u[11, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", top_margin=2 * bm, ylims=[443, 553], xlims=[25, 72], ms=3)
    scatter!(sol11.obj2 * 100, sol11.u[11, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{T \ in \ K}", ms=3)
    scatter!(solSS21.obj2 * 100, solSS21.u[11, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, ms=3)
    scatter!(sol21.obj2 * 100, sol21.u[11, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    layout = @layout [a b = grid(5, 2)]

    ps = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]

    # --- Kombinieren ---
    pt1 = plot(p11, ps..., layout=layout, size=(1200, 600))

    p11 = scatter(solSS12.obj2 * 100, solSS12.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label="Steady state: Isothermal", xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6, legendfontsize=7)
    scatter!(sol12.obj2 * 100, sol12.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label="FPO: Isothermal", legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(solSS22.obj2 * 100, solSS22.obj1, alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label="Steady state: Nonisothermal", xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol22.obj2 * 100, sol22.obj1, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label="FPO: Nonisothermal", legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    plot!(Y12 * 100, solSS12.obj1, ls=:dash, c=:black, label="Equilibrium: Isothermal")
    plot!(Y22 * 100, solSS22.obj1, alpha=0.5, ls=:dash, c=:black, label="Equilibrium: Nonisothermal", title="Isothermal and nonisothermal FBR with optimized temperature", bottom_margin=3Plots.mm, legend_position=:bottomleft)

    bm = -6.3Plots.mm
    bm2 = 2 * bm
    p1 = scatter(solSS12.obj2 * 100, solSS12.u[1, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ms=3, ylims=[0.001, 0.07], xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[1, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO,in,0}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[1, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[1, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)


    p2 = scatter(solSS12.obj2 * 100, solSS12.u[2, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ylims=[0.0001, 0.4], ms=3, xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[2, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO_2,in,0}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[2, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[2, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p3 = scatter(solSS12.obj2 * 100, solSS12.u[3, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.45, 0.95], ms=3, xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[3, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{H_2,in,0}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[3, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[3, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    p4 = scatter(solSS12.obj2 * 100, solSS12.u[9, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.075, 0.16], ms=3, xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[9, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{N_2,in,0}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[9, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[9, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)


    p5 = scatter(sol12.obj2 * 100, sol12.u[4, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{\dot{n}}", top_margin=bm, bottom_margin=bm, ylims=[-0.1, 1.1], ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[4, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3, xlims=[25, 75])

    p6 = scatter(sol12.obj2 * 100, sol12.u[5, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{CO}", bottom_margin=bm, top_margin=bm, ylims=[-0.1, 1.1], ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[5, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3, xlims=[25, 75])

    p7 = scatter(sol12.obj2 * 100, sol12.u[6, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{N_2}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1], ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[6, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3, xlims=[25, 75])

    p8 = scatter(sol12.obj2 * 100, sol12.u[7, :] * 60, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\tau \ in \ min}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1] * 60, ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[7, :] * 60, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3, xlims=[25, 75])

    p9 = scatter(sol12.obj2 * 100, sol12.u[8, :] * pi, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\varphi \ in \ rad}", top_margin=2 * bm, ylims=[0.7, 1.3] * pi, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3, xlims=[25, 75])
    scatter!(sol22.obj2 * 100, sol22.u[8, :] * pi, markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, yticks=([0.75, 1, 1.25] * pi,
            [L"\frac{3}{4} \pi", L"\pi", L"\frac{5}{4} \pi"]), ms=3)

    p10 = scatter(solSS12.obj2 * 100, solSS12.u[11, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", top_margin=2 * bm, ylims=[443, 553], ms=3, xlims=[25, 75])
    scatter!(sol12.obj2 * 100, sol12.u[11, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{T_{in,c} \ in \ K}", ms=3)
    scatter!(solSS22.obj2 * 100, solSS22.u[11, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, ms=3)
    scatter!(sol22.obj2 * 100, sol22.u[11, :], markerstrokealpha=0.5, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ms=3)

    layout = @layout [a b = grid(5, 2)]

    ps = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]

    # --- Kombinieren ---
    pt2 = plot(p11, ps..., layout=layout, size=(1200, 600))
    p = plot(pt1, pt2, layout=(2, 1), size=(1200, 900))
    #    plot(p11, p12, p21, p22)

    savefig(plotsdir("methanol_all_Topt.pdf"))
    return p
end


function plot_methanol_fbr_equi()
    solSS11 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_isothermal_60bar_503k.jld2"))["sol"]
    sol11 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_isothermal_60bar_503k.jld2"))["sol"]
    Y11 = calc_equi_yield(solSS11, 6e6)
    Y11n = calc_equi_yield_dyn(sol11, 6e6)

    solSS12 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_isothermal_60bar_Topt.jld2"))["sol"]
    sol12 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_isothermal_60bar_Topt.jld2"))["sol"]
    Y12 = calc_equi_yield(solSS12, 6e6)
    Y12n = calc_equi_yield_dyn(sol12, 6e6)

    solSS21 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_nonisothermal_60bar_503k.jld2"))["sol"]
    sol21 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_nonisothermal_60bar_503k.jld2"))["sol"]
    Y21 = calc_equi_yield(solSS21, 6e6)
    Y21n = calc_equi_yield_dyn(sol21, 6e6)

    solSS22 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_nonisothermal_60bar_Topt.jld2"))["sol"]
    sol22 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_nonisothermal_60bar_Topt.jld2"))["sol"]
    Y22 = calc_equi_yield(solSS22, 6e6)
    Y22n = calc_equi_yield_dyn(sol22, 6e6)

    p11 = scatter(solSS11.obj2 * 100, solSS11.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, legendfontsize=7)
    scatter!(sol11.obj2 * 100, sol11.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}")
    plot!(Y11 * 100, solSS11.obj1, ls=:dash, c=:black, label=false, legend_position=:bottomleft)
    plot!(Y11n * 100, sol11.obj1, ls=:dot, c=:darkred, label=false, legend_position=:bottomleft, right_margin=-4.5Plots.mm, bottom_margin=-4.5Plots.mm)
    annotate!(0.4 * 100, 150, text("Isothermal FBR", 8, :black))
    annotate!(0.4 * 100, 100, text("Constant temperature", 8, :black))

    p12 = scatter(solSS12.obj2 * 100, solSS12.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, legendfontsize=7)
    scatter!(sol12.obj2 * 100, sol12.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright)
    plot!(Y12 * 100, solSS12.obj1, ls=:dash, c=:black, label=false, legend_position=:bottomleft)
    plot!(Y12n * 100, sol12.obj1, ls=:dot, c=:darkred, label=false, legend_position=:bottomleft, left_margin=-4.5Plots.mm, bottom_margin=-4.5Plots.mm)
    annotate!(0.42 * 100, 150, text("Isothermal FBR", 8, :black))
    annotate!(0.42 * 100, 100, text("Optimized temperature", 8, :black))

    p21 = scatter(solSS21.obj2 * 100, solSS21.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", legendfontsize=7)
    scatter!(sol21.obj2 * 100, sol21.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}")
    plot!(Y21 * 100, solSS21.obj1, ls=:dash, c=:black, label=false, legend_position=:bottomleft)
    plot!(Y21n * 100, sol21.obj1, ls=:dot, c=:darkred, label=false, legend_position=:bottomleft, right_margin=-4.5Plots.mm, top_margin=-4.5Plots.mm)
    annotate!(0.4 * 100, 210, text("Nonisothermal FBR", 8, :black))
    annotate!(0.4 * 100, 160, text("Constant temperature", 8, :black))

    p22 = scatter(solSS22.obj2 * 100, solSS22.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", legendfontsize=7)
    scatter!(sol22.obj2 * 100, sol22.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright)
    plot!(Y22 * 100, solSS22.obj1, ls=:dash, c=:black, label=false, legend_position=:bottomleft)
    plot!(Y22n * 100, sol22.obj1, ls=:dot, c=:darkred, label=false, legend_position=:bottomleft, left_margin=-4.5Plots.mm, top_margin=-4.5Plots.mm)
    annotate!(0.42 * 100, 150, text("Nonisothermal FBR", 8, :black))
    annotate!(0.42 * 100, 100, text("Optimized temperature", 8, :black))

    pleg = plot(
        legend=:bottom,              # Legende *im* Plot unten
        legend_position=:center,
        legend_columns=4,
        frame=:none,
        grid=false,
        xticks=false,
        yticks=false,
        xaxis=false,
        yaxis=false,
        xlims=[2, 3]
        # entfernt Achsen-Schrift
    )
    space = "\u2002\u2002"
    # Dummy-Serien für Legende
    scatter!(pleg, [0], [0], m=:x, mc=:transparent, msc=:black, label="Steady state     " * "$space")
    scatter!(pleg, [0], [0], m=:circle, mc=:transparent, msc=:darkred, label="FPO: Squarewaves     " * "$space")
    plot!(pleg, [0], [0], ls=:dash, c=:black, label="Equilibrium: Steady state" * "$space")
    plot!(pleg, [0], [0], ls=:dot, c=:darkred, label="Equilibrium: FPO     " * "$space")


    p = plot(
        p11, p12,
        p21, p22,
        pleg,
        layout=@layout([a b; c d; e{0.15h}]),
        size=(600 * 5 / 4, 550)
    )

    savefig(plotsdir("methanol_FBR_equilibrium.pdf"))
    return p
end

function plot_methanol_fbr_konstT()
    solSS11 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m2_isothermal_60bar_503k.jld2"))["sol"]
    sol11 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m2_isothermal_60bar_503k.jld2"))["sol"]
    Y11 = calc_equi_yield(solSS11, 6e6)


    solSS12 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_isothermal_60bar_503k.jld2"))["sol"]
    sol12 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_isothermal_60bar_503k.jld2"))["sol"]
    Y12 = calc_equi_yield(solSS12, 6e6)


    p11 = scatter(solSS11.obj2 * 100, solSS11.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", title="isothermal CSTR")
    scatter!(sol11.obj2 * 100, sol11.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}")
    plot!(Y11 * 100, solSS11.obj1, ls=:dash, c=:black, label=false, ylim=([0, 950]))
    flow, yield, splf, splssf, sply, splssy = calc_improve(solSS11, sol11)
    Y_ref = splssy(sol11.obj1[end])
    flow_ref = splssf(Y_ref)
    impf = (flow_ref - splf(Y_ref)) ./ flow_ref * 100
    impy = (Y_ref - sply(flow_ref)) ./ Y_ref * 100
    plot!([Y_ref, sply(flow_ref)] * 100, [flow_ref, flow_ref], arrow=(:closed, 5.0), color=:black, label=false, lw=1)
    plot!([Y_ref, Y_ref] * 100, [flow_ref, splf(Y_ref)], arrow=(:closed, 5.0), color=:black, label=false, lw=1)
    scatter!([Y_ref] * 100, [flow_ref], label=false, msc=:transparent, c=:black, ms=4)
    annotate!((Y_ref * 100 + 10, flow_ref + 30, text("≈" * string(round(impy, digits=1)) * "%", 10, :black)))
    annotate!((Y_ref * 100 + 2, flow_ref + 200, text("≈" * string(round(impf, digits=1)) * "%", 10, :black, rotation=90)))

    p12 = scatter(solSS12.obj2 * 100, solSS12.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", title="isothermal FBR")
    scatter!(sol12.obj2 * 100, sol12.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/s/kg_{cat}}")
    plot!(Y12 * 100, solSS12.obj1, ls=:dash, c=:black, label=false, ylim=([0, 950]))
    flow, yield, splf, splssf, sply, splssy = calc_improve(solSS12, sol12)
    Y_ref = splssy(sol12.obj1[end])
    flow_ref = splssf(Y_ref)
    impf = (flow_ref - splf(Y_ref)) ./ flow_ref * 100
    impy = (Y_ref - sply(flow_ref)) ./ Y_ref * 100
    plot!([Y_ref, sply(flow_ref)] * 100, [flow_ref, flow_ref], arrow=(:closed, 5.0), color=:black, label=false, lw=1)
    plot!([Y_ref, Y_ref] * 100, [flow_ref, splf(Y_ref)], arrow=(:closed, 5.0), color=:black, label=false, lw=1)
    scatter!([Y_ref] * 100, [flow_ref], label=false, msc=:transparent, c=:black, ms=4)
    annotate!((Y_ref * 100 + 9, flow_ref + 30, text("≈" * string(round(impy, digits=1)) * "%", 10, :black)))
    annotate!((Y_ref * 100 + 2, flow_ref + 170, text("≈" * string(round(impf, digits=1)) * "%", 10, :black, rotation=90)))

    x = [0, 1]
    y = [0, 1]

    p3 = scatter(
        linecolor=:transparent,
        markercolor=:transparent,
        foreground_color_axis=:transparent,
        background_color=:transparent,
        framestyle=:none,
        legend=:top
    )

    scatter!(x, y, m=:x, mc=:transparent, msc=:black, label="Steady state operation  \u2003 ", xlims=[-1, -0.9], ylims=[-1, -0.9])
    scatter!(x, y, m=:square, mc=:transparent, msc=:darkred, label="Forced periodic operation \u2003", legend=:top, legend_columns=3)
    plot!(x, y, ls=:dash, c=:black, label="Equilibrium ", top_margin=-5Plots.mm)



    p = plot(p11, p12, p3, size=(650, 420), layout=@layout([a b; c{0.2h}]))



    savefig(plotsdir("methanol_isothermal_front.pdf"))
    return p
end


function plot_methanol_fbr_small()
    solSS1 = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m2_isothermal_60bar_503k.jld2"))["sol"]
    sol1 = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m2_isothermal_60bar_503k.jld2"))["sol"]

    solnss = load(datadir("sims", "RPLUG_Nestler_Front_ss_Seidel_m50_isothermal_60bar_503k_0139496cat.jld2"))["sol"]
    soln = load(datadir("sims", "RPLUG_Nestler_Front_squ_Seidel_m50_isothermal_60bar_503k_0139496cat.jld2"))["sol"]

    flow, yield, splf, splssf, sply, splssy = calc_improve(solnss, soln)
    flow_ref = splssf(0.4)
    Y_ref = splssy(flow_ref)

    impf = (flow_ref - splf(Y_ref)) ./ flow_ref * 100
    impy = (Y_ref - sply(flow_ref)) ./ Y_ref * 100
    p1 = scatter(solSS1.obj2 * 100, solSS1.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", xlims=(25, 80), ylims=(0, 1050))
    scatter!(sol1.obj2 * 100, sol1.obj1, m=:square, mc=:transparent, msc=:black, frame=:box, label=false, legend=:topright, ylabel=L"\Phi_1 \mathrm{ \ in \ mmol/min/kg_{cat}}")
    scatter!(solnss.obj2 * 100, solnss.obj1, m=:x, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\Phi_1 \mathrm{ \ in \ mmol/min/kg_{cat}}")
    scatter!(soln.obj2 * 100, soln.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}")
    scatter!([Y_ref] * 100, [flow_ref], label=false, msc=:transparent, c=:black, ms=4)
    x1, x2 = 38.5, 49.1
    y1, y2 = 655, 869

    lens!([x1, x2], [y1, y2];
        inset=(1, bbox(0.52, 0.0, 0.48, 0.58)), # Position/Größe Inset
        subplot=2,
        framestyle=:box,
        ticks=true)
    scatter!([Y_ref] * 100, [flow_ref], subplot=2, label=false, msc=:transparent, c=:black, ms=5)
    plot!([Y_ref, sply(flow_ref)] * 100, [flow_ref, flow_ref], subplot=2, arrow=(:closed, 5.0), color=:darkred, label=false, lw=1.5)
    plot!([Y_ref, Y_ref] * 100, [flow_ref, splf(Y_ref)], subplot=2, arrow=(:closed, 5.0), color=:darkred, label=false, lw=1.8)
    annotate!((Y_ref * 100 + 7.5, flow_ref + 33, text("≈" * string(round(impy, digits=1)) * "%", 10, :darkred, rotation=90)), subplot=2)
    annotate!((Y_ref * 100 + 1.8, flow_ref + 160, text("≈" * string(round(impf, digits=1)) * "%", 10, :darkred, rotation=00)), subplot=2)

    flow, yield, splf, splssf, sply, splssy = calc_improve(solSS1, sol1)
    flow_ref = splssf(0.4)
    Y_ref = splssy(flow_ref)
    impf = (flow_ref - splf(Y_ref)) ./ flow_ref * 100
    impy = (Y_ref - sply(flow_ref)) ./ Y_ref * 100
    plot!([Y_ref, sply(flow_ref)] * 100, [flow_ref, flow_ref], subplot=2, arrow=(:closed, 5.0), color=:black, label=false)
    plot!([Y_ref, Y_ref] * 100, [flow_ref, splf(Y_ref)], subplot=2, arrow=(:closed, 5.0), color=:black, label=false, lw=1)
    annotate!((Y_ref * 100 + 2.8, flow_ref + 13, text("≈" * string(round(impy, digits=1)) * "%", 10, :black)), subplot=2)
    annotate!((Y_ref * 100 + 0.5, flow_ref + 50, text("≈" * string(round(impf, digits=1)) * "%", 10, :black, rotation=90)), subplot=2)

    x = [0, 1]
    y = [0, 1]

    p2 = scatter(
        linecolor=:transparent,
        markercolor=:transparent,
        foreground_color_axis=:transparent,
        background_color=:transparent,
        framestyle=:none,
        legend=:top
    )

    scatter!(x, y, m=:x, mc=:transparent, msc=:black, label="Steady state operation: CSTR  \u2003 ", xlims=[-1, -0.9], ylims=[-1, -0.9])
    scatter!(x, y, m=:x, mc=:transparent, msc=:darkred, label="Steady state operation: FBR  \u2003 ", xlims=[-1, -0.9], ylims=[-1, -0.9])
    scatter!(x, y, m=:square, mc=:transparent, msc=:black, label="Forced periodic operation: CSTR \u2003", legend=:top, legend_columns=2)
    scatter!(x, y, m=:square, mc=:transparent, msc=:darkred, label="Forced periodic operation: FBR \u2003", legend=:top, legend_columns=2, top_margin=-5Plots.mm)
    p = plot(p1, p2, size=(600, 400 * 1.2), layout=@layout([a; c{0.2h}]))


    savefig(plotsdir("methanol_smallfbr_front.pdf"))
    return p
end

