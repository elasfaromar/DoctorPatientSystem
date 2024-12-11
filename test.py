from math import floor

""" for i in range(1,21):
    print(i, end=' ')
    print(3*floor(i/3)+(7+floor(i/3))*floor(i/7), end='\n') """

for i in range(1,1000):
    three = i if i%3==0 else ''
    six = i if i%6==0 else ''
    seven = i if i%7==0 else ''

    print(f'{three:<3} {six:<3} {seven:<3}')

