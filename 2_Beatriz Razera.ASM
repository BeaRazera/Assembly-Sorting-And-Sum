CLO

MOV CL,90
MOV DL,0

Rep:
IN 00       ;chama o teclado para o usuário digitar um número
CMP AL,30   ;compara o valor digitado com "0" em hexa
JS Rep      ;se o valor comparado for menor que "0", desvia para rep
CMP AL,40   ;compara o valor digitado com 40
            ;nesse caso, foi utilizado 40 e não 39 porque foi usado JNS, que desvia quando o valor
            ;é maior ou igual ao valor comparado
JNS Rep     

MOV [CL],AL ;o valor que está em AL é copiado em [CL] (memória)
INC CL      ;incrementa CL, nesse caso de 90 vai para 91
CMP CL,95   ;compara CL com 95
JNZ Rep     ;comparei CL com 95 porque como começa em 90, os 5 números ficam nos endereços 90, 91, 92, 93 e 94
            ;ou seja, não há nada registrado em 95. Sendo assim, tem que ter um desvio caso o valor não seja 95
            ;para que continue tendo valores a serem adicionados na memória até esse limite

MOV BL,8F   ;aqui, utilizei 8F em vez de 90 porque preciso que comece em 90. Se fosse 90, seria incrementado
            ;e começaria em 91.

Rep_2:
INC BL      ;incrementa em BL
CMP BL,94   ;compara BL com 94
JZ Visor    ;diferentemente de algumas linhas atrás, aqui eu preciso que seja desviado quando o valor for igual a
            ;por isso uso JZ
PUSH BL     ;guardo na pilha o valor de BL
POP DL      ;recupero o valor de BL no registrador DL, ou seja, troquei o registrador porque preciso que
            ;BL continue sendo 90, assim DL pode ser incrementado sem BL perder o valor original

Volta:
MOV AL,[BL] ;o valor que está no endereço (memória) BL é copiado em AL
INC DL      ;incrementa DL
CMP DL,95   ;compara DL com 95(mesma justifcativa do CL lá em cima)
JZ Rep_2    ;desvia para Rep_2 caso o valor comparado seja maior que 94 (ou seja, 95)
MOV CL,[DL] ;o valor que está no endereço DL (memória) é copiado no CL
SUB CL,AL   ;subtraio AL de CL
JS Troca    ;caso o valor seja menor, desvia para a troca
JMP Volta   ;caso não seja menor, desvia para volta e repete as instruções até que JS seja verdadeiro

Troca:
MOV CL,[DL] ;o valor que está no endereço (memória) DL é copiado em CL
MOV AL,[BL] ;o valor que está no endereço (memória) BL é copiado em AL
MOV [BL],CL ;o valor de CL é copiado no endereço BL (memória)
MOV [DL],AL ;o valor de AL é copiado no endereço AL (memória)
JMP Volta   ;depois de fazer a troca, desvia para volta para repetir o processo

Visor:      ;separei os "visores" porque é necessário atribuir os valores iniciais nos registradores para
            ;em Visor2, aparecerem os valores ordenados 
MOV AL,90   ;o valor  de AL é 90 porque foi o valor que atribuí no começo do programa
MOV CL,C0   ;atribuí C0 para CL porque assim eu incremento CL sem substituir o valor que está em C0
MOV DL,0

Visor2:
MOV BL,[AL] ;o valor que está no endereço (memória) AL é copiado em BL
MOV [CL],BL ;o valor de CL é copiado no endereço BL (memória)
SUB BL,30   ;subtraio 30 de BL para que apareça na tela o número em decimal e não em hexa
ADD DL,BL   ;adiciono em DL, BL (aqui é para fazer a soma dos números digitados)
INC AL      ;incremento AL
INC CL      ;incremento CL 
CMP AL,95   ;comparo AL com 95
JNZ Visor2  ;caso o valor seja diferente de 95, as instruções são repetidas

            ;a partir daqui é o funcionamento do display de 7 segmentos para que apareça a soma dos números que
            ;foram ordenados. foi a parte mais difícil de elaborar no programa, então não sei como explicar da
            ;melhor forma linha por linha, mas usei os conceitos de divisão e resto para conseguir apresentar
            ;os dois digitos no display
PUSH DL
DIV DL,A
MOV CL,B0
ADD CL,DL
MOV AL,[CL]
DEC AL
OUT 02
POP DL
MOD DL,A
MOV CL,B0
ADD CL,DL
MOV AL,[CL]
OUT 02


ORG B0     ;para o display de 7 segmentos funcionar, preciso estabelecer os valores em hexa nessa tabela
           ;coloquei no final do programa para não precisar colocar um desvio no começo do programa
DB FB      ;0
DB 0B      ;1
DB B7      ;2
DB 9F      ;3
DB 4F      ;4
DB DD      ;5
DB FD      ;6
DB 8B      ;7
DB FF      ;8
DB CF      ;9

END
