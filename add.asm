include /masm32/include/masm32rt.inc

.data
inputMessage db "Input your number: ", 13, 10, 0
inputBuffer1 db 64 dup(?)
inputBuffer2 db 64 dup(?)
num1 dd 0
num2 dd 0
result dd 0
outputStr db "Your answer is: ", 0
resultStr db 64 dup(?)

.code
start:
    push offset inputMessage
    call StdOut

    push 64
    push offset inputBuffer1
    call StdIn
    invoke atodw, offset inputBuffer1
    mov num1, eax

    push 64
    push offset inputBuffer2
    call StdIn
    invoke atodw, offset inputBuffer2
    mov num2, eax

    mov eax, num1
    mov ebx, num2

    add eax, ebx
    mov result, eax

    push offset outputStr
    call StdOut
    
    invoke dwtoa, result, offset resultStr

    push offset resultStr
    call StdOut

    invoke ExitProcess, 0

end start