#!/usr/bin/env julia

using Test

include("../euler_002x.jl")

@testset "Euler_0020" begin
    @test euler_0020(10) == 27
    @test euler_0020(100) == 648   
end
