include /masm32/include/masm32rt.inc

.data
prompt db "Input a string here: ", 0
message db 64  dup(?)
response db "Your name is: ", 0

.code

start:
push offset prompt
call StdOut

push 64
push offset message
call StdIn

push offset response
call StdOut
push offset message
call StdOut

invoke ExitProcess, 0

end start