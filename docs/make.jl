using HypergraphDatasets
using Documenter

DocMeta.setdocmeta!(HypergraphDatasets, :DocTestSetup, :(using HypergraphDatasets); recursive=true)

makedocs(;
    modules=[HypergraphDatasets],
    authors="Evan Walter Clark Spotte-Smith, the Community of Researchers Assessing Chemical Transformations and Exploring Reactivity (CoReACTER), and contributors",
    sitename="HypergraphDatasets.jl",
    format=Documenter.HTML(;
        canonical="https://CoReACTER.org/HypergraphDatasets.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/CoReACTER/HypergraphDatasets.jl",
    devbranch="main",
)
