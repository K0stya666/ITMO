section .text
    global exit
    global string_length
    global print_string
    global print_char
    global print_newline
    global print_uint
    global print_int
    global string_equals
    global read_char
    global read_word
    global parse_uint
    global parse_int
    global string_copy

; Принимает код возврата и завершает текущий процесс
exit:
	mov rax, 60
	syscall

; Принимает указатель на нуль-терминированную строку, возвращает её длину
string_length: ; (lobOK)
    	xor rax, rax

	.cikl_start:
		cmp byte [rdi + rax], 0
		je .cikl_end
		inc rax
		jmp .cikl_start
	.cikl_end:
    		ret

; Принимает указатель на нуль-терминированную строку, выводит её в stdout
print_string: ; (lobOK)
	push rdi		; Сохраняем указатель на строку в стек
	call string_length
	pop rsi			; Помещаем ранне значение rdi в rsi
	mov rdx, rax		; Помещаем длину строки в rdx
    	mov rax, 1
	mov rdi, 1
	syscall
	ret

; Принимает код символа и выводит его в stdout
print_char:; (lobOK)
    push rdi
    mov rsi, rsp
    mov rdx, 1
    mov rdi, 1
	mov rax, 1




	syscall
;	.poperdi: pop rdi
	add rsp, 8
	ret

; Переводит строку (выводит символ с кодом 0xA)
print_newline: ; (lobOK)
	mov rdi, 0xA
	call print_char
	ret



; Выводит знаковое 8-байтовое число в десятичном формате
print_int:
;    xor rax, rax
    test rdi, rdi
    .jensi: jns print_uint
    push rdi
    mov rdi, '-'
    call print_char
    pop rdi
    .negrdi: neg rdi
;    ret

; Выводит беззнаковое 8-байтовое число в десятичном формате
; Совет: выделите место в стеке и храните там результаты деления
; Не забудьте перевести цифры в их ASCII коды.
print_uint:
    sub             rsp, 24             ; Резервируем место на стеке (максимум 20 символов + 1 под 0-терминатор)
    xor             rdx, rdx            ; Обнуляем rdx
    mov             rcx, 24             ; Инициализируем счётчик байт
    mov             rsi, 10             ; Устанавливаем делитель 10 для деления на 10
    mov             rax, rdi            ; Копируем число для обработки

    dec             rcx
    mov             byte [rsp + rcx], 0 ; Помещаем нуль-терминатор в конец строки

;    test            rax, rax            ; Проверяем, равно ли число 0
;    jz              .zero_case          ; Если rax == 0, обрабатываем как число "0"

    .stat:
        dec             rcx                 ; Уменьшаем счётчик для записи символов справа налево
        xor             rdx, rdx            ; Обнуляем rdx для деления
        cmp             rax, 10
        jb .end
        div rsi

        add             rdx, '0'            ; Конвертируем остаток в ASCII
        mov             byte [rsp + rcx], dl ; Помещаем символ в строку
        test            rax, rax            ; Проверяем, не равно ли число 0 после деления
        jmp             .stat               ; Если не равно, продолжаем цикл

     .end:
            add rax, '0'
            mov             byte[rsp+rcx], al
            lea             rdi, [rsp+rcx]
            call            print_string

            add             rsp, 24

             ret









; Принимает два указателя на нуль-терминированные строки, возвращает 1 если они равны, 0 иначе
string_equals: ; (lobOK)
    xor rax, rax
    .zaloop:
        mov r11b, byte [rdi]
        cmp r11b, byte [rsi] ; Сравниваем два значения. Если они не равны переходим на завершение
        jne .end
        cmp byte [rsi], 0
        je .eq
        inc rsi
        inc rdi
        jmp .zaloop
    .eq:
        inc rax
    .end:
        ret

