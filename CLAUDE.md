# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal collection of BBC Micro 6502 assembly source files, assembled with
[BeebAsm](https://github.com/stardot/beebasm/) (an external tool, not vendored in this repo —
it must be installed and on `PATH` as `beebasm`). There is no compiled/generated output checked
in; `.asm` sources are assembled on demand into `.ssd` disc images.

Related blog posts: https://blog.0x32.co.uk/posts/10print6502/ and https://blog.0x32.co.uk/posts/6502/

## Layout

- `lib/` — small reusable routines meant to be pulled in with `INCLUDE "../../lib/xxx.asm"`
  (path is relative to the including file, so the number of `../` depends on the includer's
  depth). Each file is a bare routine body, not a standalone program — no `ORG`/`SAVE`, and no
  own label for the entry point in most cases; the includer supplies the label just above the
  `INCLUDE` line (see `template.asm`'s `.screenmode` / `INCLUDE "../../lib/screenmode.asm"`
  pattern). `constants.asm` instead just defines shared symbols (e.g. `oswrch = &FFEE`).
- `examples/` — small standalone one-off programs demonstrating a single technique (hello world,
  10 PRINT, Mode 7 peek/poke/position, VDU calls, RNG). Each defines its own `.start`/`.finish`/
  `.end` and calls `SAVE "MyCode", start, end`.
- `dbmmc/` — worked examples from the book *Discovering BBC Micro Machine Code* by A.P.
  Stephenson, translated from the book's BASIC-hosted assembler into BeebAsm, organized by
  chapter (`chapter1/`, `chapter3/`, ...).
- `template.asm` — minimal skeleton for starting a new program that uses the `lib/` routines.

## Build

There is no single global build; each `.asm` file is assembled independently into its own disc
image.

- Top-level helper (`./build`, identical to `./build.sh`): assembles a file into an `.ssd` named
  after it and marks it as the boot program:
  ```
  ./build <name-without-extension>   # e.g. ./build template -> reads template.asm, writes template.ssd
  ```
  This just runs `beebasm -i ${1}.asm -do ${1}.ssd -boot MyCode -v`.
- `examples/Makefile` targets (run from inside `examples/`, with `CODE` and `JSBEEB` set):
  ```
  make build CODE=hello JSBEEB=/path/to/jsbeeb   # assembles, copies the .ssd into a jsbeeb discs dir, and opens it
  make clean CODE=hello                          # removes hello.ssd
  make cleanall                                  # removes all .ssd files in examples/
  ```
  `JSBEEB` should point at a local checkout/install of the [jsbeeb](https://github.com/mattgodbolt/jsbeeb)
  emulator that serves discs from a `discs/` directory.
- `dbmmc/` and `template.asm` have no Makefile; assemble them directly with `beebasm` or via
  `./build <path-without-extension>` from the repo root (e.g. `./build dbmmc/chapter1/example1_1`).

There are no automated tests; verifying a program means assembling it and running the resulting
`.ssd` in an emulator (jsbeeb or similar) or on real hardware.

## Conventions when adding code

- Comments use BeebAsm's `\` line-comment syntax, not `;`.
- Every standalone program follows the same skeleton: `ORG &2000`, a `.start` label, an entry
  routine, a `.finish` / `RTS`, an `.end` label, and a trailing `SAVE "MyCode", start, end`.
- Shared zero-page/system constants (like `oswrch = &FFEE`) are pulled from `lib/constants.asm`
  via `INCLUDE` rather than redefined per file — reuse that include instead of re-declaring
  `oswrch`/`osasci`/etc. in a new file.
