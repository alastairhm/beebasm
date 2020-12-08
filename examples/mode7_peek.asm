\ Write characters to Mode 7 screen
\ Using Indirect Indexing
\ Using BeebASM assembler
\ Help from https://twitter.com/0xC0DE6502

oswrch = &FFEE
screen = &7C00
addr = &70
ay = &81

ORG &2000

.start
.mode
    LDA #7          \ Change to Mode 7
    JSR screenmode
    LDA #65
    LDY #24
    LDX #20
.loop
    JSR mode7_poke
    DEY
    BPL loop
    LDY #12
    LDX #39
    LDA #66
.loop2
    JSR mode7_poke
    DEX
    BPL loop2
    LDX #0
    LDY #0
    JSR tab
    LDX #20
    LDY #12
    JSR mode7_peek
    JSR printhex
    LDX #0
    LDY #1
    JSR tab
    LDX #19
    LDY #19
    JSR printhex

.finish
    RTS
.screenmode
    INCLUDE "../lib/screenmode.asm"
.putchar
    INCLUDE "../lib/m7pp.asm"
.printhex
    INCLUDE "../lib/printhex.asm"
.tab
    INCLUDE "../lib/tab.asm"
.end

SAVE "MyCode", start, end