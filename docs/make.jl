using HypergraphDatasets
using Documenter

DocMeta.setdocmeta!(HypergraphDatasets, :DocTestSetup, :(using HypergraphDatasets); recursive=true)

makedocs(;
    modules=[HypergraphDatasets],
    authors="Evan Walter Clark Spotte-Smith, PhD <espottesmith@gmail.com> and contributors",
    sitename="HypergraphDatasets.jl",
    format=Documenter.HTML(;
        canonical="https://espottesmith.github.io/HypergraphDatasets.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/espottesmith/HypergraphDatasets.jl",
    devbranch="main",
)
