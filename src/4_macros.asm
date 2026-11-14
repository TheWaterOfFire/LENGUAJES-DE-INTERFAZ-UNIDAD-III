INCLUDE Irvine32.inc

; macro que muestra un texto y cambia de linea
MostrarMensaje MACRO texto
	mov edx, OFFSET texto
	call WriteString
	call Crlf
ENDM

; macro que multiplica dos numeros y muestra el resultado
Multi MACRO num1, num2
	mov eax, num1
	imul eax, num2
	call WriteInt
	call Crlf
ENDM

.data
	mensajeBienvenida BYTE "BIENVENIDO AL SISTEMA DE GLOWUP MAKEUP SINALOA", 0
	mensajeFin BYTE "ADIOS", 0

.code
main PROC
	; cada uso de la macro pone sus instrucciones en este lugar
	MostrarMensaje mensajeBienvenida
	MostrarMensaje mensajeFin

	; multiplica 4 por 5 y muestra 20
	Multi 4, 5

	exit
main ENDP

END main
