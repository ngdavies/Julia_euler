#!/usr/bin/env julia

# Euler_0025 1000-digit Fibonacci number
# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.
# What is the index of the first term in the Fibonacci sequence to contain 1000 digits? 

function euler_0025(n)
    limit = BigInt(10)^(n-1)
    a, b = BigInt(1), BigInt(1)
    index = 2
    # println("index = 1, a = $a, b = $b, limit = $limit")
    # while length(digits(b)) < n
    while b < limit
        a, b = b, a + b
        index += 1
        # println("index = $index, a = $a, b = $b")
    end
    return index
end

# Euler_0024 Lexicographic permutations
# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
# If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations
# of 0, 1 and 2 are:
# 012   021   102   120   201   210
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

function euler_0024(num, target)
    residue = target-1
    digs = Set(0:num-1)
    result = 0
    for id = num:-1:1
        # println("In: id = $id, residue = $residue, digs = $digs")
        fid = factorial(id-1)
        ix = floor(Int, residue / fid)
        residue -= ix * fid
        d = sort(collect(digs))[ix+1]
        result = 10*result + d
        delete!(digs, d)
        # println("In: res = $result, residue = $residue, d = $d, digs = $digs")
    end
    # println(result)
    return result
end

# #  copilot solution
# import Pkg
# Pkg.add("Combinatorics")
# Pkg.add("IterTools")
# using Combinatorics
# using IterTools
# function euler_0024_copilot()
#    str = join(nth(permutations(collect(0:9)), 10^6))
#    return parse(Int, str)
# end



# Euler_0023 Non-abundant sums
# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28
# is a perfect number.
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant
# if this sum exceeds n.
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written
# as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater
# than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any
# further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two
# abundant numbers is less than this limit.
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers. 


function sum_factors(n)
    sum = 1
    for f = 2:floor(Int, sqrt(n))
        if n % f == 0
            f2 = n ÷ f
            if f == f2
                sum += f
            else
                sum += f + f2
            end
        end
    end
    return sum
end

is_abundant(n) = sum_factors(n) > n

function euler_0023()
    limit = 28123
    abundants = filter(is_abundant, 1:limit)
    abundant_sums = Set()
    for i in abundants
        for j in abundants
            if i + j <= limit
                push!(abundant_sums, i + j)
            end
        end
    end
    return sum(setdiff(1:limit, abundant_sums))
end


# Euler_0022 Names scores
# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names,
# begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value
# by its alphabetical position in the list to obtain a name score.

function euler_0022()
    namesfile = "p0022_names.txt"
    if !isfile(namesfile)
        error("File $namesfile not found in the current directory")
    else
        read_names = readlines(namesfile)
        names = map(x -> x[2:end-1], split(read_names[1], ","))
        sort!(names)
        scores = map(name -> sum(map(c -> Int(c) - Int('A') + 1, collect(name))), names)
        return sum(map(x -> x[1] * x[2], enumerate(scores)))
    end
end


# Euler_0021 Amicable numbers
# Let d(n) be defined as the sum of proper divisors of n 
# (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b 
# are an amicable pair and each of a and b are called
# amicable numbers. 
# For example, the proper divisors of 220 are
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore
# d(220) = 284. The proper divisors of 284 are  1, 2, 4, 71 and 142;
# so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000. 

function sum_proper_divisors(n)
    return sum(filter(x -> n % x == 0, 1:n-1))
end

function euler_0021(n)
    d = x -> sum_proper_divisors(x)
    return sum(filter(x -> x != d(x) && x == d(d(x)), 1:n-1))
end 

# Euler_0020 Factorial digit sum
# n! means n × (n − 1) × ... × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!

function euler_0020(n)
    return sum(digits(factorial(big(n))))
end



