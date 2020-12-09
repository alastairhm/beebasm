\ Write and read character from Mode 7 Screen
\ (c) Alastair Montgomery
\

.mode7_poke
    PHA
    STY store_y
    LDA charrow_lo, Y
    STA addr
    LDA charrow_hi, Y
    STA addr + 1
    TXA
    TAY
    PLA
    STA (addr), Y
    LDY store_y
    RTS
.mode7_peek
    STY store_y
    LDA charrow_lo, Y
    STA addr
    LDA charrow_hi, Y
    STA addr + 1
    TXA
    TAY
    LDA (addr), Y
    LDY store_y
    RTS
.charrow_lo
    FOR n,0,24
        EQUB LO(screen+n*40)
    NEXT
.charrow_hi
    FOR n,0,24
        EQUB HI(screen+n*40)
    NEXT
.store_y
    EQUB 00