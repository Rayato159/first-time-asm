include /masm32/include/masm32rt.inc

.data
    counting  dd 10
    numbers   dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    outputMsg db "Sum: ", 0
    result    dd 0
    resultStr db 32 dup(?)

.code
main proc
         mov    ecx, counting
         lea    esi, numbers
         mov    eax, 0

    sum: 
         mov    ebx, [esi]
         add    eax, ebx
         add    esi, 4
         dec    ecx
         cmp    ecx, 0
         ja     sum

         mov    result, eax

         invoke StdOut, addr outputMsg
         invoke dwtoa, result, addr resultStr
         invoke StdOut, addr resultStr

         invoke ExitProcess, 0
    
main endp

end main