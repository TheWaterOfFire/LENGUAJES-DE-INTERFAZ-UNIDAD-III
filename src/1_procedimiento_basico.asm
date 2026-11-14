INCLUDE Irvine32.inc

.data
	mensajeInicio BYTE "inicio de programa",0
	mensajeProcedimiento BYTE "Estoy dentro del procedimiento",0
	mensajeFin BYTE "Fin del programa",0

.code
main PROC
	; muestra el mensaje de inicio
	mov edx, OFFSET mensajeInicio
	call WriteString
	call Crlf

	; primera vez que se llama al procedimiento
	call mensajeAviso

	; esta instruccion se ejecuta cuando el procedimiento termina
	mov eax, 10

	; segunda vez que se llama al mismo procedimiento
	call mensajeAviso

	; otra vez se continua justo despues del call
	mov eax, 20

	; muestra el mensaje final
	mov edx, OFFSET mensajeFin
	call WriteString
	call Crlf

	exit
main ENDP

mensajeAviso PROC
	; muestra el mensaje del procedimiento
	mov edx, OFFSET mensajeProcedimiento
	call WriteString
	call Crlf

	; regresa a la linea que sigue despues del call
	ret
mensajeAviso ENDP

END main
