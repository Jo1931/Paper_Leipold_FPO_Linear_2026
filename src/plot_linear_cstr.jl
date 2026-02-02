function plot_linear_cstr(model)
    pgfplotsx()

    p3 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][3, :] .* model[:ndotin][:]), label=L"n_{out,C}", xlabel="t in s", color=:darkred, bottom_margin=-2Plots.mm)
    pp1 = plot(p3, frame=:box, ylabel=L"\dot{n}_\mathrm{C,out} \ \mathrm{in} \ \mathrm{mol/s}", legend=false, xlims=(0, value.(model[:tend])), xticksfontsize=3)
    plot!(value.(model[:tspan] * model[:tend]), one.(value.(model[:tspan] * model[:tend])) * 0.25, ls=:dash, c=:black)
    plot!(value.(model[:tspan] * model[:tend]), one.(value.(model[:tspan] * model[:tend])) * value(model[:obj1]), c=:darkred, ls=:dash)
    annotate!(0.95, 0.21, text("mean value: steady state", :black, 9, :left))
    annotate!(0.95, 0.32, text("mean value: forced periodic operation", :darkred, 9, :left))



    pp2 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][1, :] .* model[:ndotin][:]), label=L"A", xlabel="t in s", c=:darkgreen, legendfontsize=7, legend_position=:topright, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:x][2, :] .* model[:ndotin][:]), label=L"B \ (inert)", xlabel="t in s ", c=:black, frame=:box, ylabel=L"\dot{n}_\mathrm{out} \ \mathrm{in} \ \mathrm{mol/s}", xlims=(0, value.(model[:tend])))


    pp3 = plot(value.(model[:tend]) .* [1, 1] ./ 4, [0, 2], c=:black, ls=:dash, lw=1, label=false, xlims=(0, value.(model[:tend])), ylims=(0, 2), legendfontsize=7, legend_position=:topright, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(value.(model[:tend]) .* [1, 1] ./ 2, [0, 2], c=:black, ls=:dash, lw=1, label=false)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:ndotin][:] .* model[:xin1]), label=L"A", xlabel="t in s", c=:darkgreen, frame=:box, ylabel=L"\dot{n}_\mathrm{in} \ \mathrm{in} \ \mathrm{mol/s}", lw=1)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:ndotin][:] .* model[:xin2]), label=L"B \ (inert)", xlabel="t in s ", c=:black, lw=1)
    annotate!(0.24, 1, text("Phase 3", :black, 6, :center))
    annotate!(0.24, 0.85, text("Discharge", :black, 6, :center))
    annotate!(0.70, 1, text("Phase 1:", :black, 6, :center))
    annotate!(0.70, 0.85, text("Charge", :black, 6, :center))
    annotate!(1.38, 1, text("Phase 2:", :black, 6, :center))
    annotate!(1.38, 0.85, text("Batch", :black, 6, :center))

    pp4 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][1, :]), label=L"y_{out,A}", xlabel="t in s", c=:darkgreen, frame=:box, legendfontsize=6, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:x][2, :]), label=L"y_{out,B} \ (inert)", xlabel="t in s", c=:black)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:x][3, :]), label=L"y_{out,C}", xlabel="t in s", c=:darkred, xlims=(0, value.(model[:tend])), ylabel=L"y_{out}")

    pp5 = plot(value.(model[:tspan] * model[:tend]), value.(model[:xin1]), ylabel=L" y_{in,A} ", xlabel="t in s", xlims=(0, value.(model[:tend])), label=false, frame=:box, c=:darkgreen, yforeground_color_axis=:darkgreen, ytickfontcolor=:darkgreen, yguidefontcolor=:darkgreen, legendfontsize=6, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(twinx(), value.(model[:tspan] * model[:tend]), value.(model[:ndotin]), xlims=(0, value.(model[:tend])), frame=:box, ylabel=L"\dot{n}_\mathrm{in,tot} \ \mathrm{in} \ \mathrm{mol/s}", label=false, c=:darkred, yforeground_color_axis=:darkred, ytickfontcolor=:darkred, yguidefontcolor=:darkred)

    pleg = plot(
        legend=:bottom,              # Legende *im* Plot unten
        legend_position=:center,
        legend_columns=3,
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
    plot!(pleg, [0], [0], c=:darkgreen, label="Component A (educt)     " * "$space")
    plot!(pleg, [0], [0], c=:black, label="Component B (inert)    " * "$space")
    plot!(pleg, [0], [0], c=:darkred, label="Component C (product)    " * "$space")


    p = plot(pp1, pp2, pp3, pp4, pp5, pleg, size=(600, 650), layout=@layout [a{0.4h}; grid(2, 2); b{0.13h}])
    savefig(plotsdir("ctr_linear_1.pdf"))
    return p
end


function plot_linear_cstr_ga_out(model)
    p3 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][3, :] .* model[:ndotin][:]), label=L"n_{out,C}", xlabel="t in s", color=:darkred, bottom_margin=-2Plots.mm, lw=2)

    pp1 = plot(p3, frame=:box, ylabel=L"\dot{n}_\mathrm{C,out} \ \mathrm{in} \ \mathrm{mol/s}", legend=false, xlims=(0, value.(model[:tend])), xticksfontsize=3, lw=2)
    plot!(value.(model[:tspan] * model[:tend]), one.(value.(model[:tspan] * model[:tend])) * 0.25, ls=:dash, c=:black, lw=1)
    plot!(value.(model[:tspan] * model[:tend]), one.(value.(model[:tspan] * model[:tend])) * value(model[:obj1]), c=:darkred, ls=:dash, lw=1)
    annotate!(0.95, 0.19, text("steady state", :black, 9, :left))
    annotate!(0.95, 0.34, text("forced periodic operation", :darkred, 9, :left), size=(570, 235), thickness_scaling=1.5)
    savefig(plotsdir("GA_lin_out.svg"))
    return pp1
