include /masm32/include/masm32rt.inc

.data

hello_world db "Hello PHP", 0

.code

start:
    push offset hello_world
    call StdOut
    invoke ExitProcess, 0

end start