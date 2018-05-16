.386
.model flat, stdcall
option casemap: none

include C:\masm32\include\kernel32.inc
include C:\masm32\include\user32.inc
includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\user32.lib

.data
    zProcess db "calc.exe",0
    ztitleProcess db "Hello World",0
    MsgError01 db "Processo não encontrado.",0
    MsgSucessoFind db "Processo encontrado.",0
.code
    jmp start
    start:
    push offset zProcess
    push 0
    call FindWindow
       push eax
	   push dword HAFS
       call GetWindowThreadProcessId
       cmp eax,0000h
       je error
       jmp OK
       push 0
       call ExitProcess
     error:
           push 0
           push offset ztitleProcess
           push offset MsgError01
           push 0
           call MessageBox
           push 0
           call ExitProcess
     OK:
        push 0
        push offset ztitleProcess
        push offset MsgSucessoFind
        push 0
        call MessageBox
        push 0 
        call ExitProcess
    end start