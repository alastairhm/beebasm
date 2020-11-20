\ Example 3.3 ADDING

INCLUDE "../../lib/constants.asm"
screen = &7E40
mode   = 6
data   = &70

ORG &2000

.start
    LDA mode
    JSR screenmode
    CLC
    LDA #24
    STA data
    LDA #32
    ADC data
    JSR printhex
.finish
    RTS
.screenmode
    INCLUDE "../../lib/screenmode.asm"
.printhex
    INCLUDE "../../lib/printhex.asm"
.tab
    INCLUDE "../../lib/tab.asm"
.end

SAVE "MyCode", start, end