\ 10 PRINT
\ Using BeebASM assembler
\ Alastair Montgomery

INCLUDE "../lib/constants.asm"
screen = &7C00
seed = &70
bitmask = &72

ORG &2000

.start
.mode
    LDA #4
    JSR screenmode
    LDA #23
    STA seed
    LDA #23
    STA seed+1
    LDA #1
    STA bitmask
.loop
    JSR random
    STA bitmask
    LDA #1
    BIT bitmask
    BMI two
.one
    LDA #47
    JMP print
.two
    LDA #92
.print
    JSR oswrch
    JMP loop

.finish
    RTS
.screenmode
    INCLUDE "../lib/screenmode.asm"
.random
    INCLUDE "../lib/random.asm"
.end

SAVE "MyCode", start, end