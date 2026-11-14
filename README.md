# Lenguajes de Interfaz - Unidad 3: Modularizacion

Practicas en lenguaje ensamblador (MASM x86, libreria Irvine32) sobre procedimientos, la pila y macros.

Materia: Lenguajes de Interfaz
Carrera: Ingenieria en Sistemas Computacionales
Institucion: Instituto Tecnologico de Culiacan

## Programas

| Archivo | Tema | Que hace |
|---|---|---|
| `1_procedimiento_basico.asm` | Procedimientos | Llama dos veces al mismo procedimiento, que muestra un mensaje, y despues sigue con el programa. |
| `2_direccion_retorno_pila.asm` | Direccion de retorno en la pila | Llama a un procedimiento dentro de otro y muestra en hexadecimal la direccion de retorno guardada en cada nivel. |
| `3_argumentos_en_pila.asm` | Argumentos en la pila | Manda dos numeros por la pila, los lee con EBP, los multiplica y regresa el resultado en EAX. |
| `4_macros.asm` | Macros | Define macros para mostrar un mensaje y para multiplicar dos numeros. |
| `5_validar_cadena_vacia.asm` | Validacion | Pide un texto y dice si la cadena esta vacia o no. |

## Que se comprueba al ejecutar

**1. Procedimiento basico**
- Se ve "inicio de programa".
- El mensaje "Estoy dentro del procedimiento" aparece dos veces, una por cada llamada.
- Al final se ve "Fin del programa".
- Despues de cada llamada el programa continua en la linea siguiente al `call` (EAX vale 10 y luego 20).

**2. Direccion de retorno en la pila**
- Se imprimen tres valores en hexadecimal.
- Cada uno es la direccion a donde regresa cada procedimiento. Los valores exactos cambian en cada equipo y en cada ejecucion.
- Cada nivel de llamada guarda su propia direccion de retorno.

**3. Argumentos en la pila**
- El programa no imprime nada en pantalla. Se revisa con el depurador.
- Dentro del procedimiento `[ebp+8]` tiene el valor 2 y `[ebp+12]` tiene el valor 1.
- Al terminar, EAX vale 2 (resultado de 2 x 1).
- EBX vuelve a valer 10, porque el procedimiento lo guarda y lo recupera.
- ESP queda igual que antes de los `push`, porque `ret 8` quita los dos argumentos.

**4. Macros**
- Se ve el mensaje de bienvenida y despues "ADIOS".
- Despues se ve `+20`, que es el resultado de 4 x 5 mostrado con `WriteInt`.
- En la vista de desensamblado cada uso de la macro aparece como sus instrucciones completas, sin ningun `call` a la macro.

**5. Validar cadena vacia**
- Si solo se presiona Enter, muestra "La cadena ESTA vacia."
- Si se escribe cualquier texto, muestra "La cadena NO esta vacia."

## Como ejecutarlos

1. Abrir Visual Studio con el proyecto de MASM configurado para Irvine32.
2. Agregar el archivo `.asm` que se quiere probar al proyecto.
3. Compilar y ejecutar con F5 (para el programa 3 usar el depurador con F10 y ver los registros).
