INCLUDE Irvine32.inc

.data
	cadena BYTE 50 DUP(0)
	msgPedir BYTE "Ingresa una cadena (o presiona Enter para dejarla vacia): ", 0
	msgVacia BYTE "La cadena ESTA vacia.", 0
	msgNoVacia BYTE "La cadena NO esta vacia.", 0

.code
main PROC
	; muestra el mensaje que pide el texto
	mov edx, OFFSET msgPedir
	call WriteString

	; lee el texto que escribe el usuario
	mov edx, OFFSET cadena
	mov ecx, SIZEOF cadena
	call ReadString

	; revisa el primer caracter de la cadena
	cmp BYTE PTR [cadena], 0
	je EsVacia

NoEsVacia:
	; el primer caracter no es cero, entonces si hay texto
	mov edx, OFFSET msgNoVacia
	call WriteString
	call Crlf
	jmp Fin

EsVacia:
	; el primer caracter es cero, entonces no hay texto
	mov edx, OFFSET msgVacia
	call WriteString
	call Crlf

Fin:
	exit
main ENDP

END main
