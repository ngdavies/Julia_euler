#!/usr/bin/env julia

using Test

include("euler_001x.jl")

@testset "euler_0005_ex" begin
    @test euler_0005(10) == 2520
    @test euler_0005(20) == 232792560
end

@testset "euler_0004_ex" begin
    @test euler_0004(100) == 9009
    @test euler_0004(1000) == 906609
end

@testset "euler_0003_ex" begin
    @test euler_0003(13195) == 29
    @test euler_0003(600851475143) == 6857
end

@testset "euler_0002_ex" begin
    @test euler_0002(100) == 44
    @test euler_0002(4000000) == 4613732
end

@testset "euler_0001_ex" begin
    @test euler_0001(10) == 23 
    @test euler_0001(1000) == 233168
end
