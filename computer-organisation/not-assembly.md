# Computer Organisation
FAQ For Computer Organisation


## Table Of Contents

1. [base conversion](#Base-Conversion)
	1. [division method](#division-meth0d)
	2. [subtraction method](#subtraction-method)
	3. [divisible bases](#divisible-bases)

2. [number representations](#Number-Representations)
	1. [sign-magnitude](#sign-magnitude)
	2. [1s complement](#1s-complement)
	3. [2s complement](#1s-complement)
	4. [excess-n](#excess-n)
	5. [fixed point](#fixed-point)
	6. [floating point (single prec)](#floating-point)

3. [handy links](#Handy-links)

## Base Conversion

### division method:

take any integer x in base a. to convert it to base b, keep dividing x by b. the remainder after every division is the next digit in the number of base b. 

example:
```
convert the decimal number 1249 to ternary:

1249 / 3 = 416 remainder 1
416 / 3 = 138 remainder 1
138 / 3 = 46 remainder 0
46 / 3 = 15 remainder 1
5 / 3 = 5 remainder 0
5 / 3 = 1 remainder 2
1 / 3 = 0 remainder 1

therefore the ternary number corresponding to the decimal 1249 is 1201011 (Read from bottom to top)

```

### subtraction method:

this method is usually the easiest when converting to binary

```

convert the decimal number 3689 to binary:

powers of 2:
2^0 = 1
2^1 = 2
2^2 = 4
2^3 = 8
2^4 = 16
2^5 = 32
2^6 = 64
2^7 = 128
2^8 = 256
2^9 = 512
2^10 = 1024
2^11 = 2048

3689 - 2048 = 1641 (therefore the 12th bit of the binary number is 1)
1641 - 1024 = 617 (therefore the 11th bit of the binary number is 1)
617 - 512 = 105 (therefore the 10th bit of the binary number is 1)
105 - 256 = negative (therefore the 9th bit of the binary number is 0)
105 - 128 = negative (therefore the 8th bit of the binary number is 0)
105 - 64 = 41 (therefore the 7th bit of the binary number is 1)
41 - 32 = 9 (therefore the 6th bit of the binary number is 1)
9 - 16 = negative (therefore the 5th bit of the binary number is 0)
9 - 8 = 1 (therefore the 4th bit of the binary number is 1)
1 - 4 = negative (therefore the 3th bit of the binary number is 0)
1 - 2 = negative (therefore the 2th bit of the binary number is 0)
1 - 1 = 0 (therefore the 2th bit of the binary number is 1)

the binary representation of 3689 is 111001101001 (read from top to bottom)

```

### divisible bases:

in the case where the base of number a to the power n is the base of number b, a special technique can be used:

```

convert the hexadecimal number 1BADB002 to quaternary (props for who gets this reference)


4 ^ *2* = 16, therefore we can use every *2* digits in quaternary and read them as 1 digit in hexadecimal.

quaternary -- hexadecimal

00 = 0
01 = 1
02 = 2 
03 = 3
10 = 4
11 = 5
12 = 6
13 = 7
20 = 8
21 = 9
22 = a
23 = b
30 = c
31 = d
32 = e
33 = f

1 --> 01
B --> 23
A --> 22
D --> 31
B --> 23
0 --> 00
0 --> 00
2 --> 02

therefore 1BADB002 in hexadecimal is 0123223123000002 in quaternary

```



## Number Representations

### sign-magnitude

to represent negative binary numbers a number of systems can be used. sign and magnitude is one.

with sign and magnitude, the most significant bit of any binary number specifies the sign of the number. if it's 1 then the number is negative, else positive.

this makes 100101 negative 5 and 01001 positive 9

sign and magnitude is the easiest for humans to read, but the hardest for computers to actually calculate with

range: for n bits, (-2^n-1) + 1 -- (2^n-1)-1, has both positive and negative 0. for 4 bits: -7...-0.+0...+7 

### 1s complement

1s complement is a lot easier (But still not amazing) for computers to calculate with, and it is also quite readable by humans. 1s complement is the same as sign and magnitude, but when the sign is negative, all other bits are inverted.

this makes 100101 negative 26 and 01001 positive 9. 

range: for n bits, (-2^n-1) + 1 -- (2^n-1)-1, has both positive and negative 0. for 4 bits: -7...-0.+0...+7 

### 2s complement

2s complement is the hardest representation for negative numbers for humans to read, but the easiest and most efficient for computers to work with. that's why its almost always used inside cpus. 2s complement is the same as adding 1 to the corresponding 1s complement number, whenever it's negative

this makes 100101 negative 25, and 01001 still positive 9.

range: for n bits, (-2^n-1) -- (2^n-1)-1, has both positive and negative 0. for 4 bits: -8...0...+7 

### excess-n

### fixed point

with fixed point, a binary number is taken and a place is decided where the decimal point will go. in the following examples of fixed point numbers the decimal point will come after 5 bits of integer and before 5 bits of fraction.

binary numbers in fixed point continue the pattern of each successive bit being worth half of the last. this makes the values of each digit in a number as follows:

16   8   4   2   1 . 1/2   1/4   1/8   1/16   1/32

examples:

00000.00000 is binary for the decimal number 0.0
10000.00000 is binary for the decimal number 16.0
10001.11000 is binary for the decimal number 17.75


advantages of fixed point are the relatively easy implementation of them in cpus, the disatvantage is that you can neither make very big nor very precise numbers at the same time. depending on the place of the decimal point either the precision or magnitude can be very big.

### floating point

floating point is very different to the other representations:

a single precision float consists of:

1 bit: sign (1 = negative, 0 = positive)
8 bit: exponent (excess-127 number)
23 bit: mantissa (1.xxxxxx assumed)

examples:

0 10000010           10100000000000000000000
+ 130 == 3 in e-127  1.101 moving the decimal point 3 places to the right makes 1101.0 == 13  

...


## handy links

https://www.ceafinney.com/miscellania/bases.html



