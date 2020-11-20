\ Example 3.2

INCLUDE "../../lib/constants.asm"
screen = &7E40

ORG &2000

.start
    LDA #7
    JSR screenmode
    LDX #0
    TAX
    TAY
    STA screen
    NOP
    NOP
.finish
    RTS
.screenmode
    INCLUDE "../../lib/screenmode.asm"
.end

SAVE "MyCode", start, end