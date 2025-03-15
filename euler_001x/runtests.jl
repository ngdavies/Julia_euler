#!/usr/bin/env julia

using Test

include("euler_001x.jl")

@testset "Euler_0009" begin
    @test euler_0009(12) == 60
    @test euler_0009(1000) == 31875000
end

@testset "euler_0008" begin
    @test euler_0008(4) == 5832
    @test euler_0008(13) == 23514624000
end

@testset "euler_0007" begin
    @test euler_0007(6) == 13
    @test euler_0007(10001) == 104743
end

@testset "euler_0006" begin
    @test euler_0006(10) == 2640
    @test euler_0006(100) == 25164150
end

@testset "euler_0005" begin
    @test euler_0005(10) == 2520
    @test euler_0005(20) == 232792560
end

@testset "euler_0004" begin
    @test euler_0004(100) == 9009
    @test euler_0004(1000) == 906609
end

@testset "euler_0003" begin
    @test euler_0003(13195) == 29
    @test euler_0003(600851475143) == 6857
end

@testset "euler_0002" begin
    @test euler_0002(100) == 44
    @test euler_0002(4000000) == 4613732
end

@testset "euler_0001" begin
    @test euler_0001(10) == 23 
    @test euler_0001(1000) == 233168
end
