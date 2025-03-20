#!/usr/bin/env julia

using Test

include("../euler_002x.jl")

@testset "Euler_0020" begin
    @test sum_proper_divisors(220) == 284
    @test sum_proper_divisors(284) == 220
    @test euler_0021(10000) == 31626
end

@testset "Euler_0020" begin
    @test euler_0020(10) == 27
    @test euler_0020(100) == 648   
end