end

function plot_linear_cstr_ga_in(model)
    pp3 = plot(value.(model[:tend]) .* [1, 1] ./ 4, [0, 2], c=:black, ls=:dash, lw=1, label=false, xlims=(0, value.(model[:tend])), ylims=(0, 2), legendfontsize=7, legend_position=:topright, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(value.(model[:tend]) .* [1, 1] ./ 2, [0, 2], c=:black, ls=:dash, lw=1, label=false)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:ndotin][:] .* model[:xin1]), label=L"A", xlabel="t in s", c=:darkgreen, frame=:box, ylabel=L"\dot{n}_\mathrm{in} \ \mathrm{in} \ \mathrm{mol/s}", lw=2)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:ndotin][:] .* model[:xin2]), label=L"B \ (inert)", xlabel="t in s ", c=:black, lw=2, framestyle=:box)
    annotate!(0.24, 1.1, text("Phase 3", :black, 9, :center))
    annotate!(0.24, 0.85, text("Discharge", :black, 9, :center))
    annotate!(0.70, 1.1, text("Phase 1:", :black, 9, :center))
    annotate!(0.70, 0.85, text("Charge", :black, 9, :center))
    annotate!(1.38, 1.1, text("Phase 2:", :black, 9, :center))
    annotate!(1.38, 0.85, text("Batch", :black, 9, :center), size=(570, 225), thickness_scaling=1.5)
    savefig(plotsdir("GA_lin_in.svg"))
    return pp3
end

