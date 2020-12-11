\ 10 PRINT
\ Using BeebASM assembler
\ (c) Alastair Montgomery

INCLUDE "../lib/constants.asm"
seed = &70

ORG &2000

.start
    LDA #23
    STA seed
    LDA #63
    STA seed+1
    LDX #0
.char
    LDA chartable, X
    JSR oswrch
    INX
    CPX #23
    BNE char
.loop
    JSR random
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
.random
    INCLUDE "../lib/random.asm"
.chartable
    EQUB 22,0
    EQUB 23,224,8,8,12,7,224,48,16,16
    EQUB 23,225,16,16,48,224,7,12,8,8
.end

SAVE "MyCode", start, end