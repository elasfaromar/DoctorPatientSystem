from math import floor

def func(n):
    return (floor(n/21)/n) - (floor(n/7)/n)*(floor(n/3)/n)

for i in range(1, 1000):
    res = func(i)

    if (res == 0):
        if (i % 21 != 0):
            print(i, end=',')
            print(i%21, end=' ')
            print('\t',func(i))
