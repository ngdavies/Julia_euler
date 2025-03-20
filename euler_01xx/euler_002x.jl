#!/usr/bin/env julia

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



