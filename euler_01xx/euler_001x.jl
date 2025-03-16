#!/usr/bin/env julia

# Euler_0017 Number letter counts
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are
# 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115
# (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

units = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", 
    "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
tens = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

function letters(n)
    if n == 1000
        return letters(1) + length("thousand")
    elseif n % 100 == 0
        return length("hundred") + letters(n ÷ 100)
    elseif n > 100
        return length("hundred") + letters(n ÷ 100) + length("and") + letters(n % 100)
    elseif n < 20 
        return length(units[n])
    elseif n % 10 == 0
        return length(tens[n ÷ 10])
    else
        return length(tens[n ÷ 10]) + letters(n % 10)
    end
end

function euler_0017(n)
    total = 0
    for i in 1:n
        total += letters(i)
    end
    return total
end



# Euler_0016 Power digit sum
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?

function euler_0016(n)
    sum(digits(BigInt(2)^n))
end



# Euler_0015 Lattice paths
# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
# there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?  (2n)! / (n!)^2      
# Result is ways to sequence 2n steps where n are down and n are right, given by binomial(2n, n)

function euler_0015(n)
    binomial(2n, n)
end


# Euler_0014 Longest Collatz sequence
# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
# Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

function euler_0014(n)
    max_start = n
    max_chain = 0
    max_i = 1
    for i in 1:max_start
        chain = 0
        c = i
        while c != 1
            c = if c % 2 == 0
                    c ÷ 2
                else
                    3c + 1
                end
            chain += 1
        end
        if chain > max_chain
            max_chain = chain
            max_i = i
            # println("i = $i, chain = $chain, max_i = $max_i, max_chain = $max_chain")
        end
    end
    return max_i
end


# Euler_0013 Large sum
# Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.

data = """
37107287533902102798797998220837590246510135740250
46376937677490009712648124896970078050417018260538
74324986199524741059474233309513058123726617309629
91942213363574161572522430563301811072406154908250
23067588207539346171171980310421047513778063246676
89261670696623633820136378418383684178734361726757
28112879812849979408065481931592621691275889832738
44274228917432520321923589422876796487670272189318
47451445736001306439091167216856844588711603153276
70386486105843025439939619828917593665686757934951
62176457141856560629502157223196586755079324193331
64906352462741904929101432445813822663347944758178
92575867718337217661963751590579239728245598838407
58203565325359399008402633568948830189458628227828
80181199384826282014278194139940567587151170094390
35398664372827112653829987240784473053190104293586
86515506006295864861532075273371959191420517255829
71693888707715466499115593487603532921714970056938
54370070576826684624621495650076471787294438377604
53282654108756828443191190634694037855217779295145
36123272525000296071075082563815656710885258350721
45876576172410976447339110607218265236877223636045
17423706905851860660448207621209813287860733969412
81142660418086830619328460811191061556940512689692
51934325451728388641918047049293215058642563049483
62467221648435076201727918039944693004732956340691
15732444386908125794514089057706229429197107928209
55037687525678773091862540744969844508330393682126
18336384825330154686196124348767681297534375946515
80386287592878490201521685554828717201219257766954
78182833757993103614740356856449095527097864797581
16726320100436897842553539920931837441497806860984
48403098129077791799088218795327364475675590848030
87086987551392711854517078544161852424320693150332
59959406895756536782107074926966537676326235447210
69793950679652694742597709739166693763042633987085
41052684708299085211399427365734116182760315001271
65378607361501080857009149939512557028198746004375
35829035317434717326932123578154982629742552737307
94953759765105305946966067683156574377167401875275
88902802571733229619176668713819931811048770190271
25267680276078003013678680992525463401061632866526
36270218540497705585629946580636237993140746255962
24074486908231174977792365466257246923322810917141
91430288197103288597806669760892938638285025333403
34413065578016127815921815005561868836468420090470
23053081172816430487623791969842487255036638784583
11487696932154902810424020138335124462181441773470
63783299490636259666498587618221225225512486764533
67720186971698544312419572409913959008952310058822
95548255300263520781532296796249481641953868218774
76085327132285723110424803456124867697064507995236
37774242535411291684276865538926205024910326572967
23701913275725675285653248258265463092207058596522
29798860272258331913126375147341994889534765745501
18495701454879288984856827726077713721403798879715
38298203783031473527721580348144513491373226651381
34829543829199918180278916522431027392251122869539
40957953066405232632538044100059654939159879593635
29746152185502371307642255121183693803580388584903
41698116222072977186158236678424689157993532961922
62467957194401269043877107275048102390895523597457
23189706772547915061505504953922979530901129967519
86188088225875314529584099251203829009407770775672
11306739708304724483816533873502340845647058077308
82959174767140363198008187129011875491310547126581
97623331044818386269515456334926366572897563400500
42846280183517070527831839425882145521227251250327
55121603546981200581762165212827652751691296897789
32238195734329339946437501907836945765883352399886
75506164965184775180738168837861091527357929701337
62177842752192623401942399639168044983993173312731
32924185707147349566916674687634660915035914677504
99518671430235219628894890102423325116913619626622
73267460800591547471830798392868535206946944540724
76841822524674417161514036427982273348055556214818
97142617910342598647204516893989422179826088076852
87783646182799346313767754307809363333018982642090
10848802521674670883215120185883543223812876952786
71329612474782464538636993009049310363619763878039
62184073572399794223406235393808339651327408011116
66627891981488087797941876876144230030984490851411
60661826293682836764744779239180335110989069790714
85786944089552990653640447425576083659976645795096
66024396409905389607120198219976047599490197230297
64913982680032973156037120041377903785566085089252
16730939319872750275468906903707539413042652315011
94809377245048795150954100921645863754710598436791
78639167021187492431995700641917969777599028300699
15368713711936614952811305876380278410754449733078
40789923115535562561142322423255033685442488917353
44889911501440648020369068063960672322193204149535
41503128880339536053299340368006977710650566631954
81234880673210146739058568557934581403627822703280
82616570773948327592232845941706525094512325230608
22918802058777319719839450180888072429661980811197
77158542502016545090413245809786882778948721859617
72107838435069186155435662884062257473692284509516
20849603980134001723930671666823555245252804609722
53503534226472524250874054075591789781264330331690
"""

