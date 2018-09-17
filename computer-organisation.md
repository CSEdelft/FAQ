


[register names:](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/x64-architecture)

|64-bit register | Lower 32 bits | Lower 16 bits | Lower 8 bits		|
| -------------- | ------------- | ------------- | ---------------- |
|rax             | eax           | ax            | al               |
|rbx             | ebx           | bx            | bpl 				|
|rcx             | ecx           | cx            | cl 				|
|rdx             | edx           | dx            | dl 				|
|rsi             | esi           | si            | sil 				|
|rdi             | edi           | di            | dil 				|
|rbp             | ebp           | bp            | bpl				|
|rsp             | esp           | sp            | spl				|
|r8              | r8d           | r8w           | r8b 				|
|r9              | r9d           | r9w           | r9b 				|
|r10             | r10d          | r10w          | r10b 			|
|r11             | r11d          | r11w          | r11b 			|
|r12             | r12d          | r12w          | r12b 			|
|r13             | r13d          | r13w          | r13b 			|
|r14             | r14d          | r14w          | r14b 			|
|r15             | r15d          | r15w          | r15b 			|


[reference of linux syscalls](http://syscalls.kernelgrok.com/)
[quick assembly cheatsheet](https://www.cs.uaf.edu/2005/fall/cs301/support/x86/index.html)

| opcode | operands | function | description |
| --- | --- | --- | --- |
| mov | src,dst | dst = src | copy |
| pushq | dst | dst = (%rsp), %rsp += 8 | pops a value off the stack |
| xchg | A,B | A,B = B,A | switches the contents of A and B |
| --- | --- | --- | --- |
| addq | src,dst | dst = dst + src | adds src to dst |
| sub | src,dst | dst = dst - src | subtracts src from dst |
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
| jlg| label | | jumps to label (if greater than) | 
| jl | label | | jumps to label (if less than) |
| jle | label | | jumps to label (if less than or equal) |
| jge | label | | jumps to label (if greater than or equal) |
| call | label | push <current adress + 1>, jmp label | calls a function |
| ret | | jmp (%rsp) | returns to caller |
| loop | label | dec %rcx, jnz label |
| --- | --- | --- | --- |
| cmp | A,B |  A - B (answer not stored but flags set) | compares 2 numbers. jump instruction follows |
| xor | src,dst | src = src xor dst | bitwise xor |
| or | src,dst | src = src and dst | bitwise and |
| and | src,dst | src = src or dst | bitwise and | 
| shl | A,dst | src = src << A | shift left |
| shr | A,dst | src = src >> A | shift right |
| lea | A, dst | dst = &A | load effective adress (& means adress of) |
| int | int_no | | software interrupt (see linux system calls above, used together with int 0x80) |
