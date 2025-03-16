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

