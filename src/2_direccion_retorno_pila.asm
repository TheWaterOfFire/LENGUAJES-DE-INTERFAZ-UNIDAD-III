INCLUDE Irvine32.inc

.data

.code
main PROC
	; en esp esta la direccion a donde regresa main
	mov eax, [esp]
	call WriteHex
	call Crlf

	; llama al primer procedimiento
	call procUno
	exit
main ENDP

procUno PROC
	; en esp esta la direccion para regresar a main
	mov eax, [esp]
	call WriteHex
	call Crlf

	; llama al segundo procedimiento
	call procDos

	; regresa a main
	ret
procUno ENDP

procDos PROC
	; en esp esta la direccion para regresar a procUno
	mov eax, [esp]
	call WriteHex
	call Crlf

	; regresa a procUno
	ret
procDos ENDP

END main