function plot_linear_cstr_suboptimal(model)



    p3 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][3, :] .* model[:ndotin][:]), label=L"n_{out,C}", xlabel="t in s", color=:darkred, bottom_margin=-2Plots.mm)
    pp1 = plot(p3, frame=:box, ylabel=L"\dot{n}_\mathrm{C,out} \ \mathrm{in} \ \mathrm{mol/s}", legend=false, xlims=(0, value.(model[:tend])), xticksfontsize=3)
    plot!(value.(model[:tspan] * model[:tend]), one.(value.(model[:tspan] * model[:tend])) * 0.25, ls=:dash, c=:black)
    plot!(value.(model[:tspan] * model[:tend]), one.(value.(model[:tspan] * model[:tend])) * value(model[:obj1]), c=:darkred, ls=:dash)
    annotate!(6.15, 0.23, text("mean value: steady state", :black, 9, :left))
    annotate!(6.15, 0.29, text("mean value: forced periodic operation", :darkred, 9, :left))



    pp2 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][1, :] .* model[:ndotin][:]), label=L"A", xlabel="t in s", c=:darkgreen, legendfontsize=7, legend_position=:topright, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:x][2, :] .* model[:ndotin][:]), label=L"B \ (inert)", xlabel="t in s ", c=:black, frame=:box, ylabel=L"\dot{n}_\mathrm{out} \ \mathrm{in} \ \mathrm{mol/s}", xlims=(0, value.(model[:tend])))


    pp3 = plot(c=:black, ls=:dash, lw=1, label=false, xlims=(0, value.(model[:tend])), ylims=(0, 2), legendfontsize=7, legend_position=:topright, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    #plot!(value.(model[:tend]) .* [1, 1] ./ 2, [0, 2], c=:black, ls=:dash, lw=1, label=false)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:ndotin][:] .* model[:xin1]), label=L"A", xlabel="t in s", c=:darkgreen, frame=:box, ylabel=L"\dot{n}_\mathrm{in} \ \mathrm{in} \ \mathrm{mol/s}", lw=1)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:ndotin][:] .* model[:xin2]), label=L"B \ (inert)", xlabel="t in s ", c=:black, lw=1)
    #annotate!(0.24, 1, text("Phase 3", :black, 6, :center))
    #annotate!(0.24, 0.85, text("Discharge", :black, 6, :center))
    #annotate!(0.70, 1, text("Phase 1:", :black, 6, :center))
    #annotate!(0.70, 0.85, text("Charge", :black, 6, :center))
    #annotate!(1.38, 1, text("Phase 2:", :black, 6, :center))
    #annotate!(1.38, 0.85, text("Batch", :black, 6, :center))

    pp4 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][1, :]), label=L"y_{out,A}", xlabel="t in s", c=:darkgreen, frame=:box, legendfontsize=6, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:x][2, :]), label=L"y_{out,B} \ (inert)", xlabel="t in s", c=:black)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:x][3, :]), label=L"y_{out,C}", xlabel="t in s", c=:darkred, xlims=(0, value.(model[:tend])), ylabel=L"y_{out}")

    pp5 = plot(value.(model[:tspan] * model[:tend]), value.(model[:xin1]), ylabel=L" y_{in,A} ", xlabel="t in s", xlims=(0, value.(model[:tend])), label=false, frame=:box, c=:darkgreen, yforeground_color_axis=:darkgreen, ytickfontcolor=:darkgreen, yguidefontcolor=:darkgreen, legendfontsize=6, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(twinx(), value.(model[:tspan] * model[:tend]), value.(model[:ndotin]), xlims=(0, value.(model[:tend])), frame=:box, ylabel=L"\dot{n}_\mathrm{in,tot} \ \mathrm{in} \ \mathrm{mol/s}", label=false, c=:darkred, yforeground_color_axis=:darkred, ytickfontcolor=:darkred, yguidefontcolor=:darkred)

    pleg = plot(
        legend=:bottom,              # Legende *im* Plot unten
        legend_position=:center,
        legend_columns=3,
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
    plot!(pleg, [0], [0], c=:darkgreen, label="Component A (educt)     " * "$space")
    plot!(pleg, [0], [0], c=:black, label="Component B (inert)    " * "$space")
    plot!(pleg, [0], [0], c=:darkred, label="Component C (product)    " * "$space")



    p = plot(pp1, pp2, pp3, pp4, pp5, pleg, size=(600, 650), layout=@layout [a{0.4h}; grid(2, 2); b{0.13h}])
    savefig(plotsdir("ctr_linear_2.pdf"))
    return p
end



function plot_linear_cstr_front(full, fullss)
    p1 = scatter(fullss[:obj2] * 100, fullss[:obj1], m=:x, mc=:transparent, msc=:black, frame=:box, label="Steady state operation", xlabel=L"\overline{Y} \ \mathrm{in \ \%}")
    scatter!(full[:obj2] * 100, full[:obj1], m=:square, mc=:transparent, msc=:darkred, frame=:box, label="Forced periodic operation", legend=:topright, ylabel=L"\overline{\dot{n}_\mathrm{C,out}} \mathrm{ \ in \ mol/s}")
    p2 = scatter(fullss[:obj2] * 100, fullss[:u][8, :], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel=L"\overline{Y} \ \mathrm{in \ \%}")
    scatter!(full[:obj2] * 100, full[:u][8, :], m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\dot{n}_\mathrm{in} \mathrm{ \ in \ mol/s}")
    #p3 = scatter(fullss[:obj2], fullss[:u][6,:], m=:x, mc=:transparent, msc=:black, frame=:box, label=false, xlabel = L"\Phi_2")
    p3 = scatter(full[:obj2] * 100, full[:u][6, :] * 3600, m=:square, mc=:transparent, msc=:darkred, frame=:box, label=false, legend=:topright, ylabel=L"\tau \mathrm{ \ in \ s}", xlabel=L"\overline{Y} \ \mathrm{in \ \%}")
    p = plot(p1, p2, p3, size=(600, 600), layout=@layout [a; b c])


    savefig(plotsdir("ctr_front_1.pdf"))
    return p
end