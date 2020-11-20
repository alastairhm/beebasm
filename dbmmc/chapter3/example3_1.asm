\ Example 3.1

INCLUDE "../../lib/constants.asm"
screen = &7E40

ORG &2000

.start
    LDA #7
    JSR screenmode
    LDX #65
    STX screen
    INX
    STX screen+1
    INX
    STX screen+2
.finish
    RTS
.screenmode
    INCLUDE "../../lib/screenmode.asm"
.end

SAVE "MyCode", start, end