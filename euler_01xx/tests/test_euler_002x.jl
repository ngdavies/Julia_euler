#!/usr/bin/env julia

using Test

include("../euler_002x.jl")

@testset "Euler_0025" begin
    @test euler_0025(3) == 12
    @test euler_0025(1000) == 4782
end

@testset "Euler_0024" begin
    # @test euler_0024_copilot() == 2783915460
    @test euler_0024(3,4) == 120
    @test euler_0024(10,10^6) == 2783915460
end

@testset "Euler_0023" begin
    @test euler_0023() == 4179871
end

@testset "Euler_0022" begin
    @test euler_0022() == 871198282
end

@testset "Euler_0021" begin
    @test sum_proper_divisors(220) == 284
    @test sum_proper_divisors(284) == 220
    @test euler_0021(10000) == 31626
end

@testset "Euler_0020" begin
    @test euler_0020(10) == 27
    @test euler_0020(100) == 648   
end
