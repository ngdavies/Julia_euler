# Euler_0010
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

function euler_0010(n)
    is_prime = trues(n)
    is_prime[1] = false
    for i in 2:floor(Int, sqrt(n))
        if is_prime[i]
            for j in i^2:i:n
                is_prime[j] = false
            end
        end
    end
    return sum(filter(x -> is_prime[x], 1:n))
end

# function sieve(n)
#     is_prime = trues(n)
#     is_prime[1] = false
#     for i in 2:floor(Int, sqrt(n))
#         if is_prime[i]
#             for j in i^2:i:n
#                 is_prime[j] = false
#             end
#         end
#     end
#     return filter(x -> is_prime[x], 1:n)
# end

# function euler_0010_not(n)
#     primes = sieve(n - 1)
#     return sum(primes)
# end


# Euler_0009
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc. 

function euler_0009(N)
    for a in 1:(N ÷ 3)  # a must be less than N/3 to ensure a < b < c
        for b in (a+1):(N-a)÷2  # b must be greater than a and less than (N-a)/2
            c = N - a - b  # Compute c directly
            if a^2 + b^2 == c^2  # Check Pythagorean condition
                # println("Triplet: ($a, $b, $c)")
                # return (a, b, c)  # Return first found triplet
                return a * b * c
            end
        end
    end
    return nothing  # No triplet found
end


# Euler_0008
# The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
# Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product? 

const s = """
73167176531330624919225119674426574742355349194934\
96983520312774506326239578318016984801869478851843\
85861560789112949495459501737958331952853208805511\
12540698747158523863050715693290963295227443043557\
66896648950445244523161731856403098711121722383113\
62229893423380308135336276614282806444486645238749\
30358907296290491560440772390713810515859307960866\
70172427121883998797908792274921901699720888093776\
65727333001053367881220235421809751254540594752243\
52584907711670556013604839586446706324415722155397\
53697817977846174064955149290862569321978468622482\
83972241375657056057490261407972968652414535100474\
82166370484403199890008895243450658541227588666881\
16427171479924442928230863465674813919123162824586\
17866458359124566529476545682848912883142607690042\
24219022671055626321111109370544217506941658960408\
07198403850962455444362981230987879927244284909188\
84580156166097919133875499200524063689912560717606\
05886116467109405077541002256983155200055935729725\
71636269561882670428252483600823257530420752963450
"""

function euler_0008(n)
    max = 0
    for i in 1:length(s)-n
        product = 1
        for j in i:i+n-1
            product *= parse(Int, s[j])
        end
        if product > max
            max = product
        end
    end
    return max
end




# Euler_0007
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
# we can see that the 6th prime is 13.
# What is the 10 001st prime number? 

function euler_0007(n)
    primes = [2]
    i = 3
    while length(primes) < n
        is_prime = true
        for p in primes
            if i % p == 0
                is_prime = false
                break
            end
        end
        if is_prime
            push!(primes, i)
        end
        i += 2
    end
    return primes[n]
end


# Euler_0006
# The sum of the squares of the first ten natural numbers is,
#  1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
#  (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first
# ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one 
# hundred natural numbers and the square of the sum.

function euler_0006(n)
    sum_of_squares = n * (n + 1) * (2n + 1) / 6
    square_of_sum = (n * (n + 1) / 2)^2
    return square_of_sum - sum_of_squares
end


# Euler_0005
# 2520 is the smallest number that can be divided by each of the numbers
# from 1 to 10 without any remainder. What is the smallest positive number 
# that is evenly divisible by all of the numbers from 1 to 20?

function euler_0005(n)
    if n == 10 
        return 2 * 3 * 2 * 5 * 7 * 2 * 3
    elseif n == 20
        return 2^4 * 3^2 * 5 * 7 * 11 * 13 * 17 * 19
    end
end




# Euler_0004
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

function is_palindrome(n)
    s = string(n)
    return s == reverse(s)
end

function euler_0004(n)
    max = 0
    imax, jmax = 0, 0
    if n > 10 
        limit = n - n÷10
    else
        limit = 1
    end
    for i in n-1:-1:limit
        for j in n-1:-1:limit
            product = i * j
            if product > max && is_palindrome(product)
                max = product
                imax, jmax = i, j
            end
        end
    end
    return max
end



# Euler_0003
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

function euler_0003(n)
    # Assume n is greater than 2.
    # Eliminate all factors of 2 to speed up the main loop.
    i = 2
    while n % i == 0
        n = n / i
    end
    if n == 1
        return i
    end
    i = 3
    while n > 1 
        if n % i == 0
            n = n / i
        else
            i += 2
        end
    end
    return i
end


# Euler_0002
# Each new term in the Fibonacci sequence is generated by adding the previous two terms. 
# By starting with 1 and 2, the first 10 terms will be:
#    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not exceed four million,
# find the sum of the even-valued terms.

function euler_0002(n)
    sum = 0
    a, b = 1, 2
    while a < n
        if a % 2 == 0
            sum += a
        end
        # println("sum: $sum, a: $a, b: $b")
        a, b = b, a + b
    end
    return sum
end


# Euler_0001
# If we list all the natural numbers below  that are multiples of  or , we get  and . The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

function euler_0001(n)
    sum = 0
    for i in 1:n-1
        if i % 3 == 0 || i % 5 == 0
            sum += i
        end
    end
    return sum
end