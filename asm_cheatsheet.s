#http:#asm.sourceforge.net/syscall.html
.equ sys_setup, 0x0 
.equ sys_exit, 0x1 #eax=sys_write,ebx=exit code
.equ sys_fork, 0x02 #eax=sys_fork
.equ sys_read, 0x03 #eax=sys_read,ebx=fd,ecx=buffer,edx=count
.equ sys_write, 0x4  #eax=sys_write,ebx=fd,ecx=buffer,edx=count
.equ sys_open, 0x5 # USE SYS_CREAT!!! eax=sys_open,ebx=filename, ecx=flags,edx=mode (modes in https:#github.com/torvalds/linux/blob/master/include/uapi/asm-generic/fcntl.h)
.equ sys_close, 0x6 #eax=sys_close,ebx=fd
.equ sys_creat, 0x7 #eax=sys_creat,ebx=filename,ecx=mode (modes in https:#github.com/torvalds/linux/blob/master/include/uapi/asm-generic/fcntl.h)
.equ sys_lseek, 0x13 #eax=sys_lseek,ebx=fd,exc=offset,edx=origin

#reading files example: https:#bbs.archlinux.org/viewtopic.php?id=70229

.macro INIT_STACKFRAME 
	push %ebp
	movl %esp, %ebp
	push %ebx
	push %r12d
	push %r13d
	push %r14d
	push %r15d
.endm

.macro END_STACKFRAME
	pop %r15d
	pop %r14d
	pop %r13d
	pop %r12d
	pop %ebx
	pop %ebp
	ret
.endm


.macro CLEANUP_STACK n #cleans up n 32bit parameters
	addl \n, %esp
.endm



/*c arguments:

push args in reverse to stack
call <function>
addl  $a, %esp #with a being the ammount of bytes we pushed as args

reference:

mov: copy from src to dest
	movq src, dest #quad (64b)
	movl src, dest #long (32b)
	movw src, dest #word (16b)
	movb src, dest #byte (8b)
	

	indexed access:
		mov <base>(offset,index,size), dest
		addr = base + offset + index*size
		if a value is 0, just use a comma

	indirect access:
		mov (src),dest #access the location pointed to by src
		mov src,(dest) #access the location pointed to by dest
		mov (src),(dest) #obvious
		mov src, offset(dest) #access the data offset bytes after the location pointed to by dest. offset can be negative

bswap: reverse byte order of a 32 bit register	
xchg: swap the values of 2 registers

push/pop: stack access
pusha/popa: push/pop all 16 bit regs
pushad/popad: push/pop all 32 bit registers

jmp:
	jmp <label>
	call <label> #ret adress pushed on stack
	ret #returns to caller
	jcf <label> # jump if carry flag
	jof <label> #jump if overflow flag
	jpf <label> #jump if parity flag
	jsf <label> #jump if sign flag
	jzf <label> #jump if zero flag
	
	jg <label> #jump if greater than
	jge <label> #jump if greater than or equal
	jlt	<label> #jump if less than
	jle <label> #jump if less than or equal
	jne <label> #jump if not equal
	je <label> #jump if equal


loop:
	loop <label> #loop until ecx is zero (ONLY JUMPS OF MAX 255 BYTES SUPPORTED (shortjump))
	

add:
	val can be constant, or any adressing mode (see mov)
	addb val, dest #add val to dest (8b)
	addw val, dest #add val to dest (16b)
	addl, val, dest #add val to dest (32b)
	addq, val, dest #add val to dest (64b)

sub:
	same as add

dec:
	dec dest #subtracts 1 to dest

inc:
	inc dest #adds 1 to dest

mul:
	mul source # source * eax --> edx + eax! (source = 32b)
	mul source # source * ax --> dx + ax (source = 16b)

imul:
	same as mul but also works for signed integers

int: software interrupt
	int intnumber #http:#asm.sourceforge.net/syscall.html
	ebx: first param
	ecx: second param
	edx: third param
	esi: fourth param
	edi: fifth param


sal (shift arithmetic left), shl (shift logical left):
	sal destination
	sal #positions, destination

sar (shift arithmetic right), shr (shift logical right):
	see sal, shl

rol, ror:
	rotate instead of shift. same syntax as shifting (above)


logic:
	and source, destination
	or source, destination
	xor source, destination
	not destination

movs: (sometimes faster than mov?)
	movsl source, destination #move single long (32b)
	movsw source, destination #move single word (16b)
	movsb source, destination #move single byte (8b)




sizes:
	.ascii # Text string
	.asciz # Null-terminated text string
	.byte # Byte value
	.double # Double-precision floating-point number
	.float # Single-precision floating-point number
	.int # 32-bit integer number
	.long # 32-bit integer number (same as .int)
	.octa # 16-byte integer number
	.quad # 8-byte integer number
	.short # 16-bit integer number
	.single # Single-precision floating-point number (same as .float)

bss section:
	.lcomm <name>, <size> #local common area, size in bytes!
	.comm <name>, <size> #common area, size in bytes!

file descriptors: https:#en.wikipedia.org/wiki/File_descriptor
	0 = STDIN
	1 = STDOUT
	2 = STDERR
	more can created with the sys_open syscall

register names: https:#docs.microsoft.com/en-us/windows-hardware/drivers/debugger/x64-architecture
64-bit register | Lower 32 bits | Lower 16 bits | Lower 8 bits
==============================================================
rax             | eax           | ax            | al
rbx             | ebx           | bx            | bl
rcx             | ecx           | cx            | cl
rdx             | edx           | dx            | dl
rsi             | esi           | si            | sil
rdi             | edi           | di            | dil
rbp             | ebp           | bp            | bpl
rsp             | esp           | sp            | spl
r8              | r8d           | r8w           | r8b dont use outside 64 bit mode 
r9              | r9d           | r9w           | r9b dont use outside 64 bit mode 
r10             | r10d          | r10w          | r10b dont use outside 64 bit mode 
r11             | r11d          | r11w          | r11b dont use outside 64 bit mode 
r12             | r12d          | r12w          | r12b dont use outside 64 bit mode 
r13             | r13d          | r13w          | r13b dont use outside 64 bit mode 
r14             | r14d          | r14w          | r14b dont use outside 64 bit mode 
r15             | r15d          | r15w          | r15b dont use outside 64 bit mode 


basic hello world program:


*/


.data
hello:
    .string "Hello world!\n"

.text
.globl main
main:
	movl $4, %eax # write(1, hello, strlen(hello))
	movl $1, %ebx
	movl $hello, %ecx
	movl $13, %edx
	int  $0x80

	movl $1, %eax # exit(0)
	movl $0, %ebx
	int  $0x80

#compile with gcc -m32 -o out <filename.S>
#run with ./out after compilation
#ON A LINUX MACHINE!!!!