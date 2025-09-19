function _convert_citation_graphdata(
    dset::MLDatasets.AbstractDataset,
    T::Type{R};
    split::Bool = false
) where {R <: Real}
    nv = dset[1].num_nodes

    # Hypergraph vertices are graph vertices
    hg = Hypergraph{T}(nv, nv)

    # Include vertices in hyperedges
    # Datasets are symmetric, so if (s, d) is an edge, (d, s) is also an edge
    for (s, d) in zip(dset[1].edge_index...)
        hg[s, d] = convert(T, 1)
    end

    # Construct HGNN Hypergraph
    # Citation datasets have vertex features but no hyperedge- or hypergraph-level features
    hgnnhypergraph = HGNNHypergraph{T}(
        hg;
        vdata=(features=dset[1].node_data.features, targets=dset[1].node_data.targets)
    )

    if !split
        return hgnnhypergraph
    else
        # Cora comes with default train-val-test splits
        return split_vertices(
            hgnnhypergraph,
            dset[1].node_data.train_mask,
            dset[1].node_data.test_mask;
            val_mask=dset[1].node_data.val_mask
        )
    end

end

"""
    getHyperCora(
        T::Type{R};
        split::Bool = false
    ) where {R <: Real}

    Represent the Cora dataset (Sen et al., 2008. DOI: 10.1609/aimag.v29i3.2157) as an undirected hypergraph. If
    `split` is `true` (default `false`), use standard partitions to split the data into train, validation, and test
    sets.
"""
function getHyperCora(
    T::Type{R};
    split::Bool = false
) where {R <: Real}
    _convert_citation_graphdata(MLDatasets.Cora(), T; split=split)
end

"""
    getHyperCiteSeer(
        T::Type{R};
        split::Bool = false
    ) where {R <: Real}

    Represent the CiteSeer dataset (Sen et al., 2008. DOI: 10.1609/aimag.v29i3.2157) as an undirected hypergraph. If
    `split` is `true` (default `false`), use standard partitions to split the data into train, validation, and test
    sets.
"""
function getHyperCiteSeer(
    T::Type{R};
    split::Bool = false
) where {R <: Real}
    _convert_citation_graphdata(MLDatasets.CiteSeer(), T; split=split)
end