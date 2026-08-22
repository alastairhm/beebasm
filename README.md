# BBC Micro 6502 Assembly

Adventures in 6502 assembler.

## On the blog

* https://blog.0x32.co.uk/posts/10print6502/
* https://blog.0x32.co.uk/posts/6502/

## Code

`template.asm` — starter skeleton for a new program: sets mode 7 via `lib/screenmode.asm` then returns.

### `lib/` — reusable routines, pulled in with `INCLUDE`

| File | Description |
| --- | --- |
| `constants.asm` | Shared constant: `oswrch` (the `OSWRCH` vector, `&FFEE`). |
| `screenmode.asm` | Switches screen MODE to the value in `A` via `VDU 22,<mode>`. |
| `m7pp.asm` | `mode7_poke`/`mode7_peek`: write/read a character at MODE 7 text column `X`, row `Y`, via a precomputed per-row screen address table. |
| `printhex.asm` | Prints the byte in `A` as two hex digits via `OSWRCH`. |
| `random.asm` | 16-bit xorshift-style pseudo-random number generator using a `seed` zero-page pair; returns a byte in `A`. |
| `tab.asm` | Positions the text cursor at column `X`, row `Y` via `VDU 31,X,Y`. |

### `examples/` — standalone demo programs

| File | Description |
| --- | --- |
| `hello.asm` | Prints "Hello world!" to the screen by walking a zero-terminated string with `OSASCI`. |
| `10print.asm` | The classic "10 PRINT" maze generator, using `lib/random.asm` to pick between two diagonal block characters. |
| `random.asm` | Variant maze generator that draws `/` and `\` based on a bitmask derived from `lib/random.asm`. |
| `vdu.asm` | Redefines two user-defined characters via `VDU 23` and prints them. |
| `mode7.asm` | Fills the bottom row of a MODE 7 screen with `'0'` characters using direct indexed addressing. |
| `mode7_ii.asm` | Same as `mode7.asm` but using indirect indexed addressing (`(addr),Y`) and `lib/screenmode.asm`. |
| `mode7_position.asm` | Builds a lookup table of MODE 7 row start addresses with a `FOR`/`NEXT` loop, then writes into one row via the table. |
| `mode7_poke.asm` | Demonstrates `lib/m7pp.asm`'s `mode7_poke` by plotting a column and a row of characters at given text coordinates. |
| `mode7_peek.asm` | Extends `mode7_poke.asm` to also `mode7_peek` characters back off the screen and print them as hex via `lib/printhex.asm` and `lib/tab.asm`. |

### `dbmmc/` — examples from *Discovering BBC Micro Machine Code* (A.P. Stephenson), translated to BeebAsm

| File | Description |
| --- | --- |
| `chapter1/example1_1.asm` | Writes "ABC" to a MODE 7 screen at a literal address using `STA`/`STX`/`STY`. |
| `chapter1/example1_2.asm` | Same as `example1_1.asm` (writes "ABC" at a literal screen address). |
| `chapter1/example1_3.asm` | Same idea, writing to a named `screen` address (`&7E40`) instead of a raw literal. |
| `chapter1/example1_extra.asm` | Same as `example1_3.asm`, but switches mode via a local `.screenmode` subroutine instead of inline `VDU 22` codes. |
| `chapter3/example3_1.asm` | Writes "ABC" to a MODE 7 screen by incrementing `X` and storing, using `lib/screenmode.asm`/`lib/constants.asm`. |
| `chapter3/example3_2.asm` | Demonstrates `TAX`/`TAY`/`NOP` register-transfer and no-op instructions after a mode switch. |
| `chapter3/example3_3.asm` | "ADDING" example: adds two values with `CLC`/`ADC` and prints the result in hex via `lib/printhex.asm`. |
| `chapter3/example3_extra.asm` | Positions the cursor with `lib/tab.asm` and prints two hex values via `lib/printhex.asm`. |

## Working with Claude Code

See [CLAUDE.md](CLAUDE.md) for repo layout and build instructions used by Claude Code.
See [CHANGELOG.md](CHANGELOG.md) for a log of notable changes.
