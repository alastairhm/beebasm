\ Example 1.3
\ Write characters to Mode 7 screen
\ Using BeebASM assembler

oswrch = &FFEE
screen = &7C00+40

ORG &2000

.start
    LDA #7          \ Change to Mode 7
    JSR screenmode
    LDX #39
    .loop
    LDA #48
    STA screen, X
    DEX
    BPL loop

.finish
    RTS
.screenmode
    PHA
    LDA #22
    JSR oswrch
    PLA
    JSR oswrch
    RTS
.end

SAVE "MyCode", start, end