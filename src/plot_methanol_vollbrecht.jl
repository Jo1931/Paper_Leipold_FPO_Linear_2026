function plot_methanol_vollbrecht_cos()
    kinetic = "AutoCat"
    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_cos_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_cos_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss_lin)



    default(fontfamily="Computer Modern")
    p1 = plot(ylabel="methanol flowrate", legend=:bottomleft, frame=:box, bottom_margin=-5Plots.mm, right_margin=-4Plots.mm)
    scatter!(sol.obj2, sol.obj1, mc=:transparent, m=:circle, msc=:red, label=false, ms=3)
    scatter!(solss.obj2, solss.obj1, mc=:transparent, m=:x, msc=:black, label=false, ms=3)
    scatter!(sol_lin.obj2, sol_lin.obj1, mc=:transparent, m=:x, msc=:red, label=false, ms=3)
    plot!(Y, sol.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.36, 100, text("AutoCat", 12, :black))

    kinetic = "Brilman"

    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_cos_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_cos_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss_lin)



    default(fontfamily="Computer Modern")
    p2 = plot(legend=:bottomleft, frame=:box, bottom_margin=-5Plots.mm, left_margin=-4Plots.mm)
    scatter!(sol.obj2, sol.obj1, mc=:transparent, m=:circle, msc=:red, label=false, ms=3)
    scatter!(solss.obj2, solss.obj1, mc=:transparent, m=:x, msc=:black, label=false, ms=3)
    scatter!(sol_lin.obj2, sol_lin.obj1, mc=:transparent, m=:x, msc=:red, label=false, ms=3)
    plot!(Y, sol.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.48, 25, text("Brilman", 12, :black))


    kinetic = "Nestler"

    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_cos_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_cos_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss_lin)



    default(fontfamily="Computer Modern")
    p3 = plot(ylabel="methanol flowrate", xlabel="methanol yield", legend=:bottomleft, right_margin=-4Plots.mm, frame=:box, top_margin=-5Plots.mm)
    scatter!(sol.obj2, sol.obj1, mc=:transparent, m=:circle, msc=:red, label=false, ms=3)
    scatter!(solss.obj2, solss.obj1, mc=:transparent, m=:x, msc=:black, label=false, ms=3)
    scatter!(sol_lin.obj2, sol_lin.obj1, mc=:transparent, m=:x, msc=:red, label=false, ms=3)
    plot!(Y, sol.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.32, 20, text("Nestler", 12, :black))


    kinetic = "Bussche"

    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_cos_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_cos_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss_lin)


    default(fontfamily="Computer Modern")
    p4 = plot(xlabel="methanol yield", legend=:bottomleft, frame=:box, top_margin=-5Plots.mm, left_margin=-4Plots.mm)
    scatter!(sol.obj2, sol.obj1, mc=:transparent, m=:circle, msc=:red, label=false, ms=3)
    scatter!(solss.obj2, solss.obj1, mc=:transparent, m=:x, msc=:black, label=false, ms=3)
    scatter!(sol_lin.obj2, sol_lin.obj1, mc=:transparent, m=:x, msc=:red, label=false, ms=3)
    plot!(Y, sol.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.48, 30, text("Bussche", 12, :black))

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
    scatter!(pleg, [0], [0], m=:x, mc=:transparent, msc=:black, label="steady state     " * "$space")
    scatter!(pleg, [0], [0], m=:circle, mc=:transparent, msc=:red, label="FPO: Cosine     " * "$space")
    scatter!(pleg, [0], [0], m=:x, mc=:transparent, msc=:red, label="FPO: Linearized reaction rate     " * "$space")
    plot!(pleg, [0], [0], ls=:dash, c=:black, label="Equilibrium")

    p = plot(
        p1, p2,
        p3, p4,
        pleg,
        layout=@layout([a b; c d; e{0.15h}]),
        size=(600 * 5 / 4, 500)
    )


    savefig(plotsdir("cstr_compare_linear.pdf"))
    return p

end

