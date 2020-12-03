\ Write characters to Mode 7 screen
\ Using Indirect Indexing
\ Using BeebASM assembler
\ Help from https://twitter.com/0xC0DE6502

oswrch = &FFEE
screen = &7C00
addr = &70
ax = &80
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
    JSR putchar
    DEY
    BPL loop
    LDY #12
    LDX #39
    LDA #66
.loop2
    JSR putchar
    DEX
    BPL loop2

.finish
    RTS
.screenmode
    INCLUDE "../lib/screenmode.asm"
.putchar
    PHA
    STY ay
    LDA charrow_lo, Y
    STA addr
    LDA charrow_hi, Y
    STA addr + 1
    TXA
    TAY
    PLA
    STA (addr), Y
    LDY ay
    RTS
.charrow_lo
    FOR n,0,24
        EQUB LO(screen+n*40)
    NEXT
.charrow_hi
    FOR n,0,24
        EQUB HI(screen+n*40)
    NEXT
.end

SAVE "MyCode", start, end