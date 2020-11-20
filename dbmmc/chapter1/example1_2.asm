\ Example 1.2
\ Write ABC characters to Mode 7 screen
\ Using BeebASM assembler

oswrch = &FFEE
screen = 32320

ORG &2000

.start
    LDA #22     \ Change to Mode 7
    JSR oswrch
    LDA #7
    JSR oswrch
    LDA #65
    LDX #66
    LDY #67
    STA screen
    STX screen+1
    STY screen+2
.finish
    RTS
.end

SAVE "MyCode", start, end