function plot_methanol_vollbrecht_squ()
    kinetic = "AutoCat"
    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss)


    default(fontfamily="Computer Modern")
    p1 = plot(ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", legend=:bottomleft, frame=:box, bottom_margin=-5Plots.mm, right_margin=-4Plots.mm)
    scatter!(sol.obj2 * 100, sol.obj1, mc=:transparent, m=:circle, msc=:darkred, label=false, ms=3)
    scatter!(solss.obj2 * 100, solss.obj1, mc=:transparent, m=:x, msc=:black, label=false, ms=3)
    scatter!(sol_lin.obj2 * 100, sol_lin.obj1, mc=:transparent, m=:x, msc=:darkred, label=false, ms=3)
    plot!(Y * 100, solss.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.35 * 100, 95, text("Kortuz", 12, :black))

    kinetic = "Brilman"

    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss)


    default(fontfamily="Computer Modern")
    p2 = plot(legend=:bottomleft, frame=:box, bottom_margin=-5Plots.mm, left_margin=-4Plots.mm)
    scatter!(sol.obj2 * 100, sol.obj1, mc=:transparent, m=:circle, msc=:darkred, label=false, ms=3)
    scatter!(solss.obj2 * 100, solss.obj1, mc=:transparent, m=:x, msc=:black, label=false, ms=3)
    scatter!(sol_lin.obj2 * 100, sol_lin.obj1, mc=:transparent, m=:x, msc=:darkred, label=false, ms=3)
    plot!(Y * 100, solss.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.496 * 100, 31, text("van Schagen", 12, :black))


    kinetic = "Nestler"

    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss)



    default(fontfamily="Computer Modern")
    p3 = plot(ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", xlabel=L"\overline{Y} \mathrm{ \ in \%}", legend=:bottomleft, right_margin=-4Plots.mm, frame=:box, top_margin=-5Plots.mm)
    scatter!(sol.obj2 * 100, sol.obj1, mc=:transparent, m=:circle, msc=:darkred, label=false, ms=3)
    scatter!(solss.obj2 * 100, solss.obj1, mc=:transparent, m=:x, msc=:black, label=false, ms=3)
    scatter!(sol_lin.obj2 * 100, sol_lin.obj1, mc=:transparent, m=:x, msc=:darkred, label=false, ms=3)
    plot!(Y * 100, solss.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.32 * 100, 24, text("Nestler", 12, :black))


    kinetic = "Bussche"

    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss)

    default(fontfamily="Computer Modern")
    p4 = plot(xlabel=L"\overline{Y} \mathrm{ \ in \%}", legend=:bottomleft, frame=:box, top_margin=-5Plots.mm, left_margin=-4Plots.mm)
    scatter!(sol.obj2 * 100, sol.obj1, mc=:transparent, m=:circle, msc=:darkred, label=false, ms=3)
    scatter!(solss.obj2 * 100, solss.obj1, mc=:transparent, m=:x, msc=:black, label=false, ms=3)
    scatter!(sol_lin.obj2 * 100, sol_lin.obj1, mc=:transparent, m=:x, msc=:darkred, label=false, ms=3)
    plot!(Y[1:end-1] * 100, solss.obj1[1:end-1], ls=:dash, c=:black, label=false)
    annotate!(0.47 * 100, 30, text("Bussche", 12, :black))

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
    scatter!(pleg, [0], [0], m=:x, mc=:transparent, msc=:darkred, label="FPO: Linearized reaction rate     " * "$space")
    plot!(pleg, [0], [0], ls=:dash, c=:black, label="Equilibrium")

    p = plot(
        p1, p2,
        p3, p4,
        pleg,
        layout=@layout([a b; c d; e{0.15h}]),
        size=(600 * 5 / 4, 550)
    )
    savefig(plotsdir("cstr_compare_linear_square.pdf"))
    return p
