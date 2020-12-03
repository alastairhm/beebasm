\ Write characters to Mode 7 screen
\ Using Indirect Indexing
\ Using BeebASM assembler

oswrch = &FFEE
screen = &7C00
addr = &70
table = &80

ORG &2000

.start
    FOR n, 0, 24, 1
        PRINT n
        LDA #LO(screen+(n*40))
        STA table+(n*2)
        LDA #HI(screen+(n*40))
        STA table+1+(n*2)
    NEXT
.mode
    LDA #7          \ Change to Mode 7
    JSR screenmode
    LDY #4
.loop
    LDA #48
    STA (table+20), Y
    DEY
    BPL loop

.finish
    RTS
.screenmode
    INCLUDE "../lib/screenmode.asm"

.end


SAVE "MyCode", start, end