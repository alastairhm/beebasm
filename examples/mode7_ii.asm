\ Write characters to Mode 7 screen
\ Using Indirect Indexing
\ Using BeebASM assembler

oswrch = &FFEE
screen = &7C00+80
addr = &70

ORG &2000

.start
    LDA #7          \ Change to Mode 7
    JSR screenmode
    LDA #LO(screen)
    STA addr
    LDA #HI(screen)
    STA addr+1
    LDY #39
    .loop
    LDA #48
    STA (addr), Y
    DEY
    BPL loop

.finish
    RTS
.screenmode
    INCLUDE "../lib/screenmode.asm"
.end

SAVE "MyCode", start, end