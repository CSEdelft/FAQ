# Computer Organisation
FAQ For Computer Organisation

## Table Of Contents

1. [Base conversion](#Base-Conversion)
	1. [Division method](#division-method)
	2. [Subtraction method](#subtraction-method)
	3. [Divisible bases](#divisible-bases)

2. [Number representations](#number-representations)
	1. [Sign and magnitude](#sign-and-magnitude)
	2. [1s complement](#1s-complement)
	3. [2s complement](#1s-complement)
	4. [Excess-n](#excess-n)
	5. [Fixed point](#fixed-point)
	6. [Floating point (single precision)](#floating-point)

3. [Helpful links](#helpful-links)

## Base Conversion

### Division method:

take any integer x in base a. to convert it to base b, keep dividing x by b. the remainder after every division is the next digit in the number of base b. 

Example:
```
convert the decimal number 1249 to ternary:

1249 / 3 = 416 remainder 1
416 / 3 = 138 remainder 1
138 / 3 = 46 remainder 0
46 / 3 = 15 remainder 1
5 / 3 = 5 remainder 0
5 / 3 = 1 remainder 2
1 / 3 = 0 remainder 1

Therefore the ternary number corresponding to the decimal 1249 is 1201011 (Read from bottom to top).

```

### Subtraction method:

This method is usually the easiest when converting to binary.

```
Convert the decimal number 3689 to binary:

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

### Divisible bases

In the case where the base of number a to the power n is the base of number b, a special technique can be used:

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

### Sign and Magnitude

To represent negative binary numbers a number of systems can be used. sign and magnitude is one.

With sign and magnitude, the most significant bit of any binary number specifies the sign of the number. if it's 1 then the number is negative, else positive.

This makes 100101 negative 5 and 01001 positive 9

Sign and magnitude is the easiest representation with negatives for humans to read, but the hardest for computers to actually calculate with.

range: for n bits, (-2^n-1) + 1 -- (2^n-1)-1, has both positive and negative 0. for 4 bits: -7...-0.+0...+7 

### 1s complement

1s complement is a lot easier (But still not amazing) for computers to calculate with, and it is also quite readable by humans. 1s complement is the same as sign and magnitude, but when the sign is negative, all other bits are inverted.

This makes 100101 negative 26 and 01001 positive 9.

Range: for n bits, (-2^n-1) + 1 -- (2^n-1)-1, has both positive and negative 0. for 4 bits: -7...-0.+0...+7 

### 2s complement

2s complement is the hardest representation for negative whole numbers for humans to read, but the easiest and most efficient for computers to work with. That iss why it is almost always used inside CPUs. 2s complement is the same as adding 1 to the corresponding 1s complement number, whenever it's negative. 

This makes 100101 negative 27, and 01001 still positive 9.

Range: for n bits, (-2^n-1) -- (2^n-1)-1, has both positive and negative 0. for 4 bits: -8...0...+7 

#### 2s complement math
Addition: Addition in 2s complement is very easy you just add the two numbers together like you normally would (this even works with negative numbers and is the reason why it is used in computers so much).

Subtraction: Subtraction is the same as adding a positive and a negative number, so that is exactly how you do subtraction in 2s complement: You first make the value you are subtracting negative (invert and add one) and then you just add.

### Excess-n

Excess-n (or binary offset) representation is just normal binary representation with an offset n and works the following:

* The smallest binary number represents the smallest value (0 − excess)
* The greatest binary number represents the largest value (2^(n+1) − excess − 1)

Here is an example of Excess-3

|Decimal|Excess-3|Binary|
|-------|--------|------|
|-3     |0000    | N/A  |
|-2     |0001    | N/A  |
|-1     |0010    | N/A  |
|0      |0011    | 0000 |
|1      |0100    | 0001 |
|2      |0101    | 0010 |
|3      |0110    | 0011 |
|4      |0111    | 0100 |
|...    |...     | ...  |



### Fixed point

With fixed point number representaion, a binary number is taken and a place is decided where the decimal point will go. In the following examples of fixed point numbers the decimal point will come after 5 bits of integer and before 5 bits of fraction.

Binary numbers in fixed point continue the pattern of each successive bit being worth half of the last. this makes the values of each digit in a number as follows:
```
16   8   4   2   1  .  1/2   1/4   1/8   1/16   1/32
```

Examples:
```
00000.00000 is binary for the decimal number 0.0
10000.00000 is binary for the decimal number 16.0
10001.11000 is binary for the decimal number 17.75
```

Advantages of fixed point are the relatively easy implementation of them in CPUs, the disatvantage is that you can neither make very big nor very precise numbers at the same time. Depending on the place of the decimal point either the precision or magnitude can be very big.

### Floating point

Floating point is very different to the other representations.

A single precision float consists of:

1 bit: sign (1 = negative, 0 = positive)
8 bit: exponent (excess-127 number)
23 bit: mantissa (1.xxxxxx assumed)

example:
```
0 10000010           10100000000000000000000
+ 130 == 3 in e-127  1.101 moving the decimal point 3 places to the right makes 1101.0 == 13  
```
## Helpful links
* [Bases](https://www.ceafinney.com/miscellania/bases.html)

* [Multiplexers and Decoders](https://www.youtube.com/watch?v=HU31Wh-4_K8)

