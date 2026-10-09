    .section .data
Numbers:
    .long 1
    .long 15
    .long 4
    .long 2
    .long 7
    .long 9
    .long 23
    .long 7
    .long 3
    .long 11
Array_length:
    .long 10

    .section .rodata
.Lformat:
    .string "Maximum: %d\n"

    .section .text
    .globl main
    .type main, @function
main:
    pushl %ebp
    movl %esp, %ebp
    andl $-16, %esp

    # Start with the first element so negative values work too.
    movl Numbers, %eax
    movl $1, %ecx

.Lwhile:
    # while (i < Array_length)
    cmpl Array_length, %ecx
    jge .Ldone

    movl Numbers(,%ecx,4), %edx
    cmpl %eax, %edx
    jle .Lnext
    movl %edx, %eax

.Lnext:
    incl %ecx
    jmp .Lwhile

.Ldone:
    # Keep the stack aligned to 16 bytes before calling printf.
    subl $8, %esp
    pushl %eax
    pushl $.Lformat
    call printf
    addl $16, %esp

    xorl %eax, %eax
    leave
    ret
    .size main, .-main

    .section .note.GNU-stack,"",@progbits
