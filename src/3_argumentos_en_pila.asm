INCLUDE Irvine32.inc

.data

.code
main PROC
	; ebx guarda un valor que no se debe perder
	mov ebx, 10

	; se mandan los dos numeros por la pila
	push 1
	push 2

	; llama al procedimiento que multiplica
	call sumarPila

	nop
	exit
main ENDP

sumarPila PROC
	; guarda el ebp anterior y lo usa como punto de referencia
	push ebp
	mov ebp, esp

	; guarda ebx para devolverlo igual al final
	push ebx

	; toma los numeros de la pila usando ebp
	mov eax, [ebp+8]
	mov ebx, [ebp+12]

	; multiplica eax por ebx y deja el resultado en eax
	imul eax, ebx

	; devuelve los valores guardados en orden inverso
	pop ebx
	pop ebp

	; regresa y quita los 8 bytes de los dos numeros
	ret 8
sumarPila ENDP

END main
