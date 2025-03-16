#!/usr/bin/env julia

using Test

include("../euler_001x.jl")

@testset "Euler_0012" begin
    @test euler_0012(5) == 28
    @test euler_0012(500) == 76576500
end

@testset "Euler_0011" begin
    @test euler_0011() == 70600674
end

@testset "Euler_0010" begin
    @test euler_0010(10) == 17
    @test euler_0010(2000000) == 142913828922
end
