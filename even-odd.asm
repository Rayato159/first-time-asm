include /masm32/include/masm32rt.inc

.data
        prompt       db "Enter a number: ", 0
        inputBuffer  db 32 dup(?)
        inputNumber  dd 0
        oddResponse  db "The number is odd.", 0
        evenResponse db "The number is even.", 0

.code
        start:  
                invoke StdOut, addr prompt

                push   32
                push   offset inputBuffer
                call   StdIn
                invoke atodw, offset inputBuffer
                mov    inputNumber, eax

                and    eax, 1
                mov    ebx, eax
                cmp    ebx, 0
                je     is_even
                invoke StdOut, addr oddResponse
                jmp    finally
        is_even:
                invoke StdOut, addr evenResponse
        finally:
                invoke ExitProcess, 0

end start