# Assembly
FAQ For Computer Organisation's Assembly
## Table of contents
1. [Registers](#registers)
	1. [Table](#registers-table)
	2. [Layout](#register-memory-layout)
2. [Opcode Table](#opcode-table)
3. [Stackframes](#stackframe)
4. [Addressing Modes](#addressing-modes)
5. [Assembler Directives](#assembler-directives)
6. [sections](#sections)
7. [X86 Calling Convention](#x86-calling-convention)
8. [Handy Links](#handy-links)
9. [GDB](#gdb)
10. [command line arguments](#command-line-arguments)

## Registers

### Registers Table
|64-bit register | Lower 32 bits | Lower 16 bits | Lower 8 bits	 |
| -------------- | ------------- | ------------- | ------------- |
|rax             | eax           | ax            | al 		 |
|rbx             | ebx           | bx            | bl		 | 
|rcx             | ecx           | cx            | cl		 |
|rdx             | edx           | dx            | dl		 |
|rsi             | esi           | si            | sil	 	 |
|rdi             | edi           | di            | dil	 	 |
|rbp             | ebp           | bp            | bpl	 	 |
|rsp             | esp           | sp            | spl	 	 |
|r8              | r8d           | r8w           | r8b	 	 |
|r9              | r9d           | r9w           | r9b	 	 |
|r10             | r10d          | r10w          | r10b	 	 |
|r11             | r11d          | r11w          | r11b	 	 |
|r12             | r12d          | r12w          | r12b	 	 |
|r13             | r13d          | r13w          | r13b	 	 |
|r14             | r14d          | r14w          | r14b	 	 |
|r15             | r15d          | r15w          | r15b	 	 |

Other important registers:
RIP = instruction pointer, points to the next instruction to be executed. changing this register is the same as a jumps   
RFLAGS = register that stores information about the last calculation (flags) to use for conditional jumps

[Source/More Info](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/x64-architecture)


### Register Memory Layout
Registers work like this, meaning every row in the above table is actually the same register but parts of it as shown below:

<table class="registers">
	<tbody>
		<tr align="center">
			<td width="200"></td>
			<td width="50"></td>
			<td width="50"></td>
			<td width="50"> %ah <br> 8 bits </td>
			<td width="50">%al<br>8 bits </td>
		</tr>
		<tr align="center">
			<td></td>
			<td></td>
			<td></td>
			<td colspan="2">%ax<br>16 bits</td>
		</tr>
		<tr align="center">
			<td></td>
			<td colspan="4">%eax<br>32 bits</td>
		</tr>
		<tr align="center">
			<td colspan="5">%rax<br>64 bits</td>
		</tr>
	</tbody>
</table>



## Opcode Table
| opcode | operands | function | description |
| --- | --- | --- | --- |
| mov | src,dst | dst = src | copy |
| push | dst |(%rsp) = dst, %rsp -= 8 | pushes a value onto the stack |
| pop | src | %rsp += 8,src=(%rsp) | pops a value off the stack |
| xchg | A,B | A,B = B,A | switches the contents of A and B |
| --- | --- | --- | --- |
| addq | src,dst | dst = dst + src | adds src to dst |
| subq | src,dst | dst = dst - src | subtracts src from dst |
| inc | dst | dst = dst + 1 | adds 1 to dst |
| dec | dst | dst = dst - 1 | subtracts 1 from dst |
| mulq | src | rdx:rax = rax * src | multiplies rax by src (UNSIGNED) |
| imulq | src | rdx:rax = rax * src | multiplies rax by src (SIGNED) |
| divq | src | rdx:rax = rax / src | divides rax by src (SIGNED) |
| idivq | src | rdx:rax = rax / src | divides rax by src (SIGNED) |
| --- | --- | --- | --- |
| jmp | label | | jumps to label (unconditional) |
| je | label | | jumps to label (if equal) |
| jne | label | | jumps to label (if not equal) |
| jg| label | | jumps to label (if greater than) | 
| jl | label | | jumps to label (if less than) |
| jle | label | | jumps to label (if less than or equal) |
| jge | label | | jumps to label (if greater than or equal) |
| call | label | push <current adress + 1>, jmp label | calls a function |
| ret | | jmp (%rsp) | returns to caller |
| loop | label | dec %rcx, jnz label |
| --- | --- | --- | --- |
| cmp | A,B |  A - B (answer not stored but flags set) | compares 2 numbers. jump instruction follows |
| xorq | src,dst | src = src xor dst | bitwise xor |
| orq | src,dst | src = src and dst | bitwise and |
| andq | src,dst | src = src or dst | bitwise and | 
| shlq | A,dst | src = src << A | shift left |
| shrq | A,dst | src = src >> A | shift right |
| not | dst | dst = 1111111- dst | bitwise inversion of dst |
| neg | dst | dst = 0 - dst | 2's complement, result of not and add 1 |
| leaq | A, dst | dst = &A | load effective adress (& means adress of) |
| int | int_no | | software interrupt (see linux system calls above, used together with int 0x80) |

## Stackframe
Generally, to initialize a stackframe use:
```assembly
	push %rbx #save necessary registers
	push %r12
	push %r13
	push %r14
	push %r15

	push %rbp #generate stackframe
	movq %rsp, %rbp
```

And to destroy it again use:
```assembly
	movq %rbp, %rsp #restore last stackframe
	pop %rbp

	pop %r15 #restore necessary registers
	pop %r14	
	pop %r13	
	pop %r12	
	pop %rbx	

	ret

```

## Addressing Modes
|example | name | description
| --- | --- | --- |
|movq $label,%rax | immediate (pointer) | loads the location of the label into rax | 
|movq label,%rax | immediate | loads the quadword at the location of the label into rax | 
|movq (%rbx),%rax | indirect | loads the quadword at the location pointed to by rbx into rax | 
|movq 8(%rbx),%rax | indirect offset (positive) | loads the quadword 8 after the location pointed to by rbx into rax | 
|movq -8(%rbx),%rax | indirect offset (negative) | loads the quadword 8 before the location pointed to by rbx into rax | 
|movq (%rbx,%rcx),%rax | indirect variable offset | loads the quadword at %rcx after the location pointed to by rbx into rax | 
|movq (%rbx,%rcx,8),%rax | indirect variable scaled offset (negative) | loads the quadword at %rcx*8 after the location pointed to by rbx into rax | 
|movq 8(%rbx,%rcx,8),%rax | indirect variable scaled offset (negative) +constant | loads the quadword at 8 after %rcx*8 after the location pointed to by rbx into rax | 

## Assembler Directives

Assembler directives are notes for the assembler which tell it how to do the compiling. 

| directive | explaination |
| --------- | ------------ | 
| .quad  | reserves space for a 64 bit number to be stored |
| .long  | reserves space for a 32 bit number to be stored | 
| .word  | reserves space for a 16 bit number to be stored | 
| .byte  | reserves space for a 8  bit number to be stored | 
| .asciz | reserves space for a string of text to be stored, automatically terminated by a 0 (NULL ) | 
| .ascii | reserves space for a string of text to be stored, *not* automatically terminated by a 0 (NULL ) | 
| .skip n | skips n bytes. useful for defining arrays of data. This should normally only be used in the .bss [section](#bss) | 

## Sections

The 4 sections of an assembly program are
* [.text](#text)
* [.data](#data)
* [.bss](#bss)
* [.rodata](#rodata)

using linker scripts (google if you want to know more) more sections can be added. this is done in the gamelib for assignment 7

note that any part of assembly can be in any section. sections are *just* for optimalization. This means you can put data in text, and text in bss. the only 'restrictive' section is rodata because it can only store read only data.
*note*: [using GDB](#GDB) works only if code is in .text 

defining a section is easy. just put a  . plus the name of the section (like .bss or .text) and then everything after that in the file is part of that section. you can make multiple instances of the same section in different parts of your program (for example two .data sections) and the assembler (gcc) will make sure everything is combined into one.

### text

in .text code is stored. you write your program in this section. make sure you do this for [GDB](#GDB) to work.

### data

in .data small variables (integers, text) is stored to be used in your program 

### bss

in .bss data can also be stored. the difference is that bss data *must* be uninitialized. this is the case because all of the other sections will actually become a part of the executable file, while the bss section is only a 'promise' for the os. when the program runs the space is created in ram by the os. if you define large arrays of data this should be done in bss to keep the executable small

### rodata

rodata should be used (and is optimized for) storing constant data. this section can *only* be read from.

## X86 Calling Convention
The calling convention (System V AMD64 ABI) that is used on \*nix systems is as follows. *for __64__ bit programs only*
The first six integer or pointer arguments passed in the registers in this order: 
1. `RDI`
2. `RSI` 
3. `RDX`
4. `RCX` 
5. `R8`
6. `R9`
7. (with sometimes `R10` as a static chain pointer in case of nested functions)
8. Additional arguments are to be passed on to the stack

The return values are stored in `RAX` (In case of a 64 bit number) and in `RDX:RAX` (MSB:LSB) in case of 128 bit numbers.

[Source \(x86 Calling Conventions Wikipedia\)](https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI)

An illustration of how C functions are called in respect to the x86_64 SysV calling convention:
![args](https://user-images.githubusercontent.com/10385659/45920669-305d3c80-bea8-11e8-932f-f198d48c4e2d.jpg)

## GDB

GDB is a debugger which can help find segfaults or find other mistakes in your program. to use it compile it using the *-g* option (put it directly after "gcc") and then instead of running it like ./<programname>, you run it as gdb ./<programname>. this should launch you into a gdb environment. in this environment you can use the following commands:

* b n (or breakpoint). this sets a breakpoint on line n
* print code. this prints whatever you specify in code. this can be a full c expression, or a register name (e.g. $rdi or $rax)
* x/nx p print n 32 bit words after p. p can be an adress or register. this is useful for reading whats on the stack (e.g. x/10x $rbp)
* n (or next) steps ahead one instruction. when it finds a function call it will not step into instructions inside this function. useful to skip large functions like c stdlib function like printf
* s (or step) steps ahead one instruction. this one does go into large functions
* r (or run) runs the program until the next breakpoint or the end
* c (or continue) after a breakpoint, continue restarts execution like run did until it encounters another breakpoint or the program ends. useful if a breakpoint is in a loop and you want to go to the next iteration
* start starts the program, places a breakpoint on line one so you can imediately start using s and n

when using GDB your program *must* be compiled with -g and your code *must* be in a .text section

## command line arguments

Getting command line arguments is easy in assembly. basically it works the same as in C. The main function/label is actually called with 2 arguments in rdi and rsi. rdi is the ammount of arguments, and rsi is a pointer to an array of strings which holds the arguments. you know where the array ends with argc/rdi.

## Handy Links
* [reference of linux syscalls](http://syscalls.kernelgrok.com/)
* [quick assembly cheatsheet](https://www3.nd.edu/~dthain/courses/cse40243/fall2015/intel-intro.html)
* [quick assembly cheatsheet 2](https://www.cs.uaf.edu/2005/fall/cs301/support/x86/index.html)
* [quick assembly cheatsheet 3](https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf)
