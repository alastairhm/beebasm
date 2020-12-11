\ 10 PRINT
\ Using BeebASM assembler
\ (c) Alastair Montgomery

INCLUDE "../lib/constants.asm"
screen = &7C00
seed = &70
bitmask = &72

ORG &2000

.start
.mode
    LDA #0
    JSR screenmode
    LDA #23
    STA seed
    LDA #23
    STA seed+1
    LDA #1
    STA bitmask
    LDX #0
.char
    LDA chartable, X
    JSR oswrch
    INX
    CPX #21
    BNE char
.loop
    JSR random
    STA bitmask
    LDA #1
    BIT bitmask
    BMI two
.one
    LDA #224
    JMP print
.two
    LDA #225
.print
    JSR oswrch
    JMP loop
.finish
    RTS
.screenmode
    INCLUDE "../lib/screenmode.asm"
.random
    INCLUDE "../lib/random.asm"
.chartable
    EQUB 23,224,8,8,12,7,224,48,16,16
    EQUB 23,225,16,16,48,224,7,12,8,8
.end

SAVE "MyCode", start, end