; Читает один символ из stdin и возвращает его. Возвращает 0 если достигнут конец потока
read_char: ; (lobOK)
    xor rax, rax
    mov rdi, 0

    push ax
    mov rsi, rsp
    mov rdx, 1
    syscall

    pop ax
    ret

; Принимает: адрес начала буфера, размер буфера
; Читает в буфер слово из stdin, пропуская пробельные символы в начале, .
; Пробельные символы это пробел 0x20, табуляция 0x9 и перевод строки 0xA.
; Останавливается и возвращает 0 если слово слишком большое для буфера
; При успехе возвращает адрес буфера в rax, длину слова в rdx.
; При неудаче возвращает 0 в rax
; Эта функция должна дописывать к слову нуль-терминатор

read_word:
    push r12
    push r13
    push r14

    xor r12, r12
    mov r13, rsi
    mov r14, rdi

    .propusk:
        call read_char
        cmp al, 0x20
        je .propusk
        cmp al, 0x9
        je .propusk
        cmp al, 0xA
        je .propusk

    test al, al
    jz .end

    test r13, r13
    je .zakonchi
    dec r13

    .obrabat:
        cmp r12, r13
        je .zakonchi
        mov byte [r14 + r12], al
        inc r12

    call read_char

    cmp al, 0x20
    je .end
    cmp al, 0x9
    je .end
    cmp al, 0xA
    je .end

    test al, al
    jz .end

    jmp .obrabat


    .end:
        mov byte[r12 + r14], 0
        mov rax, r14
        mov rdx, r12
        pop r14
        pop r13
        pop r12
        ret

    .zakonchi:
        xor rax, rax
        pop r14
        pop r13
        pop r12
        ret
;    .incrementation:
;        inc rdi
;        jmp .propusk


; Принимает указатель на строку, пытается
; прочитать из её начала беззнаковое число.
; Возвращает в rax: число, rdx : его длину в символах
; rdx = 0 если число прочитать не удалось
parse_uint:
    mov r10, 10		; множитель, чтобы сдвигать разряды вправо
					; для записи новых цифр числа

    xor rax, rax
	xor rcx, rcx
	xor r11, r11

	.zaloop:
		mov cl, [rdi]

		cmp cl, 0
		je .end

		cmp cl, '0'
		jb .end

		cmp cl, '9'
		ja .end

		mul r10
		add rax, rcx
		sub rax, '0'

		inc rdi
		inc r11
		jmp .zaloop

	.end:
		mov rdx, r11
		ret



parse_int:
    xor rax, rax
	xor rcx, rcx
	xor r11, r11
	mov cl, [rdi]
	cmp cl, '-'
	je .negative
	cmp cl, '+'
	je .pozitive
	cmp cl, ' '
	je .end
	cmp cl, '0'
	jb .end
	cmp cl, '9'
	ja .end
	jmp parse_uint
	.pozitive:
		cmp byte[rdi+1], ' '
		je .end
		cmp byte[rdi+1], 0
		je .end
		cmp byte[rdi+1], '0'
		jb .end
		cmp byte[rdi+1], '9'
		ja .end
		inc rdi
		jmp parse_uint
	.negative:
		cmp byte[rdi+1], ' '
		je .end
		cmp byte[rdi+1], 0
		je .end
		cmp byte[rdi+1], '0'
		jb .end
		cmp byte[rdi+1], '9'
		ja .end
		inc rdi		
		push rcx
		call parse_uint
		inc rdx
		pop rcx
		neg rax
	.end:
		ret



; Принимает указатель на строку, указатель на буфер и длину буфера
; Копирует строку в буфер
; Возвращает длину строки если она умещается в буфер, иначе 0
string_copy:
    push rdi
    push rsi
    push rdx

    call string_length

    pop rdx
    pop rdi
    pop rsi

    cmp rax, rdx

    jae .exception
    mov rcx, rax

    rep movsb


    .end:
        mov byte [rdi], 0
        ret

    .exception:
            xor rax, rax
            ret





