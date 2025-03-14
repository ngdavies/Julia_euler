#!/usr/bin/env julia

using Test

include("euler_001x.jl")
@testset "euler_0002_ex" begin
    @test euler_0002(100) == 44
    @test euler_0002(4000000) == 4613732
end

@testset "euler_0001_ex" begin
    @test euler_0001(10) == 23 
    @test euler_0001(1000) == 233168
end