function euler_0013()
    thesum = 0
    for line in split(data, '\n')
        if length(line) == 50
            thesum += parse(BigInt, line)
        end
    end
    return parse(Int, string(thesum)[1:10])
end

# Euler 0012 Highly divisible triangular number
# The sequence of triangle numbers is generated by adding the natural numbers.
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.
# The first ten terms would be:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# Let us list the factors of the first seven triangle numbers:
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
# What is the value of the first triangle number to have over five hundred divisors?

function euler_0012(n)
    i = 1
    triangle = 0
    while true
        triangle += i
        i += 1
        factors = 0

        sr = floor(Int, sqrt(triangle))
        for j in 1:sr
            if triangle % j == 0
                factors += 1
            end
        end
        factors *= 2 # One for the tested factor and one for the pair
        # A triangle number can be a perfect square (e.g. 36)
        if sr^2 == triangle
            factors -= 1
        end
        if factors > n
            return triangle
        end
    end
end


# Euler_0011 Largest product in a grid
# In the 20×20 grid below, four numbers along a diagonal line have been marked in red.
# The product of these numbers is 26 x 63 x 78 x 13 = 1788696.
# What is the greatest product of four adjacent numbers in the same direction 
# (up, down, left, right, or diagonally) in the grid?

const grid_string = """
08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08 \
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00 \
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65 \
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91 \
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80 \
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50 \
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70 \
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21 \
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72 \
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95 \
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92 \
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57 \
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58 \
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40 \
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66 \
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69 \
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36 \
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16 \
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54 \
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48
"""

test_string = """
01 02 03 04 05 \
06 07 08 09 10 \
11 12 13 14 15 \
16 17 18 19 20 \
21 22 23 24 25
"""

function euler_0011()
    nBlock = 4
    nRows, nCols = 20, 20
    grid = [parse(Int, x) for x in split(grid_string)]
    # nBlock = 3
    # nRows, nCols = 5, 5
    # grid = [parse(Int, x) for x in split(test_string)]
    # println(grid)
    max = 0

    # Diagonal south-east
    # println("Diagonal south-east")
    for col in 1:nCols - nBlock + 1
        first = col
        last = (nRows - nBlock) * nCols + col
        for ix in first:nCols:last
            # print("ix = $ix, first = $first, last = $last, xxx = $(ix+(nBlock-1)*(nCols+1));  ")
            subs = grid[ix : nCols+1 : ix+(nBlock-1)*(nCols+1)]
            product = prod(subs)
            if product > max
                max = product
            end
            # println("subs = $subs, product = $product, max = $max")
        end
    end

    # Vertical
    # println("Vertical")
    for col in 1:nCols
        first = col
        last = (nRows - nBlock) * nCols + col
        for ix in first:nCols:last
            # print("ix = $ix, first = $first, last = $last, xxx = $(ix+(nBlock-1)*nCols);  ")
            subs = grid[ix:nCols:ix+(nBlock-1)*nCols]
            product = prod(subs)
            if product > max
                max = product
            end
            # println("subs = $subs, product = $product, max = $max")
        end
    end

    # Diagonal south-west
    # println("Diagonal south-west")
    for row in 1:nRows - nBlock + 1
        first = 4 + nCols * (row - 1)
        last = first + nCols - nBlock
        for ix in first:last
            # print("ix = $ix, first = $first, last = $last, xxx = $(ix+(nBlock-1)*(nCols-1));  ")
            subs = grid[ix : nCols-1 : ix+(nBlock-1)*(nCols-1)]
            product = prod(subs)
            if product > max
                max = product
            end
            # println("subs = $subs, product = $product, max = $max")
        end
    end

    # Horizontal
    # println("Horizontal")
    for row in 1:nRows
        first = (row - 1) * nCols + 1
        last = first + nCols - nBlock
        for ix in first:last
            # print("ix = $ix, first = $first, last = $last, xxx = $(ix+nBlock-1);  ")
            subs = grid[ix:ix+nBlock-1]
            product = prod(subs)
            if product > max
                max = product
            end
            # println("subs = $subs, product = $product, max = $max")
        end
    end
    return max
end


# Euler_0010 Summation of primes
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

