[ Português ](README.pt-BR.md) | **English**

# Array Sorting and Sum Calculator in Assembly (SMS)

A low-level x86 Assembly application built for the SMS (Simple Machine Simulator). The program captures 5 numeric inputs from the keyboard, sorts them in ascending order using Selection Sort, outputs the sorted values to the screen, and displays their calculated sum on a 7-segment display.

## Features

- **Input Capture & Validation:** Reads 5 digits (`0-9`) from the keyboard and filters out invalid ASCII values.
- **In-Memory Selection Sort:** Iterates through memory addresses (`90h-94h`) to reorder numbers in-place.
- **Screen Output:** Converts ASCII values to numeric equivalents and writes sorted data to Video RAM (`C0h`).
- **Math Operations & 7-Seg Display:** Accumulates the sum, separates digits using division (`DIV`) and modulo (`MOD`), and converts values via a lookup table (`ORG B0h`) to drive the 7-segment display output (`OUT 02`).

## I/O & Memory Mapping

| Resource | Address / Port | Description |
| :--- | :--- | :--- |
| Keyboard Port | `00h` | Reads ASCII input (`IN 00`) |
| 7-Seg Display Port | `02h` | Outputs formatted digits (`OUT 02`) |
| Data Array | `90h - 94h` | Storage for 5 input numbers |
| Display Memory | `C0h` | VDU text output location |
| Lookup Table | `B0h` | 7-segment LED bitmask mappings (`0-9`) |

## Low-Level Concepts Applied

- Array manipulation using indirect memory addressing (`[BL]`, `[DL]`)
- In-place sorting algorithm implemented via conditional branching (`JS`, `JZ`, `JNZ`)
- Stack operations (`PUSH`, `POP`) for temporary register context switching
- Arithmetic instructions (`ADD`, `SUB`, `INC`, `DIV`, `MOD`)
- Custom lookup table mapping (`DB`) for hardware peripherals

## How to Run

1. Open the **Simple Machine Simulator (SMS)** environment.
2. Load the source code into the editor.
3. Assemble and execute the program.
4. Input 5 single-digit numbers sequentially using the **Keyboard** peripheral.
