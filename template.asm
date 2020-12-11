\ Example

INCLUDE "../../lib/constants.asm"
mode  = 7

ORG &2000

.start
    LDA mode
    JSR screenmode
.finish
    RTS
.screenmode
    INCLUDE "../../lib/screenmode.asm"
.end

SAVE "MyCode", start, end
