\ Example 1.1
\ Write ABC characters to Mode 7 screen
\ Using BeebASM assembler

oswrch = &FFEE

ORG &2000

.start
    LDA #22     \ Change to Mode 7
    JSR oswrch
    LDA #7
    JSR oswrch
    LDA #65
    LDX #66
    LDY #67
    STA 32320
    STX 32321
    STY 32322
.finish
    RTS
.end

SAVE "MyCode", start, end