**Português** | [ English ](README.md)

# Ordenação de Vetor e Calculadora de Soma em Assembly (SMS)

Aplicação desenvolvida em Assembly x86 para o simulador educacional SMS (Simple Machine Simulator). O programa lê 5 números do teclado, realiza a ordenação crescente utilizando a lógica do Selection Sort, exibe os números ordenados na tela de vídeo e apresenta a soma total em um display de 7 segmentos.

## Funcionalidades

- **Leitura e Validação:** Lê 5 dígitos (`0-9`) do teclado e descarta caracteres ASCII inválidos.
- **Ordenação em Memória (Selection Sort):** Manipula os endereços da memória RAM (`90h-94h`) para ordenar os elementos.
- **Saída em Vídeo:** Converte os valores ASCII e escreve a sequência ordenada na memória de vídeo (`C0h`).
- **Cálculo de Soma e Display:** Realiza o somatório dos elementos, separa dezenas e unidades utilizando divisão (`DIV`) e resto (`MOD`), e utiliza uma tabela de conversão (`ORG B0h`) para acionar o display de 7 segmentos (`OUT 02`).

## Mapeamento de Memória e Periféricos

| Recurso | Endereço / Porta | Descrição |
| :--- | :--- | :--- |
| Porta do Teclado | `00h` | Leitura de caracteres ASCII (`IN 00`) |
| Display de 7 Segmentos | `02h` | Saída dos dígitos calculados (`OUT 02`) |
| Vetor de Dados | `90h - 94h` | Armazenamento dos 5 números digitados |
| Memória de Vídeo | `C0h` | Endereço para exibição de texto na tela |
| Tabela de Conversão | `B0h` | Mapeamento de bits para os LEDs do display (`0-9`) |

## Conceitos de Baixo Nível Utilizados

- Manipulação de vetores usando endereçamento indireto de memória (`[BL]`, `[DL]`)
- Algoritmo de ordenação via instruções de desvio condicional (`JS`, `JZ`, `JNZ`)
- Operações com Pilha (`PUSH`, `POP`) para preservar registradores
- Instruções aritméticas (`ADD`, `SUB`, `INC`, `DIV`, `MOD`)
- Criação de tabela de busca (*lookup table*) com a diretiva `DB`

## Como Executar

1. Abra o ambiente **Simple Machine Simulator (SMS)**.
2. Carregue o código no editor do simulador.
3. Monte e inicie a execução do programa.
4. Digite 5 números individuais no **Teclado** para observar a ordenação e o cálculo da soma.
