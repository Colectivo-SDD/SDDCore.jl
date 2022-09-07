push!(LOAD_PATH, "./../src/")
using SDDCore

using Documenter
makedocs(
    modules = [SDDCore],
    sitename = "SDDCore Reference",
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        warn_outdated = true,
        collapselevel=1,
        )
)
