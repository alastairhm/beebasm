\ Example 1.3
\ Write ABC characters to Mode 7 screen
\ Using BeebASM assembler

oswrch = &FFEE
screen = &7E40

ORG &2000

.start
    LDA #7          \ Change to Mode 7
    JSR screenmode
    LDA #65         \ ASCII for 'A'
    LDX #66         \ ASCII for 'B'
    LDY #67         \ ASCII for 'C
    STA screen
    STX screen+1
    STY screen+2
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