using HypergraphDatasets
using Test

@testset "HypergraphDatasets undirected MLDatasets" begin
    # Full Cora dataset
    cora = getHyperCora(Float64)

    @test nhv(cora) == 2708
    @test nhe(cora) == 2708
    @test size(cora.vdata.features) == (1433, 2708)
    @test size(cora.vdata.targets) == (2708,)
    @test cora.hedata == DataStore()
    @test cora.hgdata == DataStore()

    # Split into train, val, and test
    cora = getHyperCora(Float64; split=true)
    @test cora.train.num_vertices == 140
    @test cora.train.num_hyperedges == 535
    @test cora.val.num_vertices == 500
    @test cora.val.num_hyperedges == 1237
    @test cora.test.num_vertices == 1000
    @test cora.test.num_hyperedges == 1882

    # Full CiteSeer dataset
    cs = getHyperCiteSeer(Int)
    @test nhv(cs) == 3327
    @test nhe(cs) == 3327
    @test size(cs.vdata.features) == (3703, 3327)
    @test size(cs.vdata.targets) == (3327,)
    @test cs.hedata == DataStore()
    @test cs.hgdata == DataStore()

    # Split into train, val, and test
    cs = getHyperCiteSeer(Int; split=true)
    @test cs.train.num_vertices == 120
    @test cs.train.num_hyperedges == 337
    @test cs.val.num_vertices == 500
    @test cs.val.num_hyperedges == 1036
    @test cs.test.num_vertices == 1015
    @test cs.test.num_hyperedges == 1752

end