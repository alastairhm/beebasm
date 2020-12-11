\ Redefine characters using VDU 23
\
\ (c) Alastair Montgomery
\

INCLUDE "../lib/constants.asm"

ORG &2000

.start
    LDX #0
.loop
    LDA table, X
    JSR oswrch
    INX
    CPX #26
    BNE loop
.finish
    RTS
.table
    EQUB 22,06
    EQUB 23,224,8,8,12,7,224,48,16,16
    EQUB 23,225,16,16,48,224,7,12,8,8
    EQUB 224,225,225,224
.end

SAVE "MyCode", start, end
