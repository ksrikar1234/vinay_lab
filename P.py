import sys

# for line in sys.stdin:

    # [X,S,R,t,N] = inFile.getInts()

    # return (X,S,R,t,[inFile.getInts() for k in xrange(N)])

li = input().split()

# print(li)

X = int(li[0])

S = float(li[1])

R = int(li[2])

t = float(li[3])

N = int(li[4])

# X = int(input("Distance"))

# S = float(input("Speed"))

# R = float(input("Running Speed"))

# t = float(input("Running time"))

# N = int(input("No. of walkaways"))

walkways = []

for walkaway in range(N):

    # print("Walkaway:"+ str(walkaway))

    li = input().split()

    bi = int(li[0])

    ei = int(li[1])

    wi = float(li[2])

    walkways.append([wi,ei-bi])

walkways += [[0,X-sum([z[1] for z in walkways])]]

walkways.sort()

timeTaken = 0

for [speed,length] in walkways:

    runtime = float(length) / (R + speed)

    if (runtime < t):

        t -= runtime

        timeTaken += runtime

    else:

        walktime = float(length - (R + speed) * t) / (S + speed)

        timeTaken += t + walktime

        t = 0

print("%.3f" % timeTaken)