end
function plot_methanol_vollbrecht_squ_all()
    kinetic = "AutoCat"
    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss)
    xlim = (28, 62)

    p11 = scatter(solss.obj2 * 100, solss.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol.obj2 * 100, sol.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(sol_lin.obj2 * 100, sol_lin.obj1, m=:x, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(solss_lin.obj2 * 100, solss_lin.obj1, alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    plot!(Y * 100, solss.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.35 * 100, 85, text("Kortuz", 12, :black))

    bm = -6.3Plots.mm
    bm2 = 2 * bm
    p1 = scatter(solss.obj2 * 100, solss.u[1, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ms=3, ylims=[0.001, 0.07], xlims=xlim)
    scatter!(sol.obj2 * 100, sol.u[1, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[1, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)


    p2 = scatter(solss.obj2 * 100, solss.u[2, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ylims=[0.001, 0.4], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[2, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[2, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)

    p3 = scatter(solss.obj2 * 100, solss.u[3, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.45, 0.95], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[3, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{H_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[3, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)

    p4 = scatter(solss.obj2 * 100, solss.u[9, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.075, 0.22], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[9, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{N_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[9, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)


    p5 = scatter(sol.obj2 * 100, sol.u[4, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{\dot{n}}", top_margin=bm, bottom_margin=bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p6 = scatter(sol.obj2 * 100, sol.u[5, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{CO}", bottom_margin=bm, top_margin=bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p7 = scatter(sol.obj2 * 100, sol.u[6, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{N_2}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p8 = scatter(sol.obj2 * 100, sol.u[7, :] * 60, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\tau \ in \ min}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.01, 0.1] * 60, xlims=xlim, ms=3)

    p9 = scatter(sol.obj2 * 100, sol.u[8, :] * pi, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\varphi \ in \ rad}", top_margin=2 * bm, ylims=[0.1, 1.3] * pi, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", xlims=xlim, ms=3, yticks=([0.25, 0.5, 0.75, 1, 1.25] * pi,
        [L"\frac{1}{4} \pi", L"\frac{1}{2} \pi", L"\frac{3}{4} \pi", L"\pi", L"\frac{5}{4} \pi"]))

    p10 = scatter(solss.obj2 * 100, solss.u[11, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", top_margin=2 * bm, ylims=[443, 553], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[11, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{T_{in,c} \ in \ K}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[11, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, ms=3)

    layout = @layout [a b = grid(5, 2)]

    ps = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]

    # --- Kombinieren ---
    pt1 = plot(p11, ps..., layout=layout, size=(1200, 600))

    kinetic = "Brilman"
    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss)
    xlim = (38, 88)

    p11 = scatter(solss.obj2 * 100, solss.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol.obj2 * 100, sol.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(sol_lin.obj2 * 100, sol_lin.obj1, m=:x, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(solss_lin.obj2 * 100, solss_lin.obj1, alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    plot!(Y * 100, solss.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.496 * 100, 31, text("van Schagen", 12, :black))

    bm = -6.3Plots.mm
    bm2 = 2 * bm
    p1 = scatter(solss.obj2 * 100, solss.u[1, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ms=3, ylims=[0.0001, 0.03], xlims=xlim)
    scatter!(sol.obj2 * 100, sol.u[1, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[1, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)


    p2 = scatter(solss.obj2 * 100, solss.u[2, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ylims=[0.0001, 0.2], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[2, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[2, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)

    p3 = scatter(solss.obj2 * 100, solss.u[3, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.45, 0.95], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[3, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{H_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[3, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)

    p4 = scatter(solss.obj2 * 100, solss.u[9, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.055, 0.22], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[9, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{N_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[9, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)


    p5 = scatter(sol.obj2 * 100, sol.u[4, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{\dot{n}}", top_margin=bm, bottom_margin=bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p6 = scatter(sol.obj2 * 100, sol.u[5, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{CO}", bottom_margin=bm, top_margin=bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p7 = scatter(sol.obj2 * 100, sol.u[6, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{N_2}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p8 = scatter(sol.obj2 * 100, sol.u[7, :] * 60, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\tau \ in \ min}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.01, 0.1] * 60, xlims=xlim, ms=3)

    p9 = scatter(sol.obj2 * 100, sol.u[8, :] * pi, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\varphi \ in \ rad}", top_margin=2 * bm, ylims=[0.1, 1.3] * pi, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", xlims=xlim, ms=3, yticks=([0.25, 0.5, 0.75, 1, 1.25] * pi,
        [L"\frac{1}{4} \pi", L"\frac{1}{2} \pi", L"\frac{3}{4} \pi", L"\pi", L"\frac{5}{4} \pi"]))

    p10 = scatter(solss.obj2 * 100, solss.u[11, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", top_margin=2 * bm, ylims=[443, 553], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[11, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{T_{in,c} \ in \ K}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[11, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, ms=3)

    layout = @layout [a b = grid(5, 2)]

    ps = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]

    # --- Kombinieren ---
    pt2 = plot(p11, ps..., layout=layout, size=(1200, 600))

    kinetic = "Nestler"
    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss)
    xlim = (22, 82)

    p11 = scatter(solss.obj2 * 100, solss.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol.obj2 * 100, sol.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(sol_lin.obj2 * 100, sol_lin.obj1, m=:x, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(solss_lin.obj2 * 100, solss_lin.obj1, alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    plot!(Y * 100, solss.obj1, ls=:dash, c=:black, label=false)
    annotate!(0.32 * 100, 24, text("Nestler", 12, :black))

    bm = -6.3Plots.mm
    bm2 = 2 * bm
    p1 = scatter(solss.obj2 * 100, solss.u[1, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ms=3, ylims=[0.0001, 0.07], xlims=xlim)
    scatter!(sol.obj2 * 100, sol.u[1, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[1, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)


    p2 = scatter(solss.obj2 * 100, solss.u[2, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ylims=[0.0001, 0.2], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[2, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[2, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)

    p3 = scatter(solss.obj2 * 100, solss.u[3, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.45, 0.95], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[3, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{H_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[3, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)

    p4 = scatter(solss.obj2 * 100, solss.u[9, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.055, 0.22], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[9, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{N_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[9, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)


    p5 = scatter(sol.obj2 * 100, sol.u[4, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{\dot{n}}", top_margin=bm, bottom_margin=bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p6 = scatter(sol.obj2 * 100, sol.u[5, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{CO}", bottom_margin=bm, top_margin=bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p7 = scatter(sol.obj2 * 100, sol.u[6, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{N_2}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p8 = scatter(sol.obj2 * 100, sol.u[7, :] * 60, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\tau \ in \ min}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.01, 0.1] * 60, xlims=xlim, ms=3)

    p9 = scatter(sol.obj2 * 100, sol.u[8, :] * pi, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\varphi \ in \ rad}", top_margin=2 * bm, ylims=[0.1, 1.3] * pi, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", xlims=xlim, ms=3, yticks=([0.25, 0.5, 0.75, 1, 1.25] * pi,
        [L"\frac{1}{4} \pi", L"\frac{1}{2} \pi", L"\frac{3}{4} \pi", L"\pi", L"\frac{5}{4} \pi"]))

    p10 = scatter(solss.obj2 * 100, solss.u[11, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", top_margin=2 * bm, ylims=[443, 553], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[11, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{T_{in,c} \ in \ K}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[11, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, ms=3)

    layout = @layout [a b = grid(5, 2)]

    ps = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]

    # --- Kombinieren ---
    pt3 = plot(p11, ps..., layout=layout, size=(1200, 600))

    kinetic = "Bussche"
    solss = load(datadir("sims", "CSTR_Vollbrecht_Front_ss_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]
    sol = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50.jld2"))["sol"]

    solss_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_ss_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]
    sol_lin = load(datadir("sims", "CSTR_Vollbrecht_Front_squ_" * kinetic * "_isothermal_T503_P50_lin.jld2"))["sol"]

    Y = calc_equi_yield(solss)
    xlim = (38, 75)

    p11 = scatter(solss.obj2 * 100, solss.obj1, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    scatter!(sol.obj2 * 100, sol.obj1, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(sol_lin.obj2 * 100, sol_lin.obj1, m=:x, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\frac{\overline{\dot{n}_\mathrm{CH_3OH,out}}}{m_\mathrm{cat}} \mathrm{ \ in \ mmol/min/kg_{cat}}", ms=6)
    scatter!(solss_lin.obj2 * 100, solss_lin.obj1, alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=6)
    plot!(Y[1:end-1] * 100, solss.obj1[1:end-1], ls=:dash, c=:black, label=false)
    annotate!(0.47 * 100, 30, text("Bussche", 12, :black))

    bm = -6.3Plots.mm
    bm2 = 2 * bm
    p1 = scatter(solss.obj2 * 100, solss.u[1, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ms=3, ylims=[0.0001, 0.05], xlims=xlim)
    scatter!(sol.obj2 * 100, sol.u[1, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[1, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)


    p2 = scatter(solss.obj2 * 100, solss.u[2, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=2 * bm, ylims=[0.0001, 0.4], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[2, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{CO_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[2, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)

    p3 = scatter(solss.obj2 * 100, solss.u[3, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.45, 0.95], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[3, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{H_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[3, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)

    p4 = scatter(solss.obj2 * 100, solss.u[9, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, bottom_margin=1.5bm, top_margin=0.5bm, ylims=[0.055, 0.25], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[9, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"y_\mathrm{N_2,in,0}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[9, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", ms=3)


    p5 = scatter(sol.obj2 * 100, sol.u[4, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{\dot{n}}", top_margin=bm, bottom_margin=bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p6 = scatter(sol.obj2 * 100, sol.u[5, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{CO}", bottom_margin=bm, top_margin=bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p7 = scatter(sol.obj2 * 100, sol.u[6, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"A_\mathrm{N_2}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.1, 1.1], xlims=xlim, ms=3)

    p8 = scatter(sol.obj2 * 100, sol.u[7, :] * 60, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\tau \ in \ min}", bottom_margin=0.5bm, top_margin=1.5bm, ylims=[-0.01, 0.1] * 60, xlims=xlim, ms=3)

    p9 = scatter(sol.obj2 * 100, sol.u[8, :] * pi, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{\varphi \ in \ rad}", top_margin=2 * bm, ylims=[0.1, 1.3] * pi, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", xlims=xlim, ms=3, yticks=([0.25, 0.5, 0.75, 1, 1.25] * pi,
        [L"\frac{1}{4} \pi", L"\frac{1}{2} \pi", L"\frac{3}{4} \pi", L"\pi", L"\frac{5}{4} \pi"]))

    p10 = scatter(solss.obj2 * 100, solss.u[11, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \mathrm{\ in \ \%} ", top_margin=2 * bm, ylims=[443, 553], xlims=xlim, ms=3)
    scatter!(sol.obj2 * 100, sol.u[11, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\mathrm{T_{in,c} \ in \ K}", ms=3)
    scatter!(solss_lin.obj2 * 100, solss_lin.u[11, :], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label=false, ms=3)

    layout = @layout [a b = grid(5, 2)]

    ps = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]

    # --- Kombinieren ---
    pt4 = plot(p11, ps..., layout=layout, size=(1200, 600))

    #plot(pt1, pt2, pt3, pt4, layout=(2, 2), size=(2000, 1000))
    pleg = plot(
        legend=:bottom,              # Legende *im* Plot unten
        legend_position=:center,
        legend_columns=5,
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
    scatter!(pleg, [0], [0], m=:x, mc=:transparent, msc=:darkred, label="FPO: Linearized reaction rate     " * "$space")
    scatter!([0], [0], alpha=0.5, m=:x, mc=:transparent, msc=:black, frame=:box, label="Steady state: Linearized reaction rate" * "$space", ms=6)

    plot!(pleg, [0], [0], ls=:dash, c=:black, label="Equilibrium")

    p = plot(
        pt1, pt2,
        pt3, pt4,
        pleg,
        layout=@layout([a b; c d; e{0.1h}]),
        size=(2000, 1200), legendfontsize=14
    )

    savefig(plotsdir("cstr_compare_linear_square_all.pdf"))
    return p
end