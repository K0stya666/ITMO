section .data
    prompt1 db "Enter the first number: ", 0
    prompt2 db "Enter the second number: ", 0
    prompt3 db "Select operation (+ or *): ", 0

    result_msg db "Result: %d", 10, 0 ; Только для целых

    input_format db "%d", 0
    input_op_format db " %c", 0 ; Для чего это?

    num1 dd 0
    num2 dd 0
    operation db 0
    result dd 0

section .text
    global _start
    extern printf, scanf

_start:
    mov rdi, prompt1
    call printf                 ; Запрос на 1-ое число

    mov rdi, input_format       ; Ввод 1-го числа с помощью scanf
    mov rsi, num1
    call scanf

    mov rdi, prompt2            ; Запрос на 2-ое число
    call printf

    mov rdi, input_format       ; Ввод 2-го числа с помощью scanf
    mov rsi, num2
    call scanf

    mov rdi, prompt3            ; Запрос на операцию
    call printf

    mov rdi, input_op_format    ; Ввод операции
    mov rsi, operation
    call scanf

    ; Загружаем числа в регистры
    mov eax, [num1]
    mov ebx, [num2]

    movzx ecx, byte [operation] ; Загрузка символа операции

    cmp ecx, '+'
    je summa

    cmp ecx, '*'
    je multiplication

    jmp end

summa:
    add eax, ebx
    jmp save_result

multiplication:
    imul eax, ebx

save_result:
    mov [result], eax

    ; Вывод с помощью printf
    mov rdi, result_msg
    mov rsi, [result]
    xor rax, rax                ; Очистка rax для вызова printf

end:
    mov rdi, result_msg
    call printf

    mov rdi, result
    call printf

    xor rdi, rdi
    call exit

exit:
    mov rax, 60
    syscall

