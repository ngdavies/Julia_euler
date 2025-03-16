#!/usr/bin/env julia

using Test

include("../euler_001x.jl")

@testset "Euler_0017" begin
    @test letters(342) == 23
    @test letters(115) == 20
    @test euler_0017(5) == 19
    @test euler_0017(1000) == 21124
end

@testset "Euler_0016" begin
    @test euler_0016(15) == 26
    @test euler_0016(1000) == 1366
end

@testset "Euler_0015" begin
    @test euler_0015(2) == 6
    @test euler_0015(20) == 137846528820
end

@testset "Euler_0014" begin
    @test euler_0014(1000000) == 837799
end

@testset "Euler_0013" begin
    @test euler_0013() == 5537376230
end

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
