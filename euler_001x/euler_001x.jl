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