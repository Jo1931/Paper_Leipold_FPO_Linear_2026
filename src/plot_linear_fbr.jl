function plot_linear_fbr(model)

    p3 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][3, :, end] .* model[:ndotin][:]), label=L"n_\mathrm{C,out}", xlabel="t in s", color=:darkred, bottom_margin=-2Plots.mm)
    pp1 = plot(p3, frame=:box, ylabel=L"\dot{n}_\mathrm{C,out} \ \mathrm{in} \ \mathrm{mol/s}", legend=false, xlims=(0, value.(model[:tend])), xticksfontsize=3)
    plot!(value.(model[:tspan] * model[:tend]), one.(value.(model[:tspan] * model[:tend])) * 0.25, ls=:dash, c=:black)
    plot!(value.(model[:tspan] * model[:tend]), one.(value.(model[:tspan] * model[:tend])) * value(model[:obj1]), c=:darkred, ls=:dash)
    annotate!(1.25, 0.21, text("mean value: steady state", :black, 9, :left))
    annotate!(1.25, 0.36, text("mean value: forced periodic operation", :darkred, 9, :left))



    pp2 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][1, :, end] .* model[:ndotin][:]), label=L"A", xlabel="t in s", c=:darkgreen, legendfontsize=7, legend_position=:topright, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:x][2, :, end] .* model[:ndotin][:]), label=L"B \ (inert)", xlabel="t in s ", c=:black, frame=:box, ylabel=L"\dot{n}_\mathrm{out} \ \mathrm{in} \ \mathrm{mol/s}", xlims=(0, value.(model[:tend])))


    pp3 = plot(value.(model[:tend]) .* [1, 1] ./ 4, [0, 2], c=:black, ls=:dash, lw=1, label=false, xlims=(0, value.(model[:tend])), ylims=(0, 2), legendfontsize=7, legend_position=:topright, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(value.(model[:tend]) .* [1, 1] ./ 2, [0, 2], c=:black, ls=:dash, lw=1, label=false)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:ndotin][:] .* model[:xin1]), label=L"A", xlabel="t in s", c=:darkgreen, frame=:box, ylabel=L"\dot{n}_\mathrm{in} \ \mathrm{in} \ \mathrm{mol/s}", lw=1)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:ndotin][:] .* model[:xin2]), label=L"B \ (inert)", xlabel="t in s ", c=:black, lw=1)
    annotate!(0.28, 1, text("Phase 3", :black, 6, :center))
    annotate!(0.28, 0.85, text("Discharge", :black, 6, :center))
    annotate!(0.83, 1, text("Phase 1:", :black, 6, :center))
    annotate!(0.83, 0.85, text("Charge", :black, 6, :center))
    annotate!(1.7, 1, text("Phase 2:", :black, 6, :center))
    annotate!(1.7, 0.85, text("Batch", :black, 6, :center))

    pp4 = plot(value.(model[:tspan] * model[:tend]), value.(model[:x][1, :, end]), label=L"y_{out,A}", xlabel="t in s", c=:darkgreen, frame=:box, legendfontsize=6, legend=false, bottom_margin=-2Plots.mm, top_margin=-2Plots.mm)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:x][2, :, end]), label=L"y_{out,B} \ (inert)", xlabel="t in s", c=:black)
    plot!(value.(model[:tspan] * model[:tend]), value.(model[:x][3, :, end]), label=L"y_{out,C}", xlabel="t in s", c=:darkred, xlims=(0, value.(model[:tend])), ylabel=L"y_{out}")

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
    savefig(p, plotsdir("fbr_linear_1.pdf"))
    return p
end

function plot_linear_fbr_gif(model)
    x = value.(model[:x])
    nt = size(x, 2)
    nz = size(x, 3)

    # GIF erstellen
    gr()
    default(fontfamily="Computer Modern")
    anim = @animate for i in 1:1:nt
        if value.(model[:tspan] * model[:tend])[i] < 0.55
            phase = "(Discharge)"
        elseif value.(model[:tspan] * model[:tend])[i] < 1.1
            phase = "(Charge)"
        else
            phase = "(Batch)"
        end
        pp = plot(value.(model[:zspan] * model[:zend]), x[1, i, :],
            xlabel=L"\mathrm{Reactor \ length \ z \ in \ m}",
            ylabel=L"\mathrm{Outlet \ concentration \ } y_\mathrm{out}",
            title="t = $(round.(value.(model[:tspan]*model[:tend])[i],digits=1)) s " * phase,
            ylim=(0, 1),
            xlims=(0, 1),
            frame=:box,
            legend=false, c=:darkgreen)
        plot!(value.(model[:zspan] * model[:zend]), x[2, i, :],
            legend=false, c=:black)
        plot!(value.(model[:zspan] * model[:zend]), x[3, i, :],
            legend=false, c=:darkred)

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
            xlims=[2, 3],
            legendfontsize=7,
            guidefontsizefontsize=8,
            # entfernt Achsen-Schrift
        )
        space = "\u2002\u2002"
        # Dummy-Serien für Legende
        plot!(pleg, [0], [0], c=:darkgreen, label="Component A (educt)     " * "$space")
        plot!(pleg, [0], [0], c=:black, label="Component B (inert)    " * "$space")
        plot!(pleg, [0], [0], c=:darkred, label="Component C (product)    " * "$space")
        plot(pp, pleg, size=(650, 400), layout=@layout [a; b{0.1h}])
        print(i)
    end

    gif(anim, plotsdir("fbr_linear_1.gif"), fps=15)
end

