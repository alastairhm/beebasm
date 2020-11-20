\ Example

INCLUDE "../../lib/constants.asm"
screen = &7E40
model  = 7